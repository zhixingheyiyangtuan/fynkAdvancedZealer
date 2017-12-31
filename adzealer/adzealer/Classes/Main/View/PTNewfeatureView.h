//
//  PTNewfeatureView.h
//  OSCEPracticalTraining
//
//  Created by yangtuan on 2017/11/24.
//  Copyright © 2017年 yangtuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PTNewfeatureModel;

@protocol PTNewfeatureViewDelegate <NSObject>

-(void)PTNewfeatureViewDelegateStartJourney;

@end

@interface PTNewfeatureView : UIView

@property(nonatomic,strong) PTNewfeatureModel *model;

@property(nonatomic,weak) id<PTNewfeatureViewDelegate> delegate;

@end
