//
//  XDFriendShareCell.h
//  XDFriendShare
//
//  Created by 郎学东 on 2017/12/1.
//  Copyright © 2017年 郎学东. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CellModel.h"
@interface XDFriendShareCell : UITableViewCell
@property (nonatomic,strong) CellModel * model;
+ (CGFloat)cellHeightWithStr:(NSString *)str imgs:(NSArray *)imgs;
+ (XDFriendShareCell *)dynamicCellWithTable:(UITableView *)table;
@end
