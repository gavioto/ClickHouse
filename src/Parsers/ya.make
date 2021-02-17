# This file is generated automatically, do not edit. See 'ya.make.in' and use 'utils/generate-ya-make' to regenerate it.
OWNER(g:clickhouse)

LIBRARY()

PEERDIR(
    clickhouse/src/Common
)


SRCS(
    ASTAlterQuery.cpp
    ASTAsterisk.cpp
    ASTColumnDeclaration.cpp
    ASTColumnsMatcher.cpp
    ASTColumnsTransformers.cpp
    ASTConstraintDeclaration.cpp
    ASTCreateQuery.cpp
    ASTCreateQuotaQuery.cpp
    ASTCreateRoleQuery.cpp
    ASTCreateRowPolicyQuery.cpp
    ASTCreateSettingsProfileQuery.cpp
    ASTCreateUserQuery.cpp
    ASTDictionary.cpp
    ASTDictionaryAttributeDeclaration.cpp
    ASTDropAccessEntityQuery.cpp
    ASTDropQuery.cpp
    ASTExpressionList.cpp
    ASTFunction.cpp
    ASTFunctionWithKeyValueArguments.cpp
    ASTGrantQuery.cpp
    ASTIdentifier.cpp
    ASTIndexDeclaration.cpp
    ASTInsertQuery.cpp
    ASTKillQueryQuery.cpp
    ASTLiteral.cpp
    ASTNameTypePair.cpp
    ASTOptimizeQuery.cpp
    ASTOrderByElement.cpp
    ASTPartition.cpp
    ASTQualifiedAsterisk.cpp
    ASTQueryParameter.cpp
    ASTQueryWithOnCluster.cpp
    ASTQueryWithOutput.cpp
    ASTQueryWithTableAndOutput.cpp
    ASTRolesOrUsersSet.cpp
    ASTRowPolicyName.cpp
    ASTSampleRatio.cpp
    ASTSelectQuery.cpp
    ASTSelectWithUnionQuery.cpp
    ASTSetQuery.cpp
    ASTSetRoleQuery.cpp
    ASTSettingsProfileElement.cpp
    ASTShowAccessEntitiesQuery.cpp
    ASTShowCreateAccessEntityQuery.cpp
    ASTShowGrantsQuery.cpp
    ASTShowTablesQuery.cpp
    ASTSubquery.cpp
    ASTSystemQuery.cpp
    ASTTTLElement.cpp
    ASTTablesInSelectQuery.cpp
    ASTUserNameWithHost.cpp
    ASTWithAlias.cpp
    ASTWithElement.cpp
    CommonParsers.cpp
    ExpressionElementParsers.cpp
    ExpressionListParsers.cpp
    IAST.cpp
    IParserBase.cpp
    InsertQuerySettingsPushDownVisitor.cpp
    Lexer.cpp
    MySQL/ASTAlterCommand.cpp
    MySQL/ASTAlterQuery.cpp
    MySQL/ASTCreateDefines.cpp
    MySQL/ASTCreateQuery.cpp
    MySQL/ASTDeclareColumn.cpp
    MySQL/ASTDeclareConstraint.cpp
    MySQL/ASTDeclareIndex.cpp
    MySQL/ASTDeclareOption.cpp
    MySQL/ASTDeclarePartition.cpp
    MySQL/ASTDeclarePartitionOptions.cpp
    MySQL/ASTDeclareReference.cpp
    MySQL/ASTDeclareSubPartition.cpp
    MySQL/ASTDeclareTableOptions.cpp
    ParserAlterQuery.cpp
    ParserCase.cpp
    ParserCheckQuery.cpp
    ParserCreateQuery.cpp
    ParserCreateQuotaQuery.cpp
    ParserCreateRoleQuery.cpp
    ParserCreateRowPolicyQuery.cpp
    ParserCreateSettingsProfileQuery.cpp
    ParserCreateUserQuery.cpp
    ParserDataType.cpp
    ParserDescribeTableQuery.cpp
    ParserDictionary.cpp
    ParserDictionaryAttributeDeclaration.cpp
    ParserDropAccessEntityQuery.cpp
    ParserDropQuery.cpp
    ParserExplainQuery.cpp
    ParserExternalDDLQuery.cpp
    ParserGrantQuery.cpp
    ParserInsertQuery.cpp
    ParserKillQueryQuery.cpp
    ParserOptimizeQuery.cpp
    ParserPartition.cpp
    ParserQuery.cpp
    ParserQueryWithOutput.cpp
    ParserRenameQuery.cpp
    ParserRolesOrUsersSet.cpp
    ParserRowPolicyName.cpp
    ParserSampleRatio.cpp
    ParserSelectQuery.cpp
    ParserSelectWithUnionQuery.cpp
    ParserSetQuery.cpp
    ParserSetRoleQuery.cpp
    ParserSettingsProfileElement.cpp
    ParserShowAccessEntitiesQuery.cpp
    ParserShowCreateAccessEntityQuery.cpp
    ParserShowGrantsQuery.cpp
    ParserShowPrivilegesQuery.cpp
    ParserShowTablesQuery.cpp
    ParserSystemQuery.cpp
    ParserTablePropertiesQuery.cpp
    ParserTablesInSelectQuery.cpp
    ParserUnionQueryElement.cpp
    ParserUseQuery.cpp
    ParserUserNameWithHost.cpp
    ParserWatchQuery.cpp
    ParserWithElement.cpp
    QueryWithOutputSettingsPushDownVisitor.cpp
    TokenIterator.cpp
    formatAST.cpp
    formatSettingName.cpp
    iostream_debug_helpers.cpp
    makeASTForLogicalFunction.cpp
    obfuscateQueries.cpp
    parseDatabaseAndTableName.cpp
    parseIdentifierOrStringLiteral.cpp
    parseIntervalKind.cpp
    parseQuery.cpp
    parseUserName.cpp
    queryToString.cpp

)

END()
