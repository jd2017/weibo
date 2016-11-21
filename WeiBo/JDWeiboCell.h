//
//  JDWeiboCell.h
//  WeiBo
//
//  Created by jinde on 16/4/21.
//  Copyright © 2016年 jd.bai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JDWeiboFrame.h"

@class JDWeiboFrame;
@interface JDWeiboCell : UITableViewCell
//添加单元格微博属性
@property (nonatomic ,copy) JDWeiboFrame *weiboFrame;

+ (instancetype)weiboTableViewCell:(UITableView *)tableView;

@end
