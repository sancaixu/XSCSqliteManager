//
//  XSCSqliteLearn.h
//  XSCSqliteManager
//
//  Created by 徐三才 on 15/12/30.
//  Copyright © 2015年 sancaixu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XSCSqliteLearn : NSObject

+ (nonnull XSCSqliteLearn *)shareInstance;

/**
 *  创建数据库 http://www.runoob.com/sqlite/sqlite-create-database.html
 *
 *  @param sqliteName 数据库的名字
 */
- (void)createSqliteWithName:(nonnull NSString *)sqliteName;
/**
 *  创建表单 http://www.runoob.com/sqlite/sqlite-create-table.html
 *
 *  @param tableName 表单的名字
 */
- (void)createSqliteTable:(nonnull NSString *)tableName;

//
/**
 *  删除表单 http://www.runoob.com/sqlite/sqlite-drop-table.html
 *
 *  @param name 表单的名字
 */
- (void)dropSqliteTable:(nonnull NSString *)name;
/**
 *  插入数据
 *
 *  @param tableName 表单的名字
 *  @param dateTime  添加的日期
 *  @param name      名字
 *  @param age       年龄
 *  @param class     班级
 *  @param address   地址
 */
- (void)insertSqliteTableName:(nonnull NSString *)tableName dateTime:(nonnull NSDate *)dateTime name:(nonnull NSString *)name age:(NSInteger)age class:(nonnull NSString *)class address:(nonnull NSString *)address grade:(NSInteger)grade;
//- (void)selectedSqlite:(nonnull NSString *)sql;
/**
 *  查询所有数据
 *
 *  @param tabelName 表单的名字
 *
 *  @return 存放数据的数组
 */
- (nullable NSArray *)selectedAllTheDataFromSqliteTableName:(nonnull NSString *)tabelName;

- (void)tableInfoWithSqliteTableName:(nonnull NSString *)tableName;
/**
 *  查询特定的数据 http://www.runoob.com/sqlite/sqlite-operators.html
 *
 *  @param tableName  表的名字
 *  @param conditions 特定的条件
 *
 *  @return 返回数据的数组
 */
/*
 SQLite 算术运算符
 +	加法 - 把运算符两边的值相加	a + b 将得到 30
 -	减法 - 左操作数减去右操作数	a - b 将得到 -10
 *	乘法 - 把运算符两边的值相乘	a * b 将得到 200
 /	除法 - 左操作数除以右操作数	b / a 将得到 2
 %	取模 - 左操作数除以右操作数后得到的余数
 
 SQLite 比较运算符
 SELECT * FROM 表单的名字 WHERE age > 25 列出了 age > 25 的所有记录：
 SELECT * FROM 表单的名字 WHERE age = 25 列出了 age = 25 的所有记录：
 SELECT * FROM 表单的名字 WHERE age <> 25 列出了 age 不等于 25 的所有记录：
 SELECT * FROM 表单的名字 WHERE age >= 25 列出了 age >= 25 的所有记录：
 ==	检查两个操作数的值是否相等，如果相等则条件为真。	(a == b) 不为真。
 =	检查两个操作数的值是否相等，如果相等则条件为真。	(a = b) 不为真。
 !=	检查两个操作数的值是否相等，如果不相等则条件为真。	(a != b) 为真。
 <>	检查两个操作数的值是否相等，如果不相等则条件为真。	(a <> b) 为真。
 >	检查左操作数的值是否大于右操作数的值，如果是则条件为真。	(a > b) 不为真。
 <	检查左操作数的值是否小于右操作数的值，如果是则条件为真。	(a < b) 为真。
 >=	检查左操作数的值是否大于等于右操作数的值，如果是则条件为真。	(a >= b) 不为真。
 <=	检查左操作数的值是否小于等于右操作数的值，如果是则条件为真。	(a <= b) 为真。
 !<	检查左操作数的值是否不小于右操作数的值，如果是则条件为真。	(a !< b) 为假。
 !>	检查左操作数的值是否不大于右操作数的值，如果是则条件为真。	(a !> b) 为真。
 
 SQLite 逻辑运算符
 SELECT * FROM 表单的名字 WHERE age > 25 and grade >90 列出了 年龄大于25,切成绩大于90 的所有记录：
 SELECT * FROM 表单的名字 WHERE name like "%小%" 列出了名字中还有小字的记录
 SELECT * FROM 表单的名字 WHERE name glob "*小*" 列出了名字中还有小子的记录, 区分大写小
 SELECT * FROM 表单的名字 WHERE age in (20,30) 列出年龄为20和30的记录
 SELECT * FROM 表单的名字 WHERE age not in (20,30) 列出了年龄不是20和30的记录
 SELECT * FROM 表单的名字 WHERE age between 20 and 25 列出了年龄在20到25之间的数据
 SELECT * FROM 表单的名字 WHERE age > (SELECT age from 表单的名字 WHERE grade > 90);SELECT 语句使用 SQL 子查询，子查询查找 grade > 90 的带有 AGE 字段的所有记录，后边的 WHERE 子句与 > 运算符一起使用，列出了外查询中的 AGE 大于子查询返回的结果中的年龄的所有记录：
 
 SELECT * FROM COMPANY
 WHERE AGE > (SELECT AGE FROM COMPANY WHERE SALARY > 65000);
 AND        AND 运算符允许在一个 SQL 语句的 WHERE 子句中的多个条件的存在。
 BETWEEN	BETWEEN 运算符用于在给定最小值和最大值范围内的一系列值中搜索值。
 EXISTS     EXISTS 运算符用于在满足一定条件的指定表中搜索行的存在。
 IN         IN 运算符用于把某个值与一系列指定列表的值进行比较。
 NOT IN     IN 运算符的对立面，用于把某个值与不在一系列指定列表的值进行比较。
 LIKE       LIKE 运算符用于把某个值与使用通配符运算符的相似值进行比较。
 GLOB       GLOB 运算符用于把某个值与使用通配符运算符的相似值进行比较。GLOB 与 LIKE 不同之处在于，它是大小写敏感的。
 NOT        NOT 运算符是所用的逻辑运算符的对立面。比如 NOT EXISTS、NOT BETWEEN、NOT IN，等等。它是否定运算符。
 OR         OR 运算符用于结合一个 SQL 语句的 WHERE 子句中的多个条件。
 IS NULL	NULL 运算符用于把某个值与 NULL 值进行比较。
 IS         IS 运算符与 = 相似。
 IS NOT     IS NOT 运算符与 != 相似。
 ||         连接两个不同的字符串，得到一个新的字符串。
 UNIQUE     UNIQUE 运算符搜索指定表中的每一行，确保唯一性（无重复）。
 */
- (nullable NSArray *)selectedCertainConditionsFromSqlite:(nonnull NSString *)tableName certainConditions:(nonnull NSString *)conditions;

- (nullable NSArray *)selectedSubqueryCertainConditionsFromSqlite:(nonnull NSString *)tableName subquery:(nonnull NSString *)subquery certainConditions:(nonnull NSString *)conditions;

- (nullable NSArray *)showSql:(nonnull NSString *)sql;

- (BOOL)updateSql:(nonnull NSString *)sql;

- (BOOL)deleteSql:(nonnull NSString *)sql;

@end
