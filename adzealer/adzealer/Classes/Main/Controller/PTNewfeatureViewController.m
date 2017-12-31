//
//  PTNewfeatureViewController.m
//  OSCEPracticalTraining
//
//  Created by yangtuan on 2017/11/24.
//  Copyright © 2017年 yangtuan. All rights reserved.
//

#import "PTNewfeatureViewController.h"
#import "PTNewfeatureView.h"
#import "PTNewfeatureModel.h"
#import "PTTabBarViewController.h"
#import "PTNewfeaturePageControl.h"
@interface PTNewfeatureViewController ()<UIScrollViewDelegate,PTNewfeatureViewDelegate>

@property(nonatomic,strong)NSArray *dataArray;
@property (nonatomic, weak) PTNewfeaturePageControl *pageControl;
@end

@implementation PTNewfeatureViewController

-(NSArray *)dataArray{

    if (_dataArray == nil) {
        _dataArray = [NSArray array];
        NSArray *sourceArray = @[@{@"featureTitle":@"日程管理",@"featureIcon":@"guideScheduleManagement",@"index":@"0"},
                       @{@"featureTitle":@"事件预约",@"featureIcon":@"guideEventReservation",@"index":@"1"},
                       @{@"featureTitle":@"成绩查询",@"featureIcon":@"guideScoreQuery",@"index":@"2"}];
      _dataArray =  [PTNewfeatureModel mj_objectArrayWithKeyValuesArray:sourceArray];
    }
    return _dataArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
     [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
    // 1.添加UISrollView
    [self setupScrollView];
    
    // 2.添加pageControl
    [self setupPageControl];
    
}

/**
 *  添加pageControl
 */
- (void)setupPageControl
{
    
    PTNewfeaturePageControl *pageControl = [[PTNewfeaturePageControl alloc] init];
    
    CGFloat centerX = self.view.frame.size.width * 0.5;
    CGFloat centerY = self.view.frame.size.height - 30 *autoSizeScaleY;
    pageControl.center = CGPointMake(centerX, centerY);
    pageControl.bounds = CGRectMake(0, 0, 100*autoSizeScaleX, 30*autoSizeScaleY);
    pageControl.userInteractionEnabled = NO;
    
    //有图片显示图片、没图片则显示设置颜色
    //pageControl.pageIndicatorTintColor =[UIColor grayColor];;
    pageControl.currentPageIndicatorTintColor = SYSYTEMAINBLUE;
    
    // pageControl.currentImage =[UIImage imageNamed:@"detail_tupianlunbo_suiji"];
    pageControl.defaultImage =[UIImage imageNamed:@"pageControl"];
    
    //设置pageSize以设置为准、否则以图片大小为准、图片也没有默认7*7...
    pageControl.pageSize = CGSizeMake(10*autoSizeScaleX, 10*autoSizeScaleX);
    pageControl.magrin = 10 *autoSizeScaleX;
    // pageControl.transform=CGAffineTransformScale(CGAffineTransformIdentity, 1.2, 1.2);

    pageControl.numberOfPages = 3;
    pageControl.currentPage = 0;
    [self.view addSubview:pageControl];
    self.pageControl = pageControl;
    
}


/**
 *  添加UISrollView
 */
- (void)setupScrollView
{
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    scrollView.frame = self.view.bounds;
    scrollView.delegate = self;
    [self.view addSubview:scrollView];
//    scrollView.backgroundColor = [UIColor greenColor];
    
    CGFloat ViewW = scrollView.frame.size.width;
    CGFloat ViewH = scrollView.frame.size.height;
    
    for (int index = 0; index<self.dataArray.count; index++) {
        PTNewfeatureView *newfeatureView = [[PTNewfeatureView alloc]init];
        newfeatureView.delegate = self;
        // 设置frame
        CGFloat ViewX = index * ViewW;
        newfeatureView.frame = CGRectMake(ViewX, 0, ViewW, ViewH);
        newfeatureView.model = self.dataArray[index];
        [scrollView addSubview:newfeatureView];
    }

    
    // 3.设置滚动的内容尺寸
    scrollView.contentSize = CGSizeMake(ViewW * self.dataArray.count, 0);
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.pagingEnabled = YES;
    scrollView.bounces = NO;
}

/**
 *  只要UIScrollView滚动了,就会调用
 *
 */
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    // 1.取出水平方向上滚动的距离
    CGFloat offsetX = scrollView.contentOffset.x;
    
    // 2.求出页码
    double pageDouble = offsetX / scrollView.frame.size.width;
    int pageInt = (int)(pageDouble + 0.5);
    self.pageControl.currentPage = pageInt;
}

#pragma -mark PTNewfeatureViewDelegate

-(void)PTNewfeatureViewDelegateStartJourney{

    // 显示状态栏
//    [UIApplication sharedApplication].statusBarHidden = NO;
    // 切换窗口的根控制器
    self.view.window.rootViewController = [[PTTabBarViewController alloc] init];
  

}



@end
