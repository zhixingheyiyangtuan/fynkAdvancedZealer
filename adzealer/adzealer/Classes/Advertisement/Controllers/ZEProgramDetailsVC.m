//
//  ZEProgramDetailsVC.m
//  adzealer
//
//  Created by 杨湍 on 2017/12/24.
//  Copyright © 2017年 yangtuan. All rights reserved.
//

#import "ZEProgramDetailsVC.h"
#import  "HMSegmentedControl.h"
#import "ZEProgramDetailParaHeaderView.h"
#import "ZEProgramDetailPriceDetailCell.h"
#import "ZEProgramDetailParamCell.h"
#import "ZEProgramDetailSellTimeCell.h"
#import "ZEProgramDetailPlaceCell.h"
@interface ZEProgramDetailsVC ()


    
@end

@implementation ZEProgramDetailsVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setNavigationBarTittle:@"节目详情"];
    
    [self setNavigationBarWithLeftBarItemImage:@"未标题-1_16" rightBarIteImage:@"未标题-1_19"];
    [self createUI];
  
}

-(void)createUI{
    
    
    // Minimum code required to use the segmented control with the default styling.
    HMSegmentedControl *segmentedControl = [[HMSegmentedControl alloc] initWithSectionTitles:@[@"节目参数", @"往期节目回顾", @"历史销售记录"]];
    segmentedControl.frame = CGRectMake(0, 0, 250*autoSizeScaleX, 44*autoSizeScaleY);
    
    segmentedControl.titleTextAttributes = @{NSFontAttributeName:SYSTEMFONT(12.0),NSForegroundColorAttributeName : SYSYTEMTEXTALPHACOLOR};
  
    segmentedControl.userDraggable = NO;
    segmentedControl.selectionIndicatorColor = [UIColor colorWithHexString:@"#fa6611"];
    segmentedControl.selectedTitleTextAttributes = @{NSForegroundColorAttributeName : [UIColor colorWithHexString:@"#fa6611"]};
    
    
    segmentedControl.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleWidth;
    segmentedControl.selectionIndicatorLocation = HMSegmentedControlSelectionIndicatorLocationDown;
    [segmentedControl addTarget:self action:@selector(segmentedControlChangedValue:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:segmentedControl];
    
   
    [self.view addSubview:self.meTableView];
    [self.meTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(segmentedControl.mas_bottom).offset(0);
        make.left.equalTo(self.view.mas_left).offset(0);
        make.right.equalTo(self.view.mas_right).offset(0);
        make.bottom.equalTo(self.view.mas_bottom).offset(0);
    }];
    
    
    ZEProgramDetailParaHeaderView *paraHeaderview = [[ZEProgramDetailParaHeaderView alloc]init];
    paraHeaderview.frame = CGRectMake(0, 0, 0, 466*autoSizeScaleY);
    self.meTableView.tableHeaderView = paraHeaderview;
    
}
    
    /** 左侧按钮点击 */
-(void)leftButtonItemClick:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
}
    
    /** 右侧按钮点击 */
-(void)rightButtonItemClick:(id)sender{
    
}



- (void)segmentedControlChangedValue:(HMSegmentedControl *)segmentedControl {
    NSLog(@"Selected index %ld (via UIControlEventValueChanged)", (long)segmentedControl.selectedSegmentIndex);
}
    

    
#pragma mark - UITableViewDelegate,UITableViewDataSource
    
    
    //设置section的个数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 5;
}
    
    
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
        
}
    
    
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        ZEProgramDetailPriceDetailCell * cell = [ZEProgramDetailPriceDetailCell ZECell:tableView WithIndexPath:indexPath];
        return cell;
    }else if (indexPath.section == 1){
        
        ZEProgramDetailParamCell * cell = [ZEProgramDetailParamCell ZECell:tableView WithIndexPath:indexPath];
        return cell;
        
    }else if (indexPath.section == 2){
        
        ZEProgramDetailSellTimeCell * cell = [ZEProgramDetailSellTimeCell ZECell:tableView WithIndexPath:indexPath];
        return cell;
        
    }else if (indexPath.section == 3){
        
        ZEProgramDetailPlaceCell * cell = [ZEProgramDetailPlaceCell ZECell:tableView WithIndexPath:indexPath];
        return cell;
        
    }
    
    
    else{
   
    
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
    cell.textLabel.text = @"name";
    return cell;
    }
}
    
    
    
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{

    UIView *headerView = [[UIView alloc]init];
    headerView.backgroundColor = [UIColor colorWithHexString:@"#eceff1"];
    headerView.frame = CGRectMake(0, 0, Main_Screen_Width, 8*autoSizeScaleY);
    
    return headerView;
}
    
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    
    return [[UIView alloc]init];
}
    
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 8*autoSizeScaleY;
}
    
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.001*autoSizeScaleY;
}
    
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0 ) {
         return PriceDetailCellHeight;
    }else if (indexPath.section == 1){
        
        return 220 *autoSizeScaleY;
        
    }else if (indexPath.section == 2){
        
        return SellTimeCellHeight;
        
    }
    
    else{
    return 60 *autoSizeScaleY;
    }
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    
}
@end
