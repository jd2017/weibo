
//
//  JDWeiboCell.m
//  WeiBo
//
//  Created by jinde on 16/4/21.
//  Copyright © 2016年 jd.bai. All rights reserved.
//

#import "JDWeiboCell.h"
#import "JDWeibo.h"
//定义一个公用系统字体大小
#define nameFont [UIFont systemFontOfSize:12]
#define textFont [UIFont systemFontOfSize:14]

@interface JDWeiboCell ()
@property(nonatomic, weak) UIImageView *imgViewIcon;
@property(nonatomic, weak) UILabel *lblName;
@property(nonatomic, weak) UIImageView *imgViewVip;
@property(nonatomic, weak) UILabel *lblText;
@property(nonatomic, weak) UIImageView *imgViewPic;
@end

@implementation JDWeiboCell

#pragma mark - 重写单元格 initWithStyle方法
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        //1，头像
        UIImageView *imgViewIcon = [[UIImageView alloc] init];
        [self.contentView addSubview:imgViewIcon];
        self.imgViewIcon = imgViewIcon;
        //2，昵称
        UILabel *lblName = [[UILabel alloc] init];
        lblName.font = nameFont;    //设置昵称字体大小
        [self.contentView addSubview:lblName];
        self.lblName = lblName;
        //3，会员
        UIImageView *imgViewVip = [[UIImageView alloc] init];
        imgViewVip.image = [UIImage imageNamed:@"vip"];
        [self.contentView addSubview:imgViewVip];
        self.imgViewVip = imgViewVip;
        //4，正文
        UILabel *lblText = [[UILabel alloc] init];
        lblText.font = textFont;    //正文文字大小
        lblText.numberOfLines = 0; //自动换行
        [self.contentView addSubview:lblText];
        self.lblText = lblText;
        //5，配图
        UIImageView *imgViewPic = [[UIImageView alloc] init];
        [self.contentView addSubview:imgViewPic];
        self.imgViewPic = imgViewPic;
    }
    return self;
}
+ (instancetype)weiboTableViewCell:(UITableView *)tableView
{
    static NSString *ID = @"weibo_cell";
    JDWeiboCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if(cell == nil){
        cell = [[JDWeiboCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    return cell;
}
#pragma mark - 重写 weibo 属性的 set方法
- (void) setWeiboFrame:(JDWeiboFrame *)weiboFrame
{
    _weiboFrame = weiboFrame;
    //1，设置单元格中的子控件的数据
    [self settingData];
    //2，设置单元格中的子控件的数据
    [self settingFrame];
}

//1，设置单元格中的子控件的数据
- (void)settingData
{
    JDWeibo *model = self.weiboFrame.weibo;
    //1，头像；
    self.imgViewIcon.image = [UIImage imageNamed:model.icon];
    //2，昵称
    self.lblName.text = model.name;
    //3，会员
    if(model.isVip){
        self.imgViewVip.hidden = NO;
        self.lblName.textColor = [UIColor redColor];
    }else{
        self.imgViewVip.hidden = YES;
        self.lblName.textColor = [UIColor blackColor];
    }
    //4，正文
    self.lblText.text = model.text;
    //5，配图
    if (model.picture) {
        //有配图、如果model.picture 的值是nil,那么下面这句话会执行报错
        self.imgViewPic.image = [UIImage imageNamed:model.picture];
        self.imgViewPic.hidden = NO;
    }else{
        self.imgViewPic.hidden = YES;
    }
}
//2，设置单元格中的子控件的数据
- (void)settingFrame
{
    //头像
    self.imgViewIcon.frame = self.weiboFrame.iconFrame;
    //2，昵称
    self.lblName.frame = self.weiboFrame.nameFrame;
    //3，会员
    self.imgViewVip.frame = self.weiboFrame.vipFrame;
    //4，正文
    self.lblText.frame =self.weiboFrame.textFrame;
    //5，图片
    self.imgViewPic.frame = self.weiboFrame.picFrame;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
