//
//  ZEProgramListVC.m
//  adzealer
//
//  Created by 杨湍 on 2017/12/24.
//  Copyright © 2017年 yangtuan. All rights reserved.
//

#import "ZEProgramListVC.h"
#import "ZEProgramDetailsVC.h"
#import "CenterViewController.h"
#import "LLZPerSubmitViewController.h"
@interface ZEProgramListVC ()

@property(nonatomic,strong)NSArray *dataArray;

@end

@implementation ZEProgramListVC

-(NSArray *)dataArray{
    if (_dataArray == nil) {
        _dataArray = @[@"广告主",@"广告主入驻、流量主入驻",@"流量主入驻"];
    }
    
    return _dataArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.meTableView.frame = CGRectMake(0, 0, Main_Screen_Width, Main_Screen_Height);
    [self.view addSubview:self.meTableView];
}
#pragma mark - UITableViewDelegate,UITableViewDataSource

    
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
     return self.dataArray.count;
}
    
    
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *CellWithIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellWithIdentifier];
    [cell.contentView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellWithIdentifier];
        
    }else{
        while ([cell.contentView.subviews lastObject] != nil) {
            [(UIView*)[cell.contentView.subviews lastObject] removeFromSuperview];  //删除并进行重新分配
        }
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleDefault;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    
    cell.detailTextLabel.text = @"textContent";
    cell.textLabel.text = self.dataArray[indexPath.row];
    return cell;
    
}
    


-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return [[UIView alloc]init];
}
    
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    
    return [[UIView alloc]init];
}
    
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.001*autoSizeScaleY;
}
    
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.001*autoSizeScaleY;
}
    
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 45 *autoSizeScaleY;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.row == 0) {
        ZEProgramDetailsVC *programDetailsVC = [[ZEProgramDetailsVC alloc]init];
        [self.navigationController pushViewController:programDetailsVC animated:YES];
    }
    
    if (indexPath.row == 1) {
        CenterViewController *CenterVC = [[CenterViewController alloc]init];
        [self.navigationController pushViewController:CenterVC animated:YES];
    }
    
    if (indexPath.row == 2) {
        
        LLZPerSubmitViewController *LLSubmitVC = [[LLZPerSubmitViewController alloc]init];
        [self.navigationController pushViewController:LLSubmitVC animated:YES];
    }
    
}

@end
