//
//  ClassModel.h
//  TestTemplateProject
//
//  Created by Ben on 2017/6/11.
//  Copyright © 2017年 iOSStudio. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ClassModel : NSObject <NSCopying, NSCoding, BNDeepCopy>

@property (nonatomic, assign) BOOL isVIP;
@property (nonatomic, strong) NSString *className;
@property (nonatomic, strong) NSArray *studentArray;
@property (nonatomic, strong) NSMutableArray *cleverStudentArray;

@end
