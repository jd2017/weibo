//
//  JSWeiboFrame.h
//  WeiBo
//
//  Created by jinde on 16/4/22.
//  Copyright © 2016年 jd.bai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>
#import <UIKit/UIKit.h>
//定义一个公用系统字体大小
#define nameFont [UIFont systemFontOfSize:12]
#define textFont [UIFont systemFontOfSize:14]

@class JDWeibo;
@interface JDWeiboFrame : NSObject

@property(nonatomic, strong) JDWeibo *weibo;
// 用来保存头像的frame
@property(nonatomic, assign) CGRect iconFrame;
@property(nonatomic, assign) CGRect nameFrame;
@property(nonatomic, assign) CGRect vipFrame;
@property(nonatomic, assign) CGRect textFrame;
@property(nonatomic, assign) CGRect picFrame;
//行高
@property(nonatomic,assign) int rowHeight;

@end
