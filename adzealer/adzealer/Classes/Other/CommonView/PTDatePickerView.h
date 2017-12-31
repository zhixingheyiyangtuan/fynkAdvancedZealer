//
//  PTDatePickerView.h
//  OSCEPracticalTraining
//
//  Created by yangtuan on 2017/12/19.
//  Copyright © 2017年 yangtuan. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^ReturnDateBlock)(NSString *returnDate);
@interface PTDatePickerView : UIView

@property (nonatomic, copy) ReturnDateBlock returnDateBlock;

- (void)returnDate:(ReturnDateBlock)block;


@end
