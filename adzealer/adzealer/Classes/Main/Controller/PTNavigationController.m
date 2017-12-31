//
//  PTNavigationController.m
//  OSCEPracticalTraining
//
//  Created by yangtuan on 2017/9/26.
//  Copyright © 2017年 yangtuan. All rights reserved.
//

#import "PTNavigationController.h"
#import "UIImage+PT.h"



@interface PTNavigationController ()

@end

@implementation PTNavigationController

/**
 *  第一次使用这个类的时候会调用(1个类只会调用1次)
 */
+ (void)initialize
{
    // 1.设置导航栏主题
    [self setupNavBarTheme];
//    
//    // 2.设置导航栏按钮主题
//    [self setupBarButtonItemTheme];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

/**
 *  设置导航栏主题
 */
+ (void)setupNavBarTheme
{
    
    // 取出appearance对象
    UINavigationBar *navBar = [UINavigationBar appearance];
    
    //实现背景渐变
    
    //初始化我们需要改变背景色的UIView，并添加在视图上
    

    UIView * backgroundView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, Main_Screen_Width, 64)];
    backgroundView.backgroundColor = [UIColor colorWithHexString:@"#31353b"];
//    //初始化CAGradientlayer对象，使它的大小为UIView的大小
//    CAGradientLayer * gradientLayer = [CAGradientLayer layer];
//    gradientLayer.frame = backgroundView.bounds;
//
//    //将CAGradientlayer对象添加在我们要设置背景色的视图的layer层
//    [backgroundView.layer addSublayer:gradientLayer];
//
//    //设置渐变区域的起始和终止位置（范围为0-1）
//    gradientLayer.startPoint = CGPointMake(0, 0.5);
//    gradientLayer.endPoint = CGPointMake(1, 0.5);
//
//    //设置颜色数组
//    gradientLayer.colors = @[(__bridge id)[SYSYTEMAINBLUE CGColor],(__bridge id)[SYSYTEDARKBLUE CGColor]];
//
//    // 下面方法，第一个参数表示区域大小。第二个参数表示是否是非透明的。如果需要显示半透明效果，需要传NO，否则传YES。第三个参数就是屏幕密度了，关键就是第三个参数 [UIScreen mainScreen].scale。
   
    
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(Main_Screen_Width, 64), NO, 0.0);
    
    
    [backgroundView.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
   
    [navBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
    
    
   
    
//    // 设置标题属性
//    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
//    textAttrs[UITextAttributeTextColor] = [UIColor blackColor];
//    textAttrs[UITextAttributeTextShadowOffset] = [NSValue valueWithUIOffset:UIOffsetZero];
//    textAttrs[UITextAttributeFont] = [UIFont boldSystemFontOfSize:19];
//    [navBar setTitleTextAttributes:textAttrs];
}


- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.viewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
