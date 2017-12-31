//
//  PTBaseViewController.m
//  OSCEPracticalTraining
//
//  Created by yangtuan on 2017/9/26.
//  Copyright © 2017年 yangtuan. All rights reserved.
//

#import "PTBaseViewController.h"


@interface PTBaseViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation PTBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   // 设置状态栏为白色
 [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    // Do any additional setup after loading the view.
}


-(UITableView *)meTableView
{
    if (!_meTableView)
    {
        _meTableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _meTableView.delegate = self;
        _meTableView.dataSource = self;
        _meTableView.showsVerticalScrollIndicator = NO;
        _meTableView.backgroundColor = SYSYTEMCOLOR;
//                _meTableView.bounces = NO; //禁止弹跳
        
                _meTableView.estimatedRowHeight = 0;
                _meTableView.estimatedSectionHeaderHeight = 0;
                _meTableView.estimatedSectionFooterHeight = 0;
        
        if (@available(iOS 11.0, *)) {
            _meTableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        } else {
            self.automaticallyAdjustsScrollViewInsets = NO;
        }
        
       
        // _meTableView.backgroundColor = [UIColor greenColor];
    }
    return _meTableView;
}

#pragma mark - UITableViewDelegate,UITableViewDataSource


//设置section的个数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return 30;
    
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
    cell.textLabel.text = @"name";
    return cell;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 44 *autoSizeScaleY;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    
}

#pragma -mark 和导航相关
/** 设置标题 */
-(void)setNavigationBarTittle:(NSString*)barTitle{
    UILabel * naviTitle = [[UILabel alloc]initWithFrame:CGRectMake(0.0, 0.0, 20*barTitle.length*autoSizeScaleX, 44.0)];
    [naviTitle setText:barTitle];
    naviTitle.textColor = [UIColor whiteColor];
    naviTitle.font = SYSTEMBIGFONT;
    [naviTitle setTextAlignment:NSTextAlignmentCenter];
    self.navigationItem.titleView = naviTitle;
}

/** 设置左右导航item 只有图片*/
-(void)setNavigationBarWithLeftBarItemImage:(NSString*)leftImageName rightBarIteImage:(NSString*)rightImageName{
    if (leftImageName) {
        UIButton * leftButton = [[UIButton alloc]initWithFrame:CGRectMake(0.0, 0.0, 50.0*autoSizeScaleX, 44.0)];
//        leftButton.backgroundColor = [UIColor yellowColor];
        [leftButton setImage:[UIImage imageNamed:leftImageName] forState:UIControlStateNormal];
        leftButton.imageEdgeInsets = UIEdgeInsetsMake(0, -45*autoSizeScaleX, 0, 0);
        [leftButton addTarget:self action:@selector(leftButtonItemClick:) forControlEvents:UIControlEventTouchUpInside];
        UIBarButtonItem * leftItem = [[UIBarButtonItem alloc]initWithCustomView:leftButton];
        self.navigationItem.leftBarButtonItem = leftItem;
    }
    
    if (rightImageName) {
        UIButton * rightButton = [[UIButton alloc]initWithFrame:CGRectMake(0.0, 0.0, 50.0*autoSizeScaleX, 44.0)];
       
        rightButton.imageEdgeInsets = UIEdgeInsetsMake(0, 30*autoSizeScaleX, 0, 0);
        [rightButton setImage:[UIImage imageNamed:rightImageName] forState:UIControlStateNormal];
        [rightButton addTarget:self action:@selector(rightButtonItemClick:) forControlEvents:UIControlEventTouchUpInside];
        
        UIBarButtonItem * rightItem = [[UIBarButtonItem alloc]initWithCustomView:rightButton];
        self.navigationItem.rightBarButtonItem = rightItem;
    }
    
    
}

/** 设置左右导航item 只有标题*/
-(void)setNavigationBarWithLeftTitle:(NSString*)leftTitle rightTitle:(NSString*)rightTitle{
    if (leftTitle) {
        UIButton * leftButton = [[UIButton alloc]init];
        float width =  leftTitle.length *18*autoSizeScaleX;
        leftButton.frame = CGRectMake(0.0, 0.0, width, 44.0);
       
        [leftButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [leftButton setTitle:leftTitle forState:UIControlStateNormal];
        [leftButton.titleLabel setFont:SYSTEMDEFAULTFONT];
        [leftButton addTarget:self action:@selector(leftButtonItemClick:) forControlEvents:UIControlEventTouchUpInside];
        UIBarButtonItem * leftItem = [[UIBarButtonItem alloc]initWithCustomView:leftButton];
        self.navigationItem.leftBarButtonItem = leftItem;
    }
    
    if (rightTitle) {
        UIButton * rightButton = [[UIButton alloc]init];
       float width =  rightTitle.length *18*autoSizeScaleX;
        rightButton.frame = CGRectMake(0.0, 0.0, width, 44.0);
        [rightButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [rightButton setTitle:rightTitle forState:UIControlStateNormal];
        [rightButton.titleLabel setFont:SYSTEMDEFAULTFONT];
        [rightButton addTarget:self action:@selector(rightButtonItemClick:) forControlEvents:UIControlEventTouchUpInside];
       
        UIBarButtonItem * rightItem = [[UIBarButtonItem alloc]initWithCustomView:rightButton];
        self.navigationItem.rightBarButtonItem = rightItem;
    }
}

/** 设置左右导航item 有图片和标题*/
-(void)setNavigationBarWithLeftTitle:(NSString*)leftTitle WithLeftBarItemImage:(NSString*)leftImageName rightTitle:(NSString*)rightTitle rightBarIteImage:(NSString*)rightImageName{


    if (leftImageName || leftTitle) {
        UIButton * leftButton = [[UIButton alloc]init];
        [leftButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        //只有文字没有图片
        if (leftTitle && !leftImageName) {
            
            float width =  leftTitle.length *20*autoSizeScaleX;
            leftButton.frame = CGRectMake(0.0, 0.0, width, 44.0);
            [leftButton setTitle:leftTitle forState:UIControlStateNormal];
            [leftButton.titleLabel setFont:SYSTEMDEFAULTFONT];
            
        }
        //只有图片没有文字
        if (leftImageName && !leftTitle) {
            leftButton.frame = CGRectMake(0.0, 0.0, 30.0*autoSizeScaleX, 44.0);
            [leftButton setImage:[UIImage imageNamed:leftImageName] forState:UIControlStateNormal];
            leftButton.imageEdgeInsets = UIEdgeInsetsMake(0, -25, 0, 0);
            
        }

        //有图片有文字
        if (leftImageName && leftTitle) {
        
        float width =  leftTitle.length *15*autoSizeScaleX + 10 *autoSizeScaleX;
        leftButton.frame = CGRectMake(0.0, 0.0, width, 44.0);
        [leftButton setImage:[UIImage imageNamed:leftImageName] forState:UIControlStateNormal];
        leftButton.imageEdgeInsets = UIEdgeInsetsMake(0, -30*autoSizeScaleX, 0, 0);
        leftButton.titleEdgeInsets = UIEdgeInsetsMake(0, -30*autoSizeScaleX, 0, 0);
         [leftButton setTitle:leftTitle forState:UIControlStateNormal];
        leftButton.titleLabel.font = SYSTEMDEFAULTFONT;
        }
   
    
        [leftButton addTarget:self action:@selector(leftButtonItemClick:) forControlEvents:UIControlEventTouchUpInside];
        UIBarButtonItem * leftItem = [[UIBarButtonItem alloc]initWithCustomView:leftButton];
        self.navigationItem.leftBarButtonItem = leftItem;

    
    }
    
    if (rightImageName || rightTitle) {
         UIButton * rightButton = [[UIButton alloc]init];
       
         [rightButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        //只有文字没有图片
        if (rightTitle && !rightImageName) {
            
            float width =  rightTitle.length *20*autoSizeScaleX;
            rightButton.frame = CGRectMake(0.0, 0.0, width, 44.0);
            [rightButton setTitle:rightTitle forState:UIControlStateNormal];
            [rightButton.titleLabel setFont:SYSTEMDEFAULTFONT];
             rightButton.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, -20);
            
        }
        
        //只有图片没有文字
        if (rightImageName && !rightTitle) {
            rightButton.frame = CGRectMake(0.0, 0.0, 30.0*autoSizeScaleX, 44.0);
            [rightButton setImage:[UIImage imageNamed:rightImageName] forState:UIControlStateNormal];
            rightButton.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, -30);
            
        }
        
        //有图片有文字
        if (rightImageName && rightTitle) {
            
            float width =  rightTitle.length *15*autoSizeScaleX + 10 *autoSizeScaleX;
            rightButton.frame = CGRectMake(0.0, 0.0, width, 44.0);
           
            UIImageView *rightImageV = [[UIImageView alloc]init];
            rightImageV.image = [UIImage imageNamed:rightImageName];
            [rightButton addSubview:rightImageV];
            [rightImageV mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerY.mas_equalTo(rightButton.mas_centerY).offset(0);
                make.right.equalTo(rightButton.mas_right).offset(0);
                make.height.mas_equalTo(20);
                make.width.mas_equalTo(10*autoSizeScaleX);
            }];
            
            UILabel *rightLabel = [[UILabel alloc]init];
            rightLabel.text = rightTitle;
            rightLabel.font = SYSTEMDEFAULTFONT;
            rightLabel.textColor = RGBA(0, 120, 250, 1);
            [rightButton addSubview:rightLabel];
            [rightLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerY.mas_equalTo(rightButton.mas_centerY).offset(0);
                make.right.equalTo(rightImageV.mas_left).offset(-2*autoSizeScaleX);
                make.height.mas_equalTo(44.0);
            }];
            
        }

        
        [rightButton addTarget:self action:@selector(rightButtonItemClick:) forControlEvents:UIControlEventTouchUpInside];
        
        UIBarButtonItem * rightItem = [[UIBarButtonItem alloc]initWithCustomView:rightButton];
        self.navigationItem.rightBarButtonItem = rightItem;
    }


}


-(void)setNavigationBarWithLeftBarItemImage:(NSString*)leftImageName WithLeftTitle:(NSString*)leftTitle rightBarFirstItemImage:(NSString*)firstRightImageName rightBarSecondItemImage:(NSString*)secondRightImageName{
    
    if (leftImageName && !leftTitle) {
        UIButton * leftButton = [[UIButton alloc]initWithFrame:CGRectMake(0.0, 0.0, 50.0*autoSizeScaleX, 44.0)];
        //        leftButton.backgroundColor = [UIColor yellowColor];
        [leftButton setImage:[UIImage imageNamed:leftImageName] forState:UIControlStateNormal];
        leftButton.imageEdgeInsets = UIEdgeInsetsMake(0, -45*autoSizeScaleX, 0, 0);
        [leftButton addTarget:self action:@selector(leftButtonItemClick:) forControlEvents:UIControlEventTouchUpInside];
        UIBarButtonItem * leftItem = [[UIBarButtonItem alloc]initWithCustomView:leftButton];
        self.navigationItem.leftBarButtonItem = leftItem;
    }
    
    
    if (leftImageName && leftTitle) {
        
        UIButton * leftButton = [[UIButton alloc]init];
        [leftButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        float width =  leftTitle.length *15*autoSizeScaleX + 10 *autoSizeScaleX;
        leftButton.frame = CGRectMake(0.0, 0.0, width, 44.0);
        [leftButton setImage:[UIImage imageNamed:leftImageName] forState:UIControlStateNormal];
        leftButton.imageEdgeInsets = UIEdgeInsetsMake(0, -30*autoSizeScaleX, 0, 0);
        leftButton.titleEdgeInsets = UIEdgeInsetsMake(0, -30*autoSizeScaleX, 0, 0);
        [leftButton setTitle:leftTitle forState:UIControlStateNormal];
        leftButton.titleLabel.font = SYSTEMDEFAULTFONT;
        [leftButton addTarget:self action:@selector(leftButtonItemClick:) forControlEvents:UIControlEventTouchUpInside];
        UIBarButtonItem * leftItem = [[UIBarButtonItem alloc]initWithCustomView:leftButton];
        self.navigationItem.leftBarButtonItem = leftItem;
        
    }
    
    if (firstRightImageName && secondRightImageName) {
        
        UIView *rightView = [[UIView alloc]init];
        rightView.frame = CGRectMake(0, 0, 60.0*autoSizeScaleX, 44.0);
        // rightView.backgroundColor = [UIColor greenColor];
        
        UIButton * rightSecondButton = [[UIButton alloc]initWithFrame:CGRectMake(0.0, 0.0, 30.0*autoSizeScaleX, 44.0)];
        
        //rightSecondButton.backgroundColor = [UIColor redColor];
        // rightSecondButton.imageEdgeInsets = UIEdgeInsetsMake(0, 30, 0, 0);
        
        [rightSecondButton setImage:[UIImage imageNamed:secondRightImageName] forState:UIControlStateNormal];
        [rightSecondButton addTarget:self action:@selector(rightSecondButtonItemClick:) forControlEvents:UIControlEventTouchUpInside];
        [rightView addSubview:rightSecondButton];
        
        
        UIButton * rightFirstButton = [[UIButton alloc]initWithFrame:CGRectMake(35.0*autoSizeScaleX, 0.0, 30.0*autoSizeScaleX, 44.0)];
        // rightFirstButton.backgroundColor = [UIColor redColor];
        // rightFirstButton.imageEdgeInsets = UIEdgeInsetsMake(0, 30, 0, 0);
        
        [rightFirstButton setImage:[UIImage imageNamed:firstRightImageName] forState:UIControlStateNormal];
        [rightFirstButton addTarget:self action:@selector(rightButtonItemClick:) forControlEvents:UIControlEventTouchUpInside];
        [rightView addSubview:rightFirstButton];
        
        
        UIBarButtonItem * rightItem = [[UIBarButtonItem alloc]initWithCustomView:rightView];
        self.navigationItem.rightBarButtonItem = rightItem;
    }
    
    //    [self changeStatusBarBgColor];
}




/** 左侧按钮点击 */
-(void)leftButtonItemClick:(id)sender{

}

/** 右侧按钮点击 */
-(void)rightButtonItemClick:(id)sender{
    
}

/** 右侧第二个按钮点击 */
-(void)rightSecondButtonItemClick:(id)sender{
    
}

@end
