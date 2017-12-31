//
//  CenterModelView.m
//  Zealer2
//
//  Created by 菲亚诺克 on 2017/12/27.
//  Copyright © 2017年 菲亚诺克. All rights reserved.
//

#import "CenterModelView.h"


@interface CenterModelView()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *typeLabel;
@property (weak, nonatomic) IBOutlet UILabel *desLabel;


@end

@implementation CenterModelView
- (void)setType:(int)type {
    _type = type;
    
    self.applyButton.layer.cornerRadius = 4;
    self.applyButton.layer.masksToBounds = YES;
    // ==1 广告主
    if (type == 1) {
        self.imageView.image = [UIImage imageNamed:@"ggz_icon"];
        self.typeLabel.text = @"广告主";
        self.desLabel.text = @"这里的介绍是广告主预留的";
        [self.applyButton setTitle:@"广告主入驻" forState:UIControlStateNormal];
    }else{
        self.imageView.image = [UIImage imageNamed:@"llz_icon"];
        self.typeLabel.text = @"流量主";
        self.desLabel.text = @"这里的介绍是流量主预留的";
        [self.applyButton setTitle:@"流量主入驻" forState:UIControlStateNormal];
    }
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
