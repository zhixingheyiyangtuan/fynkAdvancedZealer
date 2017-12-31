//
//  ZEProgramDetailSellTimeCell.m
//  adzealer
//
//  Created by 杨湍 on 2017/12/27.
//  Copyright © 2017年 yangtuan. All rights reserved.
//

#import "ZEProgramDetailSellTimeCell.h"
#import "JHGridView.h"
#import "ZEProgramDetailModel.h"
@interface ZEProgramDetailSellTimeCell()<JHGridViewDelegate>

@property(nonatomic,weak)UIImageView *imageV;
@property(nonatomic,weak)UILabel *titleLabel;
@property(nonatomic,weak)UIView *lineView;
@property(nonatomic,weak) JHGridView *gridView;
@property(nonatomic,weak)UILabel *headerLabel;
@property(nonatomic,weak)UILabel *storeLabel;
@property(nonatomic,weak)UIView *lineView2;
@property(nonatomic,weak)UIView *lineView3;
@property(nonatomic,weak)UIView *lineView4;
@end


@implementation ZEProgramDetailSellTimeCell


/**快速取cell */
+(instancetype)ZECell:(UITableView *)tableView WithIndexPath:(NSIndexPath *)index
{
    static NSString *const ID = @"ZEProgramDetailSellTimeCell";
    ZEProgramDetailSellTimeCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
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
    
    
    //2
    UIView *lineView2 = [[UIView alloc]init];
    lineView2.backgroundColor = [UIColor colorWithHexString:@"dedede"];
    [self.contentView addSubview:lineView2];
    self.lineView2 = lineView2;
    
    //2
    UIView *lineView3 = [[UIView alloc]init];
    lineView3.backgroundColor = [UIColor colorWithHexString:@"dedede"];
    [self.contentView addSubview:lineView3];
    self.lineView3 = lineView3;
    
    
    //2
    UIView *lineView4 = [[UIView alloc]init];
    lineView4.backgroundColor = [UIColor colorWithHexString:@"dedede"];
    [self.contentView addSubview:lineView4];
    self.lineView4 = lineView4;
    
//    //2、标题
    UILabel *storeLabel = [[UILabel alloc]init];
    //     titleLabel.backgroundColor = OPENLABORATORYCOLOR;
    storeLabel.textColor =  SYSYTEMTEXTCOLOR;
    storeLabel.font = CONTENTFONT;
    storeLabel.text = @"仅90天库存情况(更新频率：2次/周)";
    [self.contentView addSubview:storeLabel];
    self.storeLabel = storeLabel;
    
    
    
    
    
    
    
    JHGridView *gridView  = [[JHGridView alloc] initWithFrame:CGRectMake(8*autoSizeScaleX, 107*autoSizeScaleY, 359*autoSizeScaleX, SellTimeDetailGridViewHeight)];
    
    self.gridView = gridView;
    gridView.delegate = self;
    
    
    NSArray *array = @[@{@"price":@"10月16日～10月22日",
                         @"headNum":@"799",
                         @"footerNum":@"999",
                         },
                       @{@"price":@"10月16日～10月22日",
                         @"headNum":@"499",
                         @"footerNum":@"999",
                         },
                       @{@"price":@"10月16日～10月22日",
                         @"headNum":@"799",
                         @"footerNum":@"999",
                         },
                       @{@"price":@"10月16日～10月22日",
                         @"headNum":@"499",
                         @"footerNum":@"999",
                         },
                       @{@"price":@"10月16日～10月22日",
                         @"headNum":@"799",
                         @"footerNum":@"999",
                         },
                       @{@"price":@"10月16日～10月22日",
                         @"headNum":@"499",
                         @"footerNum":@"999",
                         },
                       @{@"price":@"10月16日～10月22日",
                         @"headNum":@"799",
                         @"footerNum":@"999",
                         },
                       @{@"price":@"10月16日～10月22日",
                         @"headNum":@"499",
                         @"footerNum":@"999",
                         },
                       @{@"price":@"10月16日～10月22日",
                         @"headNum":@"799",
                         @"footerNum":@"999",
                         },
                       
                       @{@"price":@"10月16日～10月22日",
                         @"headNum":@"499",
                         @"footerNum":@"999",
                         },
                     
                       ];
    
    NSArray *modelArray = [ZEProgramDetailSellTimeModel mj_objectArrayWithKeyValuesArray:array];
    
    [gridView setTitles:@[@"价格",
                          @"片头广告剩余库存",
                          @"片尾广告剩余库存",
                          ]
             andObjects:modelArray withTags:@[@"price",@"headNum",@"footerNum"]];
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
    
    [self.lineView2 mas_makeConstraints:^(MASConstraintMaker *make) {

    make.top.equalTo(self.lineView.mas_bottom).offset(16*autoSizeScaleY);
        make.left.equalTo(self.contentView.mas_left).offset(8*autoSizeScaleX);
        make.width.mas_equalTo(359*autoSizeScaleX);

        make.height.mas_equalTo(1*autoSizeScaleY);

    }];

    
    [self.storeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.lineView2.mas_bottom).offset(8*autoSizeScaleY);
        make.centerX.mas_equalTo(self.contentView.mas_centerX);
        
        make.height.mas_equalTo(16*autoSizeScaleY);
        
    }];
    
    
    [self.lineView3 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.lineView2.mas_bottom).offset(0*autoSizeScaleY);
       make.bottom.equalTo(self.gridView.mas_top).offset(0*autoSizeScaleY);
        make.left.equalTo(self.gridView.mas_left).offset(0*autoSizeScaleX);
        make.width.mas_equalTo(1*autoSizeScaleX);
        
    }];
    
    [self.lineView4 mas_makeConstraints:^(MASConstraintMaker *make) {

        make.top.equalTo(self.lineView2.mas_bottom).offset(0*autoSizeScaleY);
        make.bottom.equalTo(self.gridView.mas_top).offset(0*autoSizeScaleY);
        make.right.equalTo(self.gridView.mas_right).offset(0*autoSizeScaleX);
        make.width.mas_equalTo(1*autoSizeScaleX);

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
  
    CGFloat lingW = 150 *autoSizeScaleX ;
    if (index == 0) {
         return lingW;
    }else{
        return (359*autoSizeScaleX - lingW)/2;
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

