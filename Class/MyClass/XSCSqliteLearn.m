//
//  XSCSqliteLearn.m
//  XSCSqliteManager
//
//  Created by 徐三才 on 15/12/30.
//  Copyright © 2015年 sancaixu. All rights reserved.
//

#import "XSCSqliteLearn.h"
#import "FMDatabase.h"
#define SqlitePath(sqliteName) [NSHomeDirectory() stringByAppendingPathComponent:[NSString stringWithFormat:@"Library/Caches/%@.db",sqliteName]]
@implementation XSCSqliteLearn
{
    FMDatabase * dataBase;
}
+ (XSCSqliteLearn *)shareInstance
{
    static XSCSqliteLearn * learn;
    static dispatch_once_t once;
    dispatch_once(&once, ^{
       
        learn = [[XSCSqliteLearn alloc] init];

    });
    return learn;
}
- (id)init
{
    if(self = [super init]){
        [self createSqliteWithName:@"frist"];

    }
    return self;
}
- (void)createSqliteWithName:(NSString *)sqliteName
{
    NSString * path = SqlitePath(sqliteName);
    
    NSLog(@"%@",path);
    
    dataBase = [FMDatabase databaseWithPath:path];
    if ([dataBase open]) {
        NSLog(@"打开数据库成功");
        
    }else {
        NSLog(@"创建数据库失败");
    }
}
- (void)createSqliteTable:(NSString *)tableName
{
    @synchronized(self) {
        //
        NSString * sql =[NSString stringWithFormat: @"create table if not exists %@(date DATETIME PRIMARY KEY NOT NULL, name CHAR(124) NOT NULL, age INT, class CHAR(124) NOT NULL,address CHAR(124) NOT NULL,grade INT);",tableName];

        if([dataBase executeUpdate:sql]){
        
            NSLog(@"创建表单成功");
        }else {
            
            NSLog(@"创建失败");
            
        }
    }
    
}
- (void)dropSqliteTable:(NSString *)name;
{
  
    
    //  DROP TABLE database_name.table_name;
    //   sqlite>.tables
    //   COMPANY       test.COMPANY
    //   sqlite>DROP TABLE COMPANY;

    NSString * sql = [NSString stringWithFormat:@"drop table %@;",name];
    if([dataBase executeUpdate:sql]){
        
        NSLog(@"删除表单成功");
    }else {
        
        NSLog(@"删除表单失败");
        
    }
}

- (void)insertSqliteTableName:(NSString *)tableName dateTime:(NSDate *)dateTime name:(NSString *)name age:(NSInteger)age class:(NSString *)class address:(NSString *)address grade:(NSInteger)grade{
    //格式INSERT INTO TABLE_NAME (column1, column2, column3,...columnN) VALUES (value1, value2, value3,...valueN)
      NSString * sql = [NSString stringWithFormat:@"insert into %@(date,name,age,class,address,grade) values(?,?,?,?,?,?);",tableName];
    
    //在这里，dateTime, name,...address 是要插入数据的表中的列的名称。
    //如果要为表中的所有列添加值，您也可以不需要在 SQLite 查询中指定列名称。但要确保值的顺序与列在表中的顺序一致。SQLite 的 INSERT INTO 语法如下：
    //INSERT INTO TABLE_NAME VALUES (value1,value2,value3,...valueN);

    @synchronized(self){
        
        
        if([dataBase executeUpdate:sql,[self stringFromDate:dateTime],name,[NSNumber numberWithInteger:age],class,address,[NSNumber numberWithInteger:grade]]){
    
            NSLog(@"插入成功");
        
        }else {
    
            NSLog(@"插入失败");
        }
        //com.ijiebao.XSCSqliteManager
    }
    
}
- (NSArray *)selectedAllTheDataFromSqliteTableName:(NSString *)tabelName
{
    NSString * sql = [NSString stringWithFormat:@"select * from %@",tabelName];
    NSMutableArray * array = [NSMutableArray array];

    @synchronized(self) {
        
        
        FMResultSet * resultSet = [dataBase executeQuery:sql];
        while([resultSet next]) {
           
            NSDictionary * dict = [resultSet resultDictionary];
            //NSString * name = [resultSet stringForColumn:@"name"];
            //NSLog(@"%@",dict);
            [array addObject:dict];
        }
    }
    return array;
}

- (void)tableInfoWithSqliteTableName:(NSString *)tableName
{
    //查询表单的名字 select tbl_name from sqlite_master where type = 'table';

    NSString * sql = [NSString stringWithFormat:@"select sql from sqlite_master where type = 'table' and tbl_name = '%@';",tableName];
    
    @synchronized(self) {
        
        FMResultSet * resultSet = [dataBase executeQuery:sql];
        while ([resultSet next]) {
            NSDictionary * dict = [resultSet resultDictionary];
         
            NSLog(@"%@",dict);
       
        }
    }
    
}
- (NSArray *)selectedCertainConditionsFromSqlite:(NSString *)tableName certainConditions:(NSString *)conditions
{
    NSString * sql = [NSString stringWithFormat:@"select * from %@ where %@;",tableName,conditions];
    NSMutableArray * array = [NSMutableArray array];
    @synchronized(self) {
        FMResultSet * set = [dataBase executeQuery:sql];
        while ([set next]) {
            NSDictionary * dict = [set resultDictionary];
            NSLog(@"%@",dict);
            [array addObject:dict];
        }
    }
    return array;
}
- (NSArray *)selectedSubqueryCertainConditionsFromSqlite:(NSString *)tableName subquery:(NSString *)subquery certainConditions:(NSString *)conditions
{
    NSString * sql = [NSString stringWithFormat:@"select %@ from %@ where %@;",subquery,tableName,conditions];
    NSMutableArray * array = [NSMutableArray array];
    @synchronized(self) {
        FMResultSet * restultSet = [dataBase executeQuery:sql];
        while ([restultSet next]) {
            
            NSDictionary * dict = [restultSet resultDictionary];
            NSLog(@"---%@",dict);
            [array addObject:dict];
        }
    }
    return array;
    
}
- (NSArray *)showSql:(NSString *)sql
{
    NSMutableArray * array = [NSMutableArray array];
    @synchronized(self) {
        FMResultSet * restultSet = [dataBase executeQuery:sql];
        while ([restultSet next]) {
            
            NSDictionary * dict = [restultSet resultDictionary];
            NSLog(@"---%@",dict);
            [array addObject:dict];
        }
    }
    return array;
}
- (BOOL)updateSql:(NSString *)sql
{
    @synchronized(self) {
        if ([dataBase executeUpdate:sql]) {
            NSLog(@"更新成功");
            return YES;
        }
        
        return NO;
        
    }
}
- (BOOL)deleteSql:(NSString *)sql
{
    @synchronized(self) {
        if ([dataBase  executeUpdate:sql]) {
            NSLog(@"删除成功");
            return YES;
        }
        return NO;
    }
}
- (NSString *)stringFromDate:(NSDate *)date
{
    NSDateFormatter * df = [[NSDateFormatter alloc] init];
    df.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    
    return [df stringFromDate:date];
}

@end
