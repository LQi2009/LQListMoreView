//
//  LZCollectionView.h
//  LZCollectionListView
//
//  Created by Artron_LQQ on 16/7/11.
//  Copyright © 2016年 Artup. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LZModel;
typedef void(^selectData)(id obj);
@interface LZCollectionView : UIView

@property (assign, nonatomic)BOOL open;
// 回调collection的选择项
- (void)callBackWithBlock:(selectData)block;
// 刷新collection的数据
- (void)reloadDataWithArray:(NSArray *)array;
@end
