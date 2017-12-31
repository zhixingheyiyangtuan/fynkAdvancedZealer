//
//  PTTabBarViewController.m
//  OSCEPracticalTraining
//
//  Created by yangtuan on 2017/9/26.
//  Copyright © 2017年 yangtuan. All rights reserved.
//

#import "ZEProgramListVC.h"
#import "PTTabBarViewController.h"
#import "PTNavigationController.h"

#import "PTTabBar.h"

@interface PTTabBarViewController ()<PTTabBarDelegate>
/**
 *  自定义的tabbar
 */
@property (nonatomic, weak) PTTabBar *customTabBar;

@end

@implementation PTTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    self.view.backgroundColor = [UIColor yellowColor];
//#warning 自定义tabBar 暂时隐藏
    // 初始化tabbar
    [self setupTabbar];

    // 初始化所有的子控制器
    [self setupAllChildViewControllers];
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    // 删除系统自动生成的UITabBarButton
    for (UIView *child in self.tabBar.subviews) {
        if ([child isKindOfClass:[UIControl class]]) {
            [child removeFromSuperview];
        }
    }
}
//适配iOS 11
-(void)viewWillLayoutSubviews{

    [super viewWillLayoutSubviews];
    // 删除系统自动生成的UITabBarButton
    for (UIView *child in self.tabBar.subviews) {
        if ([child isKindOfClass:[UIControl class]]) {
            [child removeFromSuperview];
        }
    }

}
/**
 *  初始化tabbar
 */
- (void)setupTabbar
{
    PTTabBar *customTabBar = [[PTTabBar alloc] init];
    customTabBar.frame = self.tabBar.bounds;
    customTabBar.delegate = self;
    [self.tabBar addSubview:customTabBar];
    self.customTabBar = customTabBar;
}

#pragma mark - tabbar的代理方法
/**
 *  监听tabbar按钮的改变
 *  @param from   原来选中的位置
 *  @param to     最新选中的位置
 */

-(void)tabBar:(PTTabBar *)tabBar didSelectedButtonFrom:(long)from to:(long)to{

    self.selectedIndex = to;
}


/**
 *  初始化所有的子控制器
 */
- (void)setupAllChildViewControllers
{

    // 1.日程
    ZEProgramListVC *programListVC = [[ZEProgramListVC alloc] init];

    [self setupChildViewController:programListVC title:@"主页" imageName:@"schedule" selectedImageName:@"schedule_selected"];
    
    
}

/**
 *  初始化一个子控制器
 *
 *  @param childVc           需要初始化的子控制器
 *  @param title             标题
 *  @param imageName         图标
 *  @param selectedImageName 选中的图标
 */
- (void)setupChildViewController:(UIViewController *)childVc title:(NSString *)title imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName
{
    // 1.设置控制器的属性
    childVc.title = title;
    // 设置图标
    childVc.tabBarItem.image = [UIImage imageNamed:imageName];
    // 设置选中的图标
    childVc.tabBarItem.selectedImage = [UIImage imageNamed:selectedImageName];
//    childVc.tabBarItem.badgeValue = @"12";
    
    // 2.包装一个导航控制器
    PTNavigationController *nav = [[PTNavigationController alloc] initWithRootViewController:childVc];
    [self addChildViewController:nav];
    
    // 3.添加tabbar内部的按钮
    [self.customTabBar addTabBarButtonWithItem:childVc.tabBarItem];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
