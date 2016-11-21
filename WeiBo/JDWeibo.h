//
//  JDWeibo.h
//  WeiBo
//
//  Created by jinde on 16/4/21.
//  Copyright © 2016年 jd.bai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JDWeibo : NSObject
@property (nonatomic ,copy) NSString *text;
@property (nonatomic ,copy) NSString *icon;
@property (nonatomic ,copy) NSString *picture;
@property (nonatomic ,copy) NSString *name;
@property (nonatomic, assign, getter=isVip) BOOL vip;

- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)weiboWithDict:(NSDictionary *)dict;

@end
