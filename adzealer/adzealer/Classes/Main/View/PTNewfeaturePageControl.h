//
//  PTNewfeaturePageControl.h
//  OSCEPracticalTraining
//
//  Created by yangtuan on 2017/11/27.
//  Copyright © 2017年 yangtuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PTNewfeaturePageControl : UIPageControl

/**
 *  如果直接使用init初始化、可以手动定义以下属性
 *  其中pageSize为空则跟随图片size
 */
@property (nonatomic,weak)   UIImage * currentImage; //高亮图片
@property (nonatomic,weak)   UIImage * defaultImage; //默认图片
@property (nonatomic,assign)   CGSize pageSize; //图标大小
@property (nonatomic,assign)   CGFloat magrin; //间距

-(instancetype)initWithFrame:(CGRect)frame currentImage:(UIImage *)currentImage andDefaultImage:(UIImage *)defaultImage ;


@end
