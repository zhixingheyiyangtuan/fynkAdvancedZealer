//
//  PTDatePickerView.m
//  OSCEPracticalTraining
//
//  Created by yangtuan on 2017/12/19.
//  Copyright © 2017年 yangtuan. All rights reserved.
//

#import "PTDatePickerView.h"

@interface PTDatePickerView()

@property(nonatomic ,weak)UIView *interView;
@property(nonatomic ,weak)UIView *contentV;
@property(nonatomic ,weak)UIButton *cancel;
@property(nonatomic ,weak)UIButton *certain;
@property(nonatomic ,weak)UILabel *tip;
@property(nonatomic ,weak)UIView *headV;
@property(nonatomic ,weak)UIView *lineView;
@property (nonatomic,strong)UIDatePicker *datePicker;

@end

@implementation PTDatePickerView



-(id)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self) {
        [self setupSubViews];
        
    }
    
    return self;
    
}

-(void)setupSubViews{
    
   
    
    self.backgroundColor = [UIColor clearColor];
    
    UIView *interView = [[UIView alloc]init];
    interView.backgroundColor = RGBA(0, 0, 0, 0.4);
    [self addSubview:interView];
    self.interView = interView;
    
    // 添加手势
    UITapGestureRecognizer* tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hiddenSelectView)];
    [self.interView addGestureRecognizer:tap];
    
    UIView *contentV = [[UIView alloc]init];
    contentV.backgroundColor = [UIColor whiteColor];
    [self addSubview:contentV];
    self.contentV = contentV;
  
    
    UIView *headV = [[UIView alloc]init];
    headV.backgroundColor = [UIColor whiteColor];
    [self.contentV addSubview:headV];
    self.headV = headV;
    
    UIView *lineView = [[UIView alloc]init];
    lineView.backgroundColor = SYSYTELINEGRAY;
    [self.contentV addSubview:lineView];
    self.lineView = lineView;
    
    UIButton *cancel = [[UIButton alloc]init];
    [cancel setTitle:@"取消" forState:UIControlStateNormal];
    UIColor * cancelColor =  RGBA(153, 153, 153, 1); //#999999
    [cancel setTitleColor:cancelColor forState:UIControlStateNormal];
    cancel.titleLabel.font = SYSTEMDEFAULTFONT;
    [cancel addTarget:self action:@selector(cancelCilick:) forControlEvents:UIControlEventTouchUpInside];
    
    [headV addSubview:cancel];
    self.cancel = cancel;
    
    UIButton *certain = [[UIButton alloc]init];
    [certain setTitle:@"确定" forState:UIControlStateNormal];
    UIColor * certainColor =  SYSYTEMAINBLUE;
    [certain setTitleColor:certainColor forState:UIControlStateNormal];
    certain.titleLabel.font = SYSTEMDEFAULTFONT;
    [certain addTarget:self action:@selector(certainCilick:) forControlEvents:UIControlEventTouchUpInside];
    
    [headV addSubview:certain];
    self.certain = certain;
    
    UILabel *tip = [[UILabel alloc]init];
    tip.text = @"选择日期";
    UIColor * tipColor =  RGBA(204, 204, 204, 1); //#CCCCCC
    tip.textColor = tipColor;
    tip.font = SYSTEMDEFAULTFONT;
    tip.textAlignment = NSTextAlignmentCenter;
    [headV addSubview:tip];
    self.tip = tip;
    
    
    self.datePicker = [[UIDatePicker alloc]init];
    
//    WithFrame:CGRectMake(0, 80, self.view.frame.size.width, 216)];
    
    self.datePicker.backgroundColor = [UIColor whiteColor];
    self.datePicker.datePickerMode = UIDatePickerModeDate;
    [self.contentV addSubview:self.datePicker];
    
//    [self.datePicker addTarget:self action:@selector(dateChanged:) forControlEvents:UIControlEventValueChanged ];//重点：UIControlEventValueChanged
    
    //设置显示格式
    //默认根据手机本地设置显示为中文还是其他语言
    NSLocale *locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"];//设置为中文显示
    self.datePicker.locale = locale;
    
    
//    //当前时间创建NSDate
//    NSDate *localDate = [NSDate date];
//    //在当前时间加上的时间：格里高利历
//    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
//    NSDateComponents *offsetComponents = [[NSDateComponents alloc] init];
//    //设置时间
//    [offsetComponents setYear:0];
//    [offsetComponents setMonth:0];
//    [offsetComponents setDay:5];
//    [offsetComponents setHour:20];
//    [offsetComponents setMinute:0];
//    [offsetComponents setSecond:0];
//    //设置最大值时间
//    NSDate *maxDate = [gregorian dateByAddingComponents:offsetComponents toDate:localDate options:0];
//    //设置属性
//    self.datePicker.minimumDate = localDate;
//    self.datePicker.maximumDate = maxDate;
}



/** 添加手势 */
- (void)hiddenSelectView {
    
    [self removeFromSuperview];
    
}

-(void)cancelCilick:(UIButton *)btn{
    
    [self removeFromSuperview];
    
}

-(void)certainCilick:(UIButton *)btn{
    
    [self removeFromSuperview];
    //NSDate格式转换为NSString格式
    NSDate *pickerDate = [self.datePicker date];// 获取用户通过UIDatePicker设置的日期和时间
    NSDateFormatter *pickerFormatter = [[NSDateFormatter alloc] init];// 创建一个日期格式器
    [pickerFormatter setDateFormat:@"yyyy年MM月dd日"];
    NSString *dateString = [pickerFormatter stringFromDate:pickerDate];
    
    //打印显示日期时间
    NSLog(@"格式化显示时间：%@",dateString);
    
    if (self.returnDateBlock != nil) {
        
        self.returnDateBlock(dateString);
        
        
    }
    
}

- (void)returnDate:(ReturnDateBlock)block{
    
     self.returnDateBlock = block;
}


-(void)layoutSubviews{
    [super layoutSubviews];
    
    //meTableView
    [self.contentV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(0);
        make.right.equalTo(self.mas_right).offset(0);
        make.bottom.equalTo(self.mas_bottom).offset(0);
        make.height.mas_equalTo(266*autoSizeScaleY);
    }];
    
    //meTableView
    [self.interView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.mas_left).offset(0);
        make.right.equalTo(self.mas_right).offset(0);
        make.bottom.equalTo(self.contentV.mas_top).offset(0);
        make.top.equalTo(self.mas_top).offset(0);
    }];
    
    
    [self.headV mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.contentV.mas_left).offset(0);
        make.right.equalTo(self.contentV.mas_right).offset(0);
        make.top.equalTo(self.contentV.mas_top).offset(0);
        make.height.mas_equalTo(45*autoSizeScaleY);
    }];
    
    
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.contentV.mas_left).offset(0);
        make.right.equalTo(self.contentV.mas_right).offset(0);
        make.top.equalTo(self.headV.mas_bottom).offset(0);
        make.height.mas_equalTo(1*autoSizeScaleY);
    }];
    
    [self.datePicker mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.contentV.mas_left).offset(0);
        make.right.equalTo(self.contentV.mas_right).offset(0);
        make.top.equalTo(self.lineView.mas_bottom).offset(0);
         make.bottom.equalTo(self.contentV.mas_bottom).offset(0);
    }];
    
    [self.cancel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.headV.mas_centerY);
        make.left.equalTo(self.mas_left).offset(10*autoSizeScaleX);
        //        make.right.equalTo(self.mas_right).offset(0);
        //        make.bottom.equalTo(self.mas_bottom).offset(0);
        //        make.height.mas_equalTo(311*autoSizeScaleY);
    }];
    
    [self.certain mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.headV);
        make.right.equalTo(self.mas_right).offset(-10*autoSizeScaleX);
    }];
    
    [self.tip mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.headV.mas_centerY);
        make.centerX.mas_equalTo(self.headV.mas_centerX);
    }];
}


@end

