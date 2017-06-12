//
//  NSArray+BNDeepCopy.m
//  TestTemplateProject
//
//  Created by Ben on 2017/6/11.
//  Copyright © 2017年 iOSStudio. All rights reserved.
//

#import "NSArray+BNDeepCopy.h"

@implementation NSArray (BNDeepCopy)

- (instancetype)BN_deepCopy {
    NSMutableArray *mutableResultArray = [[NSMutableArray alloc] initWithCapacity:[self count]];
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
		
		if (deepCopySubObject) {
			[mutableResultArray addObject:deepCopySubObject];
		} else {
			[mutableResultArray addObject:subObject];
		}
	}
	
    if ([self isKindOfClass:[NSMutableArray class]]) {
        return mutableResultArray;
    } else {
        return [NSArray arrayWithArray:mutableResultArray];
    }
}

@end


