//
//  NSSet+BNDeepCopy.m
//  TestTemplateProject
//
//  Created by Ben on 2017/6/12.
//  Copyright © 2017年 iOSStudio. All rights reserved.
//

#import "NSSet+BNDeepCopy.h"

@implementation NSSet (BNDeepCopy)

- (instancetype)BN_deepCopy {
    NSMutableSet *mutableResultSet= [[NSMutableSet alloc] initWithCapacity:[self count]];
    for (id subObject in self) {
        id deepCopySubObject = nil;
        if ([subObject respondsToSelector:@selector(BN_deepCopy)]) {
            // NSSet、NSArray、NSDictionary already support BNDeepCopy
            deepCopySubObject = [subObject BN_deepCopy];
        } else if ([subObject conformsToProtocol:@protocol(NSCopying)]) {
            // Developer should make sure these class support NSCopying satisfy deep copy.
            deepCopySubObject = [subObject copy];
        } else {
            NSAssert1(NO, @"Class \"%s\" not support BNDeepCopy", object_getClassName(subObject));
            deepCopySubObject = subObject;
        }
        
        [mutableResultSet addObject:deepCopySubObject];
    }
    
    if ([self isKindOfClass:[NSMutableSet class]]) {
        return mutableResultSet;
    } else {
        return [NSSet setWithSet:mutableResultSet];
    }
}

@end


