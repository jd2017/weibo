//
//  JDTableViewController.m
//  WeiBo
//
//  Created by jinde on 16/4/20.
//  Copyright © 2016年 jd.bai. All rights reserved.
//

#import "JDTableViewController.h"
#import "JDWeibo.h"
#import "JDWeiboCell.h"
#import "JDWeiboFrame.h"

@interface JDTableViewController ()
// weiboFrames 集合中保存多个weiboFrame模型
@property(nonatomic, strong) NSArray *weibosFrames;

@end

@implementation JDTableViewController

- (NSArray *)weibosFrames
{
    if (_weibosFrames == nil) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"weibos.plist" ofType:nil];
        NSArray *array = [NSArray arrayWithContentsOfFile:path];

        NSMutableArray *models = [NSMutableArray array];
        for (NSDictionary *dic in array) {

            JDWeibo *weibo = [JDWeibo weiboWithDict:dic];
            //创建一个空的 frame 模型
            JDWeiboFrame *weiboFrame = [[JDWeiboFrame alloc] init];
            weiboFrame.weibo = weibo;

            [models addObject:weiboFrame];
        }
            _weibosFrames = models;
    }
    return _weibosFrames;
}
- (void)viewDidLoad {
    [super viewDidLoad];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (BOOL)prefersStatusBarHidden
{
    return YES;
}
#pragma mark - Table view data source
//一组数据
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
//微博的数量
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.weibosFrames.count;
}
// 单元格赋值
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];

    //1，获取模型数据
    JDWeiboFrame *model = self.weibosFrames[indexPath.row];
    //2，创建单元格
    JDWeiboCell *cell = [JDWeiboCell weiboTableViewCell:tableView];
    //3，设置单元格
    cell.weiboFrame= model;
    //4，返回单元格
    return cell;
}
#pragma mark - table View 代理方法；
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    JDWeiboFrame *weiboFrame = self.weibosFrames[indexPath.row];
    return weiboFrame.rowHeight;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
