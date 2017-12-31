//
//  ApplyInfoView.m
//  Zealer2
//
//  Created by 菲亚诺克 on 2017/12/22.
//  Copyright © 2017年 菲亚诺克. All rights reserved.
//

#import "ApplyInfoView.h"

@interface ApplyInfoView()<UITextViewDelegate>
@property (weak, nonatomic) IBOutlet UIView *lxrView;
@property (weak, nonatomic) IBOutlet UIView *sjhView;
@property (weak, nonatomic) IBOutlet UIView *yzmView;
@property (weak, nonatomic) IBOutlet UIView *wxhView;
@property (weak, nonatomic) IBOutlet UIView *qymcView;
@property (weak, nonatomic) IBOutlet UIView *zyywView;
@property (weak, nonatomic) IBOutlet UIView *qhView;
@property (weak, nonatomic) IBOutlet UIView *zjhView;
@property (weak, nonatomic) IBOutlet UIView *fjhView;

@property (weak, nonatomic) IBOutlet UIView *yyzzView;

@property (weak, nonatomic) IBOutlet UITextField *lxfTextField;
@property (weak, nonatomic) IBOutlet UITextField *sjhTextField;
@property (weak, nonatomic) IBOutlet UITextField *yzmTextField;
@property (weak, nonatomic) IBOutlet UITextField *wxhTextField;
@property (weak, nonatomic) IBOutlet UITextField *qhTextField;
@property (weak, nonatomic) IBOutlet UITextField *zjhTextField;
@property (weak, nonatomic) IBOutlet UITextField *fjhTextField;
@property (weak, nonatomic) IBOutlet UITextField *qymcTextField;
@property (weak, nonatomic) IBOutlet UILabel *hylbLabel;
@property (weak, nonatomic) IBOutlet UITextView *zyywTextView;
@property (weak, nonatomic) IBOutlet UIButton *agreeButton;

@property (weak, nonatomic) IBOutlet UILabel *placeLabel;

@end

@implementation ApplyInfoView
- (void)initView {
    self.lxrView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.sjhView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.yzmView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.wxhView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.qymcView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.hylbView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.zyywView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.qhView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.zjhView.layer.borderColor = [UIColor lightGrayColor].CGColor ;
    self.fjhView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.yyzzView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    
    self.zyywTextView.delegate = self;
    self.yyzzDelButton.hidden = YES;
    self.yyzzImageview.hidden = YES;
}

- (void)setHylb:(NSString *)hylb {
    _hylb = hylb;
    self.hylbLabel.text = hylb;
}

- (IBAction)submitButtonClicked:(id)sender {
}

- (void)textViewDidChange:(UITextView *)textView {
    if ([textView.text isEqualToString:@""]) {
        self.placeLabel.hidden = YES;
    }
}
- (BOOL)textViewShouldBeginEditing:(UITextView *)textView {
    self.placeLabel.hidden = YES;
    return YES;
}
- (void)textViewDidEndEditing:(UITextView *)textView {
    if ([textView.text isEqualToString:@""]) {
        self.placeLabel.hidden = NO;
    }
}
- (IBAction)agreeButtonClicked:(UIButton *)sender {
    sender.selected = !sender.selected;
}
- (IBAction)submitApplyInfo:(UIButton *)sender {
    [[NSNotificationCenter defaultCenter] postNotificationName:@"submitApplyInfo" object:nil];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
