
//
//  JSWeiboFrame.m
//  WeiBo
//
//  Created by jinde on 16/4/22.
//  Copyright © 2016年 jd.bai. All rights reserved.
//

#import "JDWeiboFrame.h"
#import "JDWeibo.h"

@implementation JDWeiboFrame

//重写 weibo属性的 set方法
- (void)setWeibo:(JDWeibo *)weibo
{
    _weibo = weibo;
    //计算每个控件的fram，和行高
    //提取统一的间距
    CGFloat margin = 10;
    //1, 头像
    CGFloat iconW = 35;
    CGFloat iconH = 35;
    CGFloat iconX = margin;
    CGFloat iconY = margin;
    _iconFrame = CGRectMake(iconX, iconY, iconW, iconH);

    //2，昵称
    NSString *nickName = weibo.name;
    CGFloat nameX = CGRectGetMaxX(_iconFrame) + margin;

    //动态计算Label中文字内容的 高 和 宽
    CGSize nameSize = [self sizeWithText:nickName andMaxSize:CGSizeMake(MAXFLOAT, MAXFLOAT) andFont:nameFont];
    CGFloat nameW = nameSize.width;
    CGFloat nameH = nameSize.height;
    CGFloat nameY = iconY + (iconH - nameH)/2;
    _nameFrame = CGRectMake(nameX, nameY, nameW, nameH);

    //3，会员
    CGFloat vipW = 10;
    CGFloat vipH= 10;
    CGFloat vipX = CGRectGetMaxX(_nameFrame) + margin;
    CGFloat vipY = nameY;
    _vipFrame = CGRectMake(vipX, vipY, vipW, vipH);

    //4，正文
    CGFloat textX = iconX;
    CGFloat textY = CGRectGetMaxY(_iconFrame) +margin;
    CGSize textSize = [self sizeWithText:weibo.text andMaxSize:CGSizeMake(300, MAXFLOAT) andFont:textFont];
    CGFloat textW = textSize.width;
    CGFloat textH = textSize.height;
    _textFrame = CGRectMake(textX, textY, textW, textH);

    //    5，图片
    CGFloat picW = 100;
    CGFloat picH = 100;
    CGFloat picX = iconX;
    CGFloat picY = CGRectGetMaxY(_textFrame) + margin;
    _picFrame = CGRectMake(picX, picY, picW, picH);

    //6，计算每行的高度
    CGFloat rowHeight = 0;
    if (self.weibo.picture) {
        //若有配图，
        rowHeight = CGRectGetMaxY(_picFrame) + margin;
    }else{
        rowHeight = CGRectGetMaxY(_textFrame) + margin;
    }
    // 注意：计算完后赋值行高
    _rowHeight = rowHeight;
}
//根据给定的字符串、最大值的Size、给定的字体，来计算文字占用的大小
- (CGSize)sizeWithText:(NSString *)text andMaxSize:(CGSize)maxSize andFont:(UIFont *)font
{
    //设置文字大小
    NSDictionary *attr = @{NSFontAttributeName : font};
    return [text boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attr
                              context:nil].size;
}
@end
