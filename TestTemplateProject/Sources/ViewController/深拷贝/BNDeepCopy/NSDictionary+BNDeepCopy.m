//
//  NSDictionary+BNDeepCopy.m
//  TestTemplateProject
//
//  Created by Ben on 2017/6/12.
//  Copyright © 2017年 iOSStudio. All rights reserved.
//

#import "NSDictionary+BNDeepCopy.h"

@implementation NSDictionary (BNDeepCopy)

- (instancetype)BN_deepCopy {
    NSMutableDictionary *mutableResultDict = [[NSMutableDictionary alloc] initWithCapacity:[self count]];
    for (id subKey in self) {
        id deepCopySubObject = nil;
        id subObject = [self objectForKey:subKey];
        if ([subObject respondsToSelector: @selector(BN_deepCopy)]) {
            // NSSet、NSArray、NSDictionary already support BNDeepCopy
            deepCopySubObject = [subObject BN_deepCopy];
        } else if ([subObject conformsToProtocol:@protocol(NSCopying)]) {
            // Developer should make sure these class support NSCopying satisfy deep copy.
            deepCopySubObject = [subObject copy];
        } else {
            NSAssert1(NO, @"Class \"%s\" not support BNDeepCopy", object_getClassName(subObject));
            deepCopySubObject = subObject;
        }

        [mutableResultDict setObject:deepCopySubObject forKey:subKey];
    }
    
    if ([self isKindOfClass:[NSMutableDictionary class]]) {
        return mutableResultDict;
    } else {
        return [NSDictionary dictionaryWithDictionary:mutableResultDict];
    }
}

@end


