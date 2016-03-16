//
//  ViewController.m
//  XSCSqliteManager
//
//  Created by 徐三才 on 15/12/30.
//  Copyright © 2015年 sancaixu. All rights reserved.
//

#import "ViewController.h"
#import "XSCSqliteLearn.h"
#define TABLE_NAME @"Students"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
   
    XSCSqliteLearn * learn = [XSCSqliteLearn shareInstance];
    [learn createSqliteTable:@"Students"];
    
//    NSInteger age = 20 + arc4random() % 10;
//    NSInteger grade = 60 + arc4random() % 40;
//    [learn insertSqliteTableName:@"Students" dateTime:[NSDate date] name:@"tim" age:age class:@"电科二班" address:@"北京" grade:grade];
//    sleep(2);
//    [learn insertSqliteTableName:@"Students" dateTime:[NSDate date] name:@"marry" age:age class:@"电科二班" address:@"北京" grade:grade];

  //  [learn selectedSqlite:@"select name,age * from Students"];
   // NSArray * arrry = [learn selectedAllTheDataFromSqliteTableName:@"Students"];
    //NSLog(@"%@",arrry);
    //[learn tableInfoWithSqliteTableName:@"Students"];
  //  [learn selectedCertainConditionsFromSqlite:@"Students" certainConditions:@"age = 25"];
    
   // [learn selectedCertainConditionsFromSqlite:TABLE_NAME certainConditions:@"age > 25 and grade > 90"];
   // [learn selectedCertainConditionsFromSqlite:TABLE_NAME certainConditions:@"age > 25 or grade > 90"];
  //  [learn selectedCertainConditionsFromSqlite:TABLE_NAME certainConditions:@"age > 25 and grade > 90"];
    //[learn selectedCertainConditionsFromSqlite:TABLE_NAME certainConditions:@"name like '%明%'"];
    //[learn selectedCertainConditionsFromSqlite:TABLE_NAME certainConditions:@"name glob '*明'"];
   // [learn selectedCertainConditionsFromSqlite:TABLE_NAME certainConditions:@"grade in (73 , 98)"];
   // [learn selectedCertainConditionsFromSqlite:TABLE_NAME certainConditions:@"grade not in (73 , 98)"];
 
    // [learn selectedCertainConditionsFromSqlite:TABLE_NAME certainConditions:@"grade in (73 , 98)"];
     //[learn selectedCertainConditionsFromSqlite:TABLE_NAME certainConditions:@"grade in (73 , 98)"];
   // [learn selectedCertainConditionsFromSqlite:TABLE_NAME certainConditions:@"grade between 73 and 98"];
  //  SELECT AGE FROM COMPANY WHERE EXISTS (SELECT AGE FROM COMPANY WHERE SALARY > 65000);
    
   // [learn selectedSubqueryCertainConditionsFromSqlite:TABLE_NAME subquery:@"age" certainConditions:@"exists (select age from Students where grade < 70)"];
    // [learn selectedCertainConditionsFromSqlite:TABLE_NAME certainConditions:@"age > (select age from Students where grade > 70)"];

   //false [learn showSql:@"select 16 + 20 as operation_name [select from Students where age > 25];"];
 //  有几个内置的函数，比如 avg()、sum()、count()，等等，执行被称为对一个表或一个特定的表列的汇总数据计算。
    //[learn showSql:@"select count(*) as 'age' from Students"];
    //日期表达式返回当前系统日期和时间值，这些表达式将被用于各种数据操作。
   // [learn showSql:@"select  CURRENT_TIMESTAMP"];
    //下面的实例演示了 SQLite 逻辑运算符的用法。下面的 SELECT 语句列出了 AGE 大于等于 25 且age大于等于 30.00 或者 成绩大于90 的所有记录：
    //[learn showSql:@"select date , name , class ,grade , age from Students where age > 25 and age < 30 or grade > 90"];
    //下面的 SELECT 语句列出了 grade 中包含 '9' 开始的所有记录，'Ki' 之后的字符不做限制：
    //[learn showSql:@"select * from Students where grade like '%9%'"];
    
    //下面的 SELECT 语句列出了 NAME 以 'Ki' 开始的所有记录，'Ki' 之后的字符不做限制：glob 大小写敏感
   // [learn showSql:@"select * from Students where name glob '*xu*'"];
    
    //下面的 SELECT 语句列出了 grade 的值为 73 或 85 的所有记录：
   // [learn showSql:@"select * from Students where grade  in (73,85)"];
     //下面的 SELECT 语句列出了 grade 的值不是 73 或 85 的所有记录：
   // [learn showSql:@"select * from Students where grade not in (73,85)"];
    //下面的 SELECT 语句列出了 grade 的值 73 到 100 直间的所有记录：
   // [learn showSql:@"select * from Students where grade between 73 and 100"];
    
    //[learn showSql:@"SELECT age FROM Students WHERE EXISTS (SELECT age FROM Students WHERE grade < 90)"];
    //下面的 SELECT 语句使用 SQL 子查询，子查询查找 grade > 88 的带有 AGE 字段的所有记录，后边的 WHERE 子句与 > 运算符一起使用，列出了外查询中的 AGE 大于子查询返回的结果中的年龄的所有记录：
    //[learn showSql:@"select * from Students where age > (select age from Students where grade > 88)"];
    //下面的 SELECT 语句使用 SQL 更新 ,将名字更新为jone
   // [learn updateSql:@"update Students set name = 'mr three', age = 26 where age = 25 and grade = 82"];
  //  [learn showSql:@"update Students set name = 'jone' where age = 28"];
    //[learn showSql:@"update Students set name  = 'kim' ,age = 25"];
    
    //下面的 SELECT 语句使用 SQL删除
    //[learn deleteSql:@"delete from Students where name = 'TOM'"];
    //删除所有数据
   // [learn deleteSql:@"delete from Students"];
    
    NSLog(@"hello word, hello beautiful girl");
    
    //从第一位开始提取 3 个记录
  //  [learn showSql:@"select * from Students limit 2"];
    //从第二位开始提取 3 个记录：
   // [learn showSql:@"select * from Students limit 3 offset 2"];
    //升序排列
    //[learn showSql:@"select * from Students order by age asc"];
    //降序排列
    //[learn showSql:@"select * from Students order by age desc"];

 //   [learn showSql:@"select * from Students order by name, age desc"];
   // [learn showSql:@"select name,sum(grade) from Students group by name"];
    //让我们用同样的 GROUP BY 语句来对所有记录按 NAME 列进行分组，如下所示：
    // [learn updateSql:@"select name, sum(grade) from Students where group by name order by name"];
    //[learn showSql:@"select name, sum(grade) from Students  group by name order by name"];
//让我们把 ORDER BY 子句与 GROUP BY 子句一起使用，如下所示：
   //[learn showSql:@"select name, sum(grade) from Students group by name order by name asc"];
    
    //HAVING 子句允许指定条件来过滤将出现在最终结果中的分组结果。WHERE 子句在所选列上设置条件，而 HAVING 子句则在由 GROUP BY 子句创建的分组上设置条件。
   // [learn showSql:@"select * from Students group by name having age > 25 order by age desc"];
    
   // [learn showSql:@"select name from Students"];
    //SQLite 的 DISTINCT 关键字与 SELECT 语句一起使用，来消除所有重复的记录，并只获取唯一一次记录
    [learn showSql:@"select distinct name from Students"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
