//
//  PTTabBar.m
//  OSCEPracticalTraining
//
//  Created by yangtuan on 2017/9/26.
//  Copyright © 2017年 yangtuan. All rights reserved.
//

#import "PTTabBar.h"
#import "PTTabBarButton.h"

@interface PTTabBar()

@property (nonatomic, strong) NSMutableArray *tabBarButtons;
@property (nonatomic, weak) PTTabBarButton *selectedButton;

@end

@implementation PTTabBar

- (NSMutableArray *)tabBarButtons
{
    if (_tabBarButtons == nil) {
        _tabBarButtons = [NSMutableArray array];
    }
    return _tabBarButtons;
}




- (void)addTabBarButtonWithItem:(UITabBarItem *)item
{
    // 1.创建按钮
    PTTabBarButton *button = [[PTTabBarButton alloc] init];
    [self addSubview:button];
    // 添加按钮到数组中
    [self.tabBarButtons addObject:button];
    
    // 2.设置数据
    button.item = item;
    
    // 3.监听按钮点击
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchDown];
    
    // 4.默认选中第0个按钮
    if (self.tabBarButtons.count == 1) {
        [self buttonClick:button];
    }
}


/**
 *  监听按钮点击
 */
- (void)buttonClick:(PTTabBarButton *)button
{
    // 1.通知代理
    if ([self.delegate respondsToSelector:@selector(tabBar:didSelectedButtonFrom:to:)]) {
        [self.delegate tabBar:self didSelectedButtonFrom:self.selectedButton.tag to:button.tag];
    }
    
    // 2.设置按钮的状态
    self.selectedButton.selected = NO;
    button.selected = YES;
    self.selectedButton = button;
}


- (void)layoutSubviews
{
    [super layoutSubviews];
    
    
    CGFloat h = self.frame.size.height;
    CGFloat w = self.frame.size.width;
    
    // 按钮的frame数据
    CGFloat buttonH = h;
    CGFloat buttonW = w / self.subviews.count;
    CGFloat buttonY = 0;
    
    for (int index = 0; index<self.tabBarButtons.count; index++) {
        // 1.取出按钮
        PTTabBarButton *button = self.tabBarButtons[index];
        
        // 2.设置按钮的frame
        CGFloat buttonX = index * buttonW;
        
        button.frame = CGRectMake(buttonX, buttonY, buttonW, buttonH);
        
        // 3.绑定tag
        button.tag = index;
    }
}


@end
