//
//  ZEProgramDetailPriceDetailCell.m
//  adzealer
//
//  Created by yangtuan on 2017/12/25.
//  Copyright © 2017年 yangtuan. All rights reserved.
//

#import "ZEProgramDetailPriceDetailCell.h"
#import "JHGridView.h"
#import "ZEProgramDetailModel.h"
@interface ZEProgramDetailPriceDetailCell()<JHGridViewDelegate>

@property(nonatomic,weak)UIImageView *imageV;
@property(nonatomic,weak)UILabel *titleLabel;
@property(nonatomic,weak)UIView *lineView;
@property(nonatomic,weak) JHGridView *gridView;
@end



@implementation ZEProgramDetailPriceDetailCell

/**快速取cell */
+(instancetype)ZECell:(UITableView *)tableView WithIndexPath:(NSIndexPath *)index
{
    static NSString *const ID = @"ZEProgramDetailPriceDetailCell";
    ZEProgramDetailPriceDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
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
    
    
    
    
    JHGridView *gridView  = [[JHGridView alloc] initWithFrame:CGRectMake(8*autoSizeScaleX, 75*autoSizeScaleY, 359*autoSizeScaleX, DetailGridViewHeight)];
   
    self.gridView = gridView;
    gridView.delegate = self;

    
    NSArray *array = @[@{@"price":@"片头广告",
                         @"wuSeconds":@"799",
                         @"shiSeconds":@"999",
                         @"shiwuSeconds":@"1199",
                         @"ershiSeconds":@"1399"},
                       @{@"price":@"片尾广告",
                         @"wuSeconds":@"499",
                         @"shiSeconds":@"799",
                         @"shiwuSeconds":@"999",
                         @"ershiSeconds":@"1199"}
                      
                       ];
    
    NSArray *modelArray = [ZEProgramDetailPriceDetailModel mj_objectArrayWithKeyValuesArray:array];
    
    [gridView setTitles:@[@"价格",
                          @"5秒",
                          @"10秒",
                          @"15秒",
                          @"20秒"]
             andObjects:modelArray withTags:@[@"price",@"wuSeconds",@"shiSeconds",@"shiwuSeconds",@"ershiSeconds"]];
    [self.contentView addSubview:gridView];
    
    
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
    
    NSLog(@"====%f",CGRectGetMaxY(self.lineView.frame));
}


- (void)didSelectRowAtGridIndex:(GridIndex)gridIndex{
    NSLog(@"selected at\ncol:%ld -- row:%ld", gridIndex.col, gridIndex.row);
}

- (BOOL)isTitleFixed{
    return YES;
}

- (CGFloat)widthForColAtIndex:(long)index{
    if (index == 0) {
        return 89*autoSizeScaleX;
    }else{
    return 67.5*autoSizeScaleX;
    }
}

//-(CGFloat)heightForRowAtIndex:(long)index{
//
//     return 40*autoSizeScaleY;
//}
//
//- (CGFloat)heightForTitles{
//
//    return 32*autoSizeScaleY;
//}
//
- (UIColor *)backgroundColorForTitleAtIndex:(long)index{
    return [UIColor colorWithHexString:@"#f1f1f1"];

}

- (UIColor *)backgroundColorForGridAtGridIndex:(GridIndex)gridIndex{
    return [UIColor whiteColor];
}

- (UIColor *)textColorForTitleAtIndex:(long)index{
    return SYSYTEMTEXTCOLOR;
}

- (UIColor *)textColorForGridAtGridIndex:(GridIndex)gridIndex{
    return SYSYTEMTEXTCOLOR;
}

- (UIFont *)fontForTitleAtIndex:(long)index{
    return SMALLFONT;
}

-(UIFont *)fontForGridAtGridIndex:(GridIndex)gridIndex{

     return SMALLFONT;
}
@end
