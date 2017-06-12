//
//  DeepCopyTestVC.m
//  TestTemplateProject
//
//  Created by Ben on 2017/6/11.
//  Copyright © 2017年 iOSStudio. All rights reserved.
//

#import "DeepCopyTestVC.h"
#import "ClassModel.h"
#import "StudentModel.h"

@interface DeepCopyTestVC ()

@end

@implementation DeepCopyTestVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    {
        //Model初始化
        StudentModel *student1 = [[StudentModel alloc] init];
        student1.age = 1;
        student1.name = @"student1Name";
        StudentModel *student2 = [[StudentModel alloc] init];
        student2.age = 2;
        student2.name = @"student2Name";
        
        StudentModel *student3 = [[StudentModel alloc] init];
        student3.age = 3;
        student3.name = @"student3Name";
        StudentModel *student4 = [[StudentModel alloc] init];
        student4.age = 4;
        student4.name = @"student4Name";
        
        
        ClassModel *class1 = [[ClassModel alloc] init];
        class1.isVIP = FALSE;
        class1.className = @"class1Name";
        class1.studentArray = [NSArray arrayWithObjects:student1, student2, nil];
        class1.cleverStudentArray = [NSMutableArray arrayWithObjects:student3, student4, nil];
        
        //==========strong    浅拷贝（强引用）
//        ClassModel *class2;   //默认是__strong类型
//        class2 = class1;
//        class1.isVIP = TRUE;
//        class1.className = @"class1Name_Changed";
//
//        student1.age = 100;
//        student1.name = @"student1NameChanged";
//        student2.age = 200;
//        student2.name = @"student2NameChanged";
//        NSLog (@"\n\nclass1: %@\nclass2: %@", class1, class2);
        
        //==========copy      单层浅拷贝
//        ClassModel *class3 = [class1 copy];
//        class1.isVIP = TRUE;
//        class1.className = @"class1Name_Changed";
//        
//        student1.age = 100;
//        student1.name = @"student1NameChanged";
//        student2.age = 200;
//        student2.name = @"student2NameChanged";
//        student3.age = 300;
//        student3.name = @"student3NameChanged";
//        student4.age = 400;
//        student4.name = @"student4NameChanged";
//        
//        NSLog (@"\n\nclass1: %@\nclass3: %@", class1, class3);
        
        //==========归解档     深拷贝
//        NSData *archiveData = [NSKeyedArchiver archivedDataWithRootObject:class1];
//        ClassModel *class4 = [NSKeyedUnarchiver unarchiveObjectWithData:archiveData];
//        
//        class1.isVIP = TRUE;
//        class1.className = @"class1Name_Changed";
//
//        student1.age = 100;
//        student1.name = @"student1NameChanged";
//        student2.age = 200;
//        student2.name = @"student2NameChanged";
//        
//        student3.age = 300;
//        student3.name = @"student3NameChanged";
//        student4.age = 400;
//        student4.name = @"student4NameChanged";
//
//        NSLog (@"\n\nclass1: %@\nclass4: %@", class1, class4);
        
        //==========deepCopy  深拷贝
        ClassModel *class4 = [class1 BN_deepCopy];
        class1.isVIP = TRUE;
        class1.className = @"class1Name_Changed";

        student1.age = 100;
        student1.name = @"student1NameChanged";
        student2.age = 200;
        student2.name = @"student2NameChanged";
        
        student3.age = 300;
        student3.name = @"student3NameChanged";
        student4.age = 400;
        student4.name = @"student4NameChanged";
        
        NSLog (@"\n\nclass1: %@\nclass4: %@", class1, class4);
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
