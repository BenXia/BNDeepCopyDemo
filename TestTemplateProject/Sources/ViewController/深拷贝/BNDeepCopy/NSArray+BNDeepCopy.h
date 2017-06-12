//
//  NSArray+BNDeepCopy.h
//  TestTemplateProject
//
//  Created by Ben on 2017/6/11.
//  Copyright © 2017年 iOSStudio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BNDeepCopyProtocol.h"

@interface NSArray (BNDeepCopy) <BNDeepCopy>

- (instancetype)BN_deepCopy;

@end


