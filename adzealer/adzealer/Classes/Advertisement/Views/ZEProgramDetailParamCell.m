//
//  ZEProgramDetailParamCell.m
//  adzealer
//
//  Created by yangtuan on 2017/12/25.
//  Copyright © 2017年 yangtuan. All rights reserved.
//

#import "ZEProgramDetailParamCell.h"
#define TESTCOLOR [UIColor clearColor]

@interface ZEProgramDetailParamCell()

@property(nonatomic,weak)UIImageView *imageV;
@property(nonatomic,weak)UILabel *titleLabel;
@property(nonatomic,weak)UIView *lineView;
@property(nonatomic,weak)UILabel *typeLabel;
@property(nonatomic,weak)UILabel *makerLabel;
@property(nonatomic,weak)UILabel *deviceLabel;
@property(nonatomic,weak)UILabel *peopleLabel;
@property(nonatomic,weak)UILabel *ageLabel;
@property(nonatomic,weak)UILabel *purchaseLabel;
@property(nonatomic,weak)UILabel *earningLabel;
@property(nonatomic,weak)UILabel *cityLabel;
@property(nonatomic,weak)UILabel *tagLabel;
@property(nonatomic,weak)UILabel *interestLabel;
@end


@implementation ZEProgramDetailParamCell


/**快速取cell */
+(instancetype)ZECell:(UITableView *)tableView WithIndexPath:(NSIndexPath *)index
{
    static NSString *const ID = @"ZEProgramDetailParamCell";
    ZEProgramDetailParamCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        [tableView registerClass:self forCellReuseIdentifier:ID];
        cell = [tableView dequeueReusableCellWithIdentifier:ID];
        
    }
    //    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        [self setupSubViews];
    }
    
    return self;
}

-(void)setupSubViews{
    
    
    self.contentView.backgroundColor = [UIColor whiteColor];
    UIImageView *imageV = [[UIImageView alloc]init];
    imageV.image = [UIImage imageNamed:@"未标题-1_03"];
    self.imageV = imageV;
    [self.contentView addSubview:imageV];
    
    
    //2、标题
    UILabel *titleLabel = [[UILabel alloc]init];
    //     titleLabel.backgroundColor = OPENLABORATORYCOLOR;
    titleLabel.textColor =  SYSYTEMTEXTCOLOR;
    titleLabel.font = CONTENTFONT;
    titleLabel.text = @"价格明细";
    [self.contentView addSubview:titleLabel];
    self.titleLabel = titleLabel;
    
    
    //2
    UIView *lineView = [[UIView alloc]init];
    lineView.backgroundColor = [UIColor colorWithHexString:@"dedede"];
    [self.contentView addSubview:lineView];
    self.lineView = lineView;
    
    
    UILabel *typeLabel = [[UILabel alloc]init];
         typeLabel.backgroundColor = TESTCOLOR;
    typeLabel.textColor =  SYSYTEMTEXTCOLOR;
    typeLabel.font = SMALLFONT;
    typeLabel.text = @"品类:智能家居";
    [self.contentView addSubview:typeLabel];
    self.typeLabel = typeLabel;
    
    UILabel *makerLabel = [[UILabel alloc]init];
         makerLabel.backgroundColor = TESTCOLOR;
    makerLabel.textColor =  SYSYTEMTEXTCOLOR;
    makerLabel.font = SMALLFONT;
    makerLabel.text = @"节目制作方:智能家居";
    [self.contentView addSubview:makerLabel];
    self.makerLabel = makerLabel;
    
    UILabel *deviceLabel = [[UILabel alloc]init];
    deviceLabel.backgroundColor = TESTCOLOR;
    deviceLabel.textColor =  SYSYTEMTEXTCOLOR;
    deviceLabel.font = SMALLFONT;
    deviceLabel.text = @"适宜投放终端设备:移动端";
    [self.contentView addSubview:deviceLabel];
    self.deviceLabel = deviceLabel;
    
    UILabel *peopleLabel = [[UILabel alloc]init];
    peopleLabel.backgroundColor = TESTCOLOR;
    peopleLabel.textColor =  SYSYTEMTEXTCOLOR;
    peopleLabel.font = SMALLFONT;
    peopleLabel.text = @"适宜投放人群性别:男士";
    [self.contentView addSubview:peopleLabel];
    self.peopleLabel = peopleLabel;
    
    
    UILabel *ageLabel = [[UILabel alloc]init];
    ageLabel.backgroundColor = TESTCOLOR;
    ageLabel.textColor =  SYSYTEMTEXTCOLOR;
    ageLabel.font = SMALLFONT;
    ageLabel.text = @"适宜投放人群年龄:18～25岁";
    [self.contentView addSubview:ageLabel];
    self.ageLabel = ageLabel;
    
    UILabel *purchaseLabel = [[UILabel alloc]init];
    purchaseLabel.backgroundColor = TESTCOLOR;
    purchaseLabel.textColor =  SYSYTEMTEXTCOLOR;
    purchaseLabel.font = SMALLFONT;
    purchaseLabel.text = @"消费者购买力:弱";
    [self.contentView addSubview:purchaseLabel];
    self.purchaseLabel = purchaseLabel;
    
    UILabel *earningLabel = [[UILabel alloc]init];
    earningLabel.backgroundColor = TESTCOLOR;
    earningLabel.textColor =  SYSYTEMTEXTCOLOR;
    earningLabel.font = SMALLFONT;
    earningLabel.text = @"适宜投放人群收入:5W以下";
    [self.contentView addSubview:earningLabel];
    self.earningLabel = earningLabel;
    
    UILabel *cityLabel = [[UILabel alloc]init];
    cityLabel.backgroundColor = TESTCOLOR;
    cityLabel.textColor =  SYSYTEMTEXTCOLOR;
    cityLabel.font = SMALLFONT;
    cityLabel.text = @"适宜投放城市级别:二线";
    [self.contentView addSubview:cityLabel];
    self.cityLabel = cityLabel;
    
    UILabel *tagLabel = [[UILabel alloc]init];
    tagLabel.backgroundColor = TESTCOLOR;
    tagLabel.textColor =  SYSYTEMTEXTCOLOR;
    tagLabel.font = SMALLFONT;
    tagLabel.text = @"消费人群标签:技术人才";
    [self.contentView addSubview:tagLabel];
    self.tagLabel = tagLabel;
    
    UILabel *interestLabel = [[UILabel alloc]init];
    interestLabel.backgroundColor = TESTCOLOR;
    interestLabel.textColor =  SYSYTEMTEXTCOLOR;
    interestLabel.font = SMALLFONT;
    interestLabel.text = @"消费者兴趣标签:科技";
    [self.contentView addSubview:interestLabel];
    self.interestLabel = interestLabel;

}


-(void)layoutSubviews{
    
    [super layoutSubviews];
    
    [self.imageV mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.mas_equalTo(self.contentView.mas_centerX);
        make.top.equalTo(self.contentView.mas_top).offset(24*autoSizeScaleY);
        make.width.mas_equalTo(120*autoSizeScaleX);
        make.height.mas_equalTo(10*autoSizeScaleY);
        
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.mas_equalTo(self.contentView.mas_centerX);
        make.centerY.mas_equalTo(self.imageV.mas_centerY);
        //        make.width.mas_equalTo(150*autoSizeScaleX);
        //        make.height.mas_equalTo(15*autoSizeScaleY);
        
    }];
    
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.contentView.mas_top).offset(55*autoSizeScaleY);
        make.left.equalTo(self.contentView.mas_left).offset(0*autoSizeScaleY);
        make.right.equalTo(self.contentView.mas_right).offset(0*autoSizeScaleY);
        
        make.height.mas_equalTo(1*autoSizeScaleY);
        
    }];
    
    [self.typeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.lineView.mas_bottom).offset(16*autoSizeScaleY);
        make.left.equalTo(self.contentView.mas_left).offset(8*autoSizeScaleX);
        make.width.mas_equalTo(150*autoSizeScaleX);
        make.height.mas_equalTo(12*autoSizeScaleY);
        
    }];
    
    [self.typeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.lineView.mas_bottom).offset(16*autoSizeScaleY);
        make.left.equalTo(self.contentView.mas_left).offset(8*autoSizeScaleX);
//        make.width.mas_equalTo(150*autoSizeScaleX);
        make.height.mas_equalTo(12*autoSizeScaleY);
        
    }];
    
    [self.makerLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.lineView.mas_bottom).offset(16*autoSizeScaleY);
        make.left.mas_equalTo(self.contentView.mas_centerX).offset(0*autoSizeScaleX);
//        make.width.mas_equalTo(150*autoSizeScaleX);
        make.height.mas_equalTo(12*autoSizeScaleY);
        
    }];
    
    [self.deviceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.typeLabel.mas_bottom).offset(16*autoSizeScaleY);
        make.left.equalTo(self.contentView.mas_left).offset(8*autoSizeScaleX);
        //        make.width.mas_equalTo(150*autoSizeScaleX);
        make.height.mas_equalTo(12*autoSizeScaleY);
        
    }];
    
    [self.peopleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.typeLabel.mas_bottom).offset(16*autoSizeScaleY);
        make.left.mas_equalTo(self.contentView.mas_centerX).offset(0*autoSizeScaleX);
        //        make.width.mas_equalTo(150*autoSizeScaleX);
        make.height.mas_equalTo(12*autoSizeScaleY);
        
    }];

    [self.ageLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.deviceLabel.mas_bottom).offset(16*autoSizeScaleY);
        make.left.equalTo(self.contentView.mas_left).offset(8*autoSizeScaleX);
        //        make.width.mas_equalTo(150*autoSizeScaleX);
        make.height.mas_equalTo(12*autoSizeScaleY);
        
    }];
    
    [self.purchaseLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.deviceLabel.mas_bottom).offset(16*autoSizeScaleY);
        make.left.mas_equalTo(self.contentView.mas_centerX).offset(0*autoSizeScaleX);
        //        make.width.mas_equalTo(150*autoSizeScaleX);
        make.height.mas_equalTo(12*autoSizeScaleY);
        
    }];

    [self.earningLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.ageLabel.mas_bottom).offset(16*autoSizeScaleY);
        make.left.equalTo(self.contentView.mas_left).offset(8*autoSizeScaleX);
        //        make.width.mas_equalTo(150*autoSizeScaleX);
        make.height.mas_equalTo(12*autoSizeScaleY);
        
    }];
    
    [self.cityLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.ageLabel.mas_bottom).offset(16*autoSizeScaleY);
        make.left.mas_equalTo(self.contentView.mas_centerX).offset(0*autoSizeScaleX);
        //        make.width.mas_equalTo(150*autoSizeScaleX);
        make.height.mas_equalTo(12*autoSizeScaleY);
        
    }];
    
    [self.tagLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.earningLabel.mas_bottom).offset(16*autoSizeScaleY);
        make.left.equalTo(self.contentView.mas_left).offset(8*autoSizeScaleX);
        //        make.width.mas_equalTo(150*autoSizeScaleX);
        make.height.mas_equalTo(12*autoSizeScaleY);
        
    }];
    
    [self.interestLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.earningLabel.mas_bottom).offset(16*autoSizeScaleY);
        make.left.mas_equalTo(self.contentView.mas_centerX).offset(0*autoSizeScaleX);
        //        make.width.mas_equalTo(150*autoSizeScaleX);
        make.height.mas_equalTo(12*autoSizeScaleY);
        
    }];
    
}

@end
