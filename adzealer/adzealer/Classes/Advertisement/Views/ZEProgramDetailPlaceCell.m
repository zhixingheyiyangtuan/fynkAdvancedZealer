//
//  ZEProgramDetailPlaceCell.m
//  adzealer
//
//  Created by 杨湍 on 2017/12/30.
//  Copyright © 2017年 yangtuan. All rights reserved.
//

#import "ZEProgramDetailPlaceCell.h"

@interface ZEProgramDetailPlaceCell()

@property(nonatomic,weak)UIImageView *imageV;
@property(nonatomic,weak)UILabel *titleLabel;
@property(nonatomic,weak)UIView *lineView;

@end

@implementation ZEProgramDetailPlaceCell

/**快速取cell */
+(instancetype)ZECell:(UITableView *)tableView WithIndexPath:(NSIndexPath *)index
{
    static NSString *const ID = @"ZEProgramDetailPlaceCell";
    ZEProgramDetailPlaceCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
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
    titleLabel.text = @"可售时间";
    [self.contentView addSubview:titleLabel];
    self.titleLabel = titleLabel;
    
    
    //2
    UIView *lineView = [[UIView alloc]init];
    lineView.backgroundColor = [UIColor colorWithHexString:@"dedede"];
    [self.contentView addSubview:lineView];
    self.lineView = lineView;


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
    
}

@end
