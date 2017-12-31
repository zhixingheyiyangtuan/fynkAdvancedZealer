//
//  ZEProgramDetailPriceDetailCell.h
//  adzealer
//
//  Created by yangtuan on 2017/12/25.
//  Copyright © 2017年 yangtuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#define HeaderHeight  56*autoSizeScaleY
#define DetailGridViewHeight  180*autoSizeScaleY
#define PriceDetailCellHeight  (HeaderHeight + DetailGridViewHeight)

@interface ZEProgramDetailPriceDetailCell : UITableViewCell

/**快速取cell */
+(instancetype)ZECell:(UITableView *)tableView WithIndexPath:(NSIndexPath *)index;

@end
