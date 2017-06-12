//
//  StudentModel.h
//  TestTemplateProject
//
//  Created by Ben on 2017/6/11.
//  Copyright © 2017年 iOSStudio. All rights reserved.
//

#import <Foundation/Foundation.h>

// 不实现BN_DeepCopy是因为使用copy已经能满足深拷贝
@interface StudentModel : NSObject <NSCopying, NSCoding>

@property (nonatomic, assign) NSUInteger age;
@property (nonatomic, strong) NSString *name;

@end
