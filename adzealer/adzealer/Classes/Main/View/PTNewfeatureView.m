//
//  PTNewfeatureView.m
//  OSCEPracticalTraining
//
//  Created by yangtuan on 2017/11/24.
//  Copyright © 2017年 yangtuan. All rights reserved.
//

#import "PTNewfeatureView.h"
#import "PTNewfeatureModel.h"
@interface PTNewfeatureView()

@property(nonatomic,weak)UIImageView *iconImageV;
@property(nonatomic,weak)UILabel *titleLabel;
@property(nonatomic,weak)UIButton *startBtn;
@end


@implementation PTNewfeatureView

-(id)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self) {
        [self setupSubViews];
    }
    
    return self;
    
}

-(void)setupSubViews{
        self.backgroundColor = SYSYTEMCOLOR;
    
    //1、头像
    UIImageView *iconImageV = [[UIImageView alloc]init];
    iconImageV.image = [UIImage imageNamed:@"PortraitBig"];
    [self addSubview:iconImageV];
    
    self.iconImageV = iconImageV;
    
    
    //2、姓名
    UILabel *titleLabel = [[UILabel alloc]init];
//    titleLabel.backgroundColor = [UIColor yellowColor];
    titleLabel.textColor =  SYSYTEMAINBLUE;
    titleLabel.font = SYSTEMBIGFONT;
    titleLabel.text = @"王XX";
    titleLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:titleLabel];
    self.titleLabel = titleLabel;
    
    //3、开始按钮
    UIButton *startBtn = [[UIButton alloc]init];
        startBtn.backgroundColor = SYSYTEMAINBLUE;
    startBtn.layer.cornerRadius = 3.0;
    [startBtn setTitle:@"立即开启" forState:UIControlStateNormal];
    [startBtn addTarget:self action:@selector(startJourney) forControlEvents:UIControlEventTouchUpInside];
    [startBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    startBtn.clipsToBounds = YES;
    [self addSubview:startBtn];
    self.startBtn = startBtn;

    

    
}

-(void)setModel:(PTNewfeatureModel *)model{
    _model = model;
    
    self.titleLabel.text = model.featureTitle;
    self.iconImageV.image = [UIImage imageNamed:model.featureIcon];
    if ([model.index isEqualToString:@"2"]) {
        self.startBtn.hidden = NO;
    }else{
    
       self.startBtn.hidden = YES;
    }

}


-(void)layoutSubviews{
    [super layoutSubviews];
    

    //1、名称
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.mas_centerX).offset(0);
        
        make.bottom.equalTo(self.mas_bottom).offset(-260*autoSizeScaleY);
        make.width.mas_equalTo(100*autoSizeScaleX);
        make.height.mas_equalTo(24*autoSizeScaleY);
        
    }];
    
    [self.iconImageV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.mas_centerX).offset(0);
        make.bottom.equalTo(self.titleLabel.mas_top).offset(-38*autoSizeScaleY);
        make.height.mas_equalTo(182*autoSizeScaleX);
        make.width.mas_equalTo(182*autoSizeScaleX);
        
    }];
    
    //3、开始按钮
    [self.startBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.mas_centerX).offset(0);
        make.bottom.equalTo(self.mas_bottom).offset(-112*autoSizeScaleY);
        make.width.mas_equalTo(200*autoSizeScaleX);
        make.height.mas_equalTo(45*autoSizeScaleY);
        
        
    }];
    
}

-(void)startJourney{

    if (_delegate && [_delegate respondsToSelector:@selector(PTNewfeatureViewDelegateStartJourney)]) {
        [_delegate PTNewfeatureViewDelegateStartJourney];
    }


}

@end
