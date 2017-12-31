//
//  ZEProgramDetailModel.h
//  adzealer
//
//  Created by 杨湍 on 2017/12/27.
//  Copyright © 2017年 yangtuan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZEProgramDetailModel : NSObject

@end


@interface ZEProgramDetailPriceDetailModel : NSObject

@property (nonatomic) NSString *price;
@property (nonatomic) NSString *wuSeconds;
@property (nonatomic) NSString *shiSeconds;
@property (nonatomic) NSString *shiwuSeconds;
@property (nonatomic) NSString *ershiSeconds;

@end

@interface ZEProgramDetailSellTimeModel : NSObject

@property (nonatomic) NSString *price;
@property (nonatomic) NSString *headNum;
@property (nonatomic) NSString *footerNum;


@end

