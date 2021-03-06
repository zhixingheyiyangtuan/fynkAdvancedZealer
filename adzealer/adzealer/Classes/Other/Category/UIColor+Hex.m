//
//  UIColor+Hex.m
//  Timeline_Demo
//
//  Created by TOMO on 16/8/4.
//  Copyright © 2016年 TOMO. All rights reserved.
//

#import "UIColor+Hex.h"

@implementation UIColor(Hex)

+ (UIColor *)colorWithHexString:(NSString *)colorString alpha:(CGFloat)alpha
{
    //删除字符串中的空格
    NSString *cString = [[colorString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    //字符串应该是6 －8 个字符
    if ([cString length] < 6) {
        return [UIColor clearColor];
    }
    
    //如果开头是0X开头的，那么截取字符串，字符串从索引为2的位置开始，一直到末尾
    if ([cString hasPrefix:@"0X"]) {
        cString = [cString substringFromIndex:2];
    }
    
    //如果是＃开头的，那么截取字符串，字符串从索引为1的位置开始，一直到末尾
    if ([cString hasPrefix:@"#"]) {
        cString = [cString substringFromIndex:1];
    }
    //如果这时字符串的长度不等于6，返回无色。
    if ([cString length] != 6) {
        return [UIColor clearColor];
    }
    
    //分离红、绿、蓝 三种颜色
    NSRange range;
    range.location  = 0;
    range.length    = 2;
    
    //red
    NSString *redString     = [cString substringWithRange:range];
    
    //green
    range.location  = 2;
    NSString *greenString   = [cString substringWithRange:range];
    
    //blue
    range.location  = 4;
    NSString *blueString    = [cString substringWithRange:range];
    
    //Scan values //扫描值
    unsigned int red, green, blue;
    
    [[NSScanner scannerWithString:redString] scanHexInt:&red];
    [[NSScanner scannerWithString:greenString] scanHexInt:&green];
    [[NSScanner scannerWithString:blueString] scanHexInt:&blue];
  
    return [UIColor colorWithRed:((float)red / 255.f) green:((float)green / 255.f ) blue:((float)blue / 255.f) alpha:alpha];
}

+ (UIColor *)colorWithHexString:(NSString *)colorString
{
    return [self colorWithHexString:colorString alpha:1.0f];
}




















@end
