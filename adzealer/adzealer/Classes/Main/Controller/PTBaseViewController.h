//
//  PTBaseViewController.h
//  OSCEPracticalTraining
//
//  Created by yangtuan on 2017/9/26.
//  Copyright © 2017年 yangtuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PTBaseViewController : UIViewController

@property(nonatomic ,strong)UITableView *meTableView;

#pragma -mark 和导航相关
/** 设置标题 */
-(void)setNavigationBarTittle:(NSString*)barTitle;
/** 设置左右导航item 只有图片*/
-(void)setNavigationBarWithLeftBarItemImage:(NSString*)leftImageName rightBarIteImage:(NSString*)rightImageName;
/** 设置左右导航item 只有标题*/
-(void)setNavigationBarWithLeftTitle:(NSString*)leftTitle rightTitle:(NSString*)rightTitle;
/** 设置左右导航item 有图片和标题*/
-(void)setNavigationBarWithLeftTitle:(NSString*)leftTitle WithLeftBarItemImage:(NSString*)leftImageName rightTitle:(NSString*)rightTitle rightBarIteImage:(NSString*)rightImageName;
/** 设置左右导航item 左边一个图片一个文字，右边两个图片*/
-(void)setNavigationBarWithLeftBarItemImage:(NSString*)leftImageName WithLeftTitle:(NSString*)leftTitle rightBarFirstItemImage:(NSString*)firstRightImageName rightBarSecondItemImage:(NSString*)secondRightImageName;

/** 左侧按钮点击 */
-(void)leftButtonItemClick:(id)sender;
/** 右侧按钮点击 */
-(void)rightButtonItemClick:(id)sender;

@end
