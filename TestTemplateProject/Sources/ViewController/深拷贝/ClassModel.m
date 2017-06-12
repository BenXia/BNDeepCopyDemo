//
//  ClassModel.m
//  TestTemplateProject
//
//  Created by Ben on 2017/6/11.
//  Copyright © 2017年 iOSStudio. All rights reserved.
//

#import "ClassModel.h"

static NSString *kCodeKeyIsVip = @"kCodeKeyIsVip";
static NSString *kCodeKeyClassName = @"kCodeKeyClassName";
static NSString *kCodeKeyStudentsArray = @"kCodeKeyStudentsArray";
static NSString *kCodeKeyCleverStudentsArray = @"kCodeKeyCleverStudentsArray";

@implementation ClassModel

- (instancetype)copyWithZone:(NSZone *)zone {
    ClassModel *copy = [[[self class] allocWithZone:zone] init];
    
    copy.isVIP = self.isVIP;
    copy.className = [self.className copy];
    copy.studentArray = [self.studentArray copy];
    copy.cleverStudentArray = [self.cleverStudentArray mutableCopy];
    
    return copy;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    if (self) {
        self.isVIP = (NSUInteger)([aDecoder decodeBoolForKey:kCodeKeyIsVip]);
        self.className = [aDecoder decodeObjectForKey:kCodeKeyClassName];
        self.studentArray = [aDecoder decodeObjectForKey:kCodeKeyStudentsArray];
        self.cleverStudentArray = [aDecoder decodeObjectForKey:kCodeKeyCleverStudentsArray];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeBool:self.isVIP forKey:kCodeKeyIsVip];
    [aCoder encodeObject:self.className forKey:kCodeKeyClassName];
    [aCoder encodeObject:self.studentArray forKey:kCodeKeyStudentsArray];
    [aCoder encodeObject:self.cleverStudentArray forKey:kCodeKeyCleverStudentsArray];
}

- (instancetype)BN_deepCopy {
    ClassModel *deepCopy = [[[self class] alloc] init];
    
    deepCopy.isVIP = self.isVIP;
    deepCopy.className = [self.className copy];
    deepCopy.studentArray = [self.studentArray BN_deepCopy];
    deepCopy.cleverStudentArray = [self.cleverStudentArray BN_deepCopy];
    
    return deepCopy;
}

- (NSString *)description {
    return [self infoString];
}

- (NSString *)debugDescription {
    return [self infoString];
}

- (NSString *)infoString {
    return [NSString stringWithFormat:@"<%p>\nisVIP<%p>: %d\nclassName<%p>: %@\nstudentArray<%p>: %@\ncleverStudentArray<%p>: %@",
            self, &_isVIP, _isVIP, _className, _className, _studentArray, _studentArray, _cleverStudentArray, _cleverStudentArray];
}

@end
