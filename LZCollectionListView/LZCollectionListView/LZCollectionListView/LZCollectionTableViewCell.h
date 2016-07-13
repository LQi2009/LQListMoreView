//
//  LZCollectionTableViewCell.h
//  LZCollectionListView
//
//  Created by Artron_LQQ on 16/7/11.
//  Copyright © 2016年 Artup. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LZModel;
typedef void(^callBackBlock)(BOOL open);
@interface LZCollectionTableViewCell : UITableViewCell

//@property (assign, nonatomic) BOOL open;
- (void)reloadDataWithModel:(LZModel *)model;
- (void)callBackWithBlock:(callBackBlock)block;
@end
