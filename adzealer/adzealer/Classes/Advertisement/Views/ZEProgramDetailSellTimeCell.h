//
//  ZEProgramDetailSellTimeCell.h
//  adzealer
//
//  Created by 杨湍 on 2017/12/27.
//  Copyright © 2017年 yangtuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#define SellTimeHeaderHeight  56*autoSizeScaleY
#define SellTimeDetailGridViewHeight  550*autoSizeScaleY
#define SellTimeCellHeight  (HeaderHeight + SellTimeDetailGridViewHeight)


@interface ZEProgramDetailSellTimeCell : UITableViewCell

/**快速取cell */
+(instancetype)ZECell:(UITableView *)tableView WithIndexPath:(NSIndexPath *)index;

@end
