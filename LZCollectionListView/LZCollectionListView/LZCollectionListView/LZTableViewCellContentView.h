//
//  LZTableViewCellContentView.h
//  LZCollectionListView
//
//  Created by Artron_LQQ on 16/7/11.
//  Copyright © 2016年 Artup. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LZModel;
typedef void(^callBackBlock)(BOOL open);
@interface LZTableViewCellContentView : UIView

/*配置显示数据*/
- (void)reloadDataWithModel:(LZModel *)model;

/*回调按钮的点击事件*/
- (void)callBackWithBlock:(callBackBlock)block;
@end
