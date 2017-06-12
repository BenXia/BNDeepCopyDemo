//
//  StudentModel.m
//  TestTemplateProject
//
//  Created by Ben on 2017/6/11.
//  Copyright © 2017年 iOSStudio. All rights reserved.
//

#import "StudentModel.h"

static NSString *kCodeKeyAge = @"kCodeKeyAge";
static NSString *kCodeKeyName = @"kCodeKeyName";

@implementation StudentModel

- (instancetype)copyWithZone:(NSZone *)zone {
    StudentModel *copy = [[[self class] allocWithZone:zone] init];
    
    copy.age = self.age;
    copy.name = [self.name copy];
    
    return copy;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    if (self) {
        self.age = (NSUInteger)([aDecoder decodeIntegerForKey:kCodeKeyAge]);
        self.name = [aDecoder decodeObjectForKey:kCodeKeyName];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeInteger:(NSInteger)self.age forKey:kCodeKeyAge];
    [aCoder encodeObject:self.name forKey:kCodeKeyName];
}

- (NSString *)description {
    return [self infoString];
}

- (NSString *)debugDescription {
    return [self infoString];
}

- (NSString *)infoString {
    return [NSString stringWithFormat:@"<%p>\nage<%p>: %ld  name<%p>: %@", self, &_age, _age, _name, _name];
}

@end
