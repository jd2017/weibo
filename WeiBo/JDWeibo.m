//
//  JDWeibo.m
//  WeiBo
//
//  Created by jinde on 16/4/21.
//  Copyright © 2016年 jd.bai. All rights reserved.
//

#import "JDWeibo.h"

@implementation JDWeibo

- (instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]){
        [self setValuesForKeysWithDictionary:dict];
    }
        return self;
}
+ (instancetype)weiboWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}
@end
