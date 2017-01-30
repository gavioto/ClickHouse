#include <DB/Interpreters/DDLWorker.h>
#include <DB/Interpreters/executeQuery.h>

namespace DB
{

namespace ErrorCodes
{
	extern const int UNKNOWN_ELEMENT_IN_CONFIG;
	extern const int INVALID_CONFIG_PARAMETER;
}

namespace {

/// Helper class which extracts from the ClickHouse configuration file
/// the parameters we need for operating the resharding thread.
class Arguments final
{
public:
	Arguments(const Poco::Util::AbstractConfiguration & config, const std::string & config_name)
	{
		Poco::Util::AbstractConfiguration::Keys keys;
		config.keys(config_name, keys);

		for (const auto & key : keys)
		{
			if (key == "task_queue_path")
				task_queue_path = config.getString(config_name + "." + key);
			else
				throw Exception{"Unknown parameter in resharding configuration", ErrorCodes::UNKNOWN_ELEMENT_IN_CONFIG};
		}

		if (task_queue_path.empty())
			throw Exception{"Resharding: missing parameter task_queue_path", ErrorCodes::INVALID_CONFIG_PARAMETER};
	}

	Arguments(const Arguments &) = delete;
	Arguments & operator=(const Arguments &) = delete;

	std::string getTaskQueuePath() const
	{
		return task_queue_path;
	}

private:
	std::string task_queue_path;
};

}

DDLWorker::DDLWorker(const Poco::Util::AbstractConfiguration & config,
				 	 const std::string & config_name, Context & context_,
					 const std::string & host, int port)
	: context(context_)
	, stop_flag(false)
	, thread(&DDLWorker::run, this)
{
	Arguments arguments(config, config_name);
	auto zookeeper = context.getZooKeeper();

	std::string root = arguments.getTaskQueuePath();
	if (root.back() != '/')
		root += "/";

	local_addr = host + ":" + std::to_string(port);
	base_path = "/clickhouse/task_queue/ddl/";
}

DDLWorker::~DDLWorker() {
	stop_flag = true;
	cond_var.notify_one();
	thread.join();
}

void DDLWorker::processTasks() {
	const std::string path = base_path + local_addr;

	processCreate(path + "/create");
}

void DDLWorker::processCreate(const std::string & path) {
	auto zookeeper = context.getZooKeeper();
	const Strings & children = zookeeper->getChildren(path);

	for (const auto & name : children) {
		try {
			std::string path = path + "/" + name;
			std::string value = zookeeper->get(path);

			if (!value.empty()) {
				executeQuery(value, context);
			}

			zookeeper->remove(path);
		} catch (const std::exception& e) {
			std::cerr << "execption " << e.what() << std::endl;
		}
	}
}

void DDLWorker::run() {
	using namespace std::chrono_literals;

	while (!stop_flag) {
		try {
			processTasks();
		} catch (const std::exception& e) {
			std::cerr << "execption " << e.what() << std::endl;
		}

		std::unique_lock<std::mutex> g(lock);
		cond_var.wait_for(g, 10s);
	}
}

}
