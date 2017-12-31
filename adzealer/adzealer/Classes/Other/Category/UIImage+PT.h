//
//  UIImage+PT.h
//  OSCEPracticalTraining
//
//  Created by yangtuan on 2017/9/26.
//  Copyright © 2017年 yangtuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (PT)

/**
 *  返回一张自由拉伸的图片
 */
+ (UIImage *)resizedImageWithName:(NSString *)name;
+ (UIImage *)resizedImageWithName:(NSString *)name left:(CGFloat)left top:(CGFloat)top;
/** 由颜色生成图片 */
+ (UIImage *)createImageWithColor:(UIColor *)color size:(CGSize)size;
/** 由视图生成图片 */
+ (UIImage *)createImageWithView:(UIView *)view withSize:(CGSize)size;
@end
