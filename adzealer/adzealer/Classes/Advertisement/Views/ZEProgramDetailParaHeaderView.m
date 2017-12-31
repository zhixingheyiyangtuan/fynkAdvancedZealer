//
//  ZEProgramDetailParaHeaderView.m
//  adzealer
//
//  Created by 杨湍 on 2017/12/24.
//  Copyright © 2017年 yangtuan. All rights reserved.
//

#import "ZEProgramDetailParaHeaderView.h"


@interface ZEProgramDetailParaHeaderView ()

@property(nonatomic,weak)UIImageView *progIconV;
@property(nonatomic,weak)UILabel *titleLabel;
@property(nonatomic,weak)UILabel *introLabel;
@property(nonatomic,weak)UILabel *priceLabel;
@property(nonatomic,weak)UILabel *tipLabel;
@property(nonatomic,weak)UILabel *typeLabel;
@property(nonatomic,weak)UILabel *stateLabel;
@property(nonatomic,weak)UILabel *storeLabel;
@property(nonatomic,weak)UILabel *numLabel;
    
@end

@implementation ZEProgramDetailParaHeaderView




-(instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self) {
        [self setupSubViews];
        
    }
    
    return self;
    
}

-(void)setupSubViews{
    self.backgroundColor = [UIColor whiteColor];
    UIImageView *progIconV = [[UIImageView alloc]init];
    progIconV.image = [UIImage imageNamed:@"zealer官方_34"];
    progIconV.layer.cornerRadius = 8.0*autoSizeScaleY;
    progIconV.clipsToBounds = YES;
    [self addSubview:progIconV];
    self.progIconV = progIconV;
    
   
    UILabel *titleLabel = [[UILabel alloc]init];
    titleLabel.textColor =  SYSYTEMTEXTCOLOR;
    titleLabel.font = SYSTEMFONT(20.0);
    titleLabel.text = @"2017年国产旗舰手机检测";
    [self addSubview:titleLabel];
    self.titleLabel = titleLabel;
    
    UILabel *introLabel = [[UILabel alloc]init];
    introLabel.textColor =  SYSYTEMTEXTALPHACOLOR;
    introLabel.font = CONTENTFONT;
    introLabel.numberOfLines = 0;
    introLabel.text = @"简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介";
    [self addSubview:introLabel];
    self.introLabel = introLabel;
    
    UILabel *priceLabel = [[UILabel alloc]init];
    priceLabel.textColor =  SYSYTEMTEXTCOLOR;
    priceLabel.font = SYSTEMFONT(20.0);
   
    
    NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:@"价格:499~1399元"];
   
     [string addAttribute:NSFontAttributeName value:SYSTEMFONT(30) range:NSMakeRange(3, 8)];
    priceLabel.attributedText = string;
    
    [self addSubview:priceLabel];
    self.priceLabel = priceLabel;
    
    UILabel *tipLabel = [[UILabel alloc]init];
    tipLabel.textColor =  [UIColor colorWithHexString:@"ed0101"];
    tipLabel.font = SYSTEMFONT(12.0);
    tipLabel.text = @"每天24点更新库存数";
    [self addSubview:tipLabel];
    self.tipLabel = tipLabel;

    UILabel *typeLabel = [[UILabel alloc]init];
//    typeLabel.backgroundColor = [UIColor yellowColor];
    typeLabel.textColor =  SYSYTEMTEXTCOLOR;
    typeLabel.font = CONTENTFONT;
    typeLabel.text = @"节目类型：视频";
    [self addSubview:typeLabel];
    self.typeLabel = typeLabel;
    
    UILabel *stateLabel = [[UILabel alloc]init];
    stateLabel.textColor =  SYSYTEMTEXTCOLOR;
    stateLabel.font = CONTENTFONT;
    stateLabel.text = @"状态：已上架";
    [self addSubview:stateLabel];
    self.stateLabel = stateLabel;

    
    UILabel *storeLabel = [[UILabel alloc]init];
    storeLabel.textColor =  SYSYTEMTEXTCOLOR;
    storeLabel.font = CONTENTFONT;
    storeLabel.text = @"近90天可售库存数：28";
    [self addSubview:storeLabel];
    self.storeLabel = storeLabel;

    
    UILabel *numLabel = [[UILabel alloc]init];
    numLabel.textColor =  SYSYTEMTEXTCOLOR;
    numLabel.font = CONTENTFONT;
    numLabel.text = @"近30天成交量：244个";
    [self addSubview:numLabel];
    self.numLabel = numLabel;



//
//    //2、lineView
//    UIView *lineView = [[UIView alloc]init];
//    lineView.backgroundColor =  SYSYTELINEGRAY;
//    [self addSubview:lineView];
//    self.lineView = lineView;
//
//    //3、introTV
//    UITextView *introTV = [[UITextView alloc]init];
//    //    introTV.backgroundColor = [UIColor yellowColor];
//    introTV.textColor = SYSYTEMAINGRAY;
//    introTV.font = SYSTEMDEFAULTFONT;
//    introTV.delegate = self;
//    [self addSubview:introTV];
//    self.introTV = introTV;
//
//    //4、placeHolder
//    UILabel *placeHolder = [[UILabel alloc] init];
//    //    self.placeHolder = placeHolder;
//    //    placeHolder.backgroundColor = [UIColor greenColor];
//    placeHolder.font = SYSTEMDEFAULTFONT;
//    placeHolder.text = @"请输入日程说明";
//    placeHolder.textColor = SYSYTEMAINGRAY;
//    placeHolder.numberOfLines = 0;
//    placeHolder.contentMode = UIViewContentModeTop;
//    self.placeHolder = placeHolder;
//    [self.introTV addSubview:placeHolder];
//
//    //5、numLabel
//    UILabel *numLabel = [[UILabel alloc]init];
//    //    numLabel.backgroundColor = [UIColor greenColor];
//    numLabel.textColor =  SYSYTEMAINGRAY;
//    numLabel.font = SYSTEMSMALLFONT;
//    numLabel.text = @"100/200";
//    [self addSubview:numLabel];
//    self.numLabel = numLabel;
    
}

-(void)layoutSubviews{
    [super layoutSubviews];
    //1、名称
    [self.progIconV mas_makeConstraints:^(MASConstraintMaker *make) {

        make.top.equalTo(self.mas_top).offset(8*autoSizeScaleY); make.left.equalTo(self.mas_left).offset(8*autoSizeScaleX);
        make.right.equalTo(self.mas_right).offset(-8*autoSizeScaleX);
        make.height.mas_equalTo(270*autoSizeScaleY);

    }];

    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.progIconV.mas_bottom).offset(16*autoSizeScaleY); make.left.equalTo(self.mas_left).offset(8*autoSizeScaleX);
        
        make.height.mas_equalTo(20*autoSizeScaleY);
        
    }];
    
    [self.introLabel mas_makeConstraints:^(MASConstraintMaker *make) {
     make.top.equalTo(self.titleLabel.mas_bottom).offset(16*autoSizeScaleY);
        make.left.equalTo(self.mas_left).offset(8*autoSizeScaleX);
        make.right.equalTo(self.mas_right).offset(-8*autoSizeScaleX);
        make.height.mas_equalTo(40*autoSizeScaleY);
        
    }];
    
    [self.priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.introLabel.mas_bottom).offset(0*autoSizeScaleY); make.left.equalTo(self.mas_left).offset(8*autoSizeScaleX);
        
        make.height.mas_equalTo(30*autoSizeScaleY);
        
    }];
    
    [self.tipLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.bottom.equalTo(self.priceLabel.mas_bottom).offset(0*autoSizeScaleY); make.left.equalTo(self.priceLabel.mas_right).offset(5*autoSizeScaleX);
        
        make.height.mas_equalTo(20*autoSizeScaleY);
        
    }];
    
    [self.typeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.priceLabel.mas_bottom).offset(8*autoSizeScaleY);
        make.left.equalTo(self.mas_left).offset(8*autoSizeScaleX);
         make.width.mas_equalTo(180*autoSizeScaleY);
        make.height.mas_equalTo(20*autoSizeScaleY);
        
    }];
    
    [self.stateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.priceLabel.mas_bottom).offset(8*autoSizeScaleY);
        make.left.equalTo(self.typeLabel.mas_right).offset(8*autoSizeScaleX);
        make.width.mas_equalTo(200*autoSizeScaleY);
        make.height.mas_equalTo(20*autoSizeScaleY);
        
    }];
    
    [self.storeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.typeLabel.mas_bottom).offset(8*autoSizeScaleY);
        make.left.equalTo(self.mas_left).offset(8*autoSizeScaleX);
        make.width.mas_equalTo(180*autoSizeScaleY);
        make.height.mas_equalTo(20*autoSizeScaleY);
        
    }];
    
    [self.numLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.typeLabel.mas_bottom).offset(8*autoSizeScaleY);
        make.left.equalTo(self.storeLabel.mas_right).offset(8*autoSizeScaleX);
        make.width.mas_equalTo(180*autoSizeScaleY);
        make.height.mas_equalTo(20*autoSizeScaleY);
        
    }];
//    //2、lineView
//    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.titleLabel.mas_bottom).offset(12*autoSizeScaleY); make.left.equalTo(self.mas_left).offset(10*autoSizeScaleX);
//        make.right.equalTo(self.mas_right).offset(-10*autoSizeScaleX);
//        make.height.mas_equalTo(1*autoSizeScaleY);
//
//    }];
//
//    //3、introTV
//    [self.introTV mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.lineView.mas_bottom).offset(12*autoSizeScaleY); make.left.equalTo(self.mas_left).offset(15*autoSizeScaleX);
//        make.right.equalTo(self.mas_right).offset(-15*autoSizeScaleX);
//        make.bottom.equalTo(self.mas_bottom).offset(0*autoSizeScaleX);
//
//    }];
//
//    //4、placeHolder
//    [self.placeHolder mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.introTV.mas_top).offset(8*autoSizeScaleY); make.left.equalTo(self.introTV.mas_left).offset(5*autoSizeScaleX);
//        make.right.equalTo(self.introTV.mas_right).offset(-0*autoSizeScaleX);
//
//    }];
//
//    //5、numLabel
//    [self.numLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//
//        make.bottom.equalTo(self.mas_bottom).offset(-15*autoSizeScaleY);
//
//        make.right.equalTo(self.mas_right).offset(-15*autoSizeScaleX);
//
//
//    }];
    
    //    NSStringFromCGRect(<#CGRect rect#>)
//    NSLog(@"+++=%f",CGRectGetMaxY(self.numLabel.frame));
}

@end
