//
//  PTTabBar.h
//  OSCEPracticalTraining
//
//  Created by yangtuan on 2017/9/26.
//  Copyright © 2017年 yangtuan. All rights reserved.
//

#import <UIKit/UIKit.h>
@class PTTabBar;
@protocol PTTabBarDelegate <NSObject>

@optional

- (void)tabBar:(PTTabBar *)tabBar didSelectedButtonFrom:(long)from to:(long)to;


@end

@interface PTTabBar : UIView

- (void)addTabBarButtonWithItem:(UITabBarItem *)item;

@property (nonatomic, weak) id<PTTabBarDelegate> delegate;

@end
