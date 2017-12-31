//
//  ApplyInfoView.h
//  Zealer2
//
//  Created by 菲亚诺克 on 2017/12/22.
//  Copyright © 2017年 菲亚诺克. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface  ApplyInfoView : UIView
@property (weak, nonatomic) IBOutlet UIButton *yzmButton;

@property (weak, nonatomic) IBOutlet UIView   *hylbView;
@property (weak, nonatomic) IBOutlet UIButton *yyzzButton;
@property (weak, nonatomic) IBOutlet UILabel *uploadImageLabel;
@property (weak, nonatomic) IBOutlet UIButton *yyzzDelButton;
@property (weak, nonatomic) IBOutlet UIImageView *yyzzImageview;

@property (nonatomic,strong) NSString *hylb;
@property (nonatomic,strong) UIImage  *yyzzImage;

- (void)initView;

@end
