//
//  PTNewfeatureModel.h
//  OSCEPracticalTraining
//
//  Created by yangtuan on 2017/11/24.
//  Copyright © 2017年 yangtuan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PTNewfeatureModel : NSObject
/** 新特性图片*/
@property(nonatomic,copy)NSString *featureIcon;
/** 新特性标题*/
@property(nonatomic,copy)NSString *featureTitle;

/** 标号*/
@property(nonatomic,copy)NSString *index;
@end
