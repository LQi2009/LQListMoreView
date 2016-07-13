//
//  LZTableView.h
//  LZCollectionListView
//
//  Created by Artron_LQQ on 16/7/11.
//  Copyright © 2016年 Artup. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^tableCallBackBlock)(id obj);
@interface LZTableView : UIView

- (void)callBackWithBlock:(tableCallBackBlock)block;
- (instancetype)initWithFrame:(CGRect)frame andDataArray:(NSArray *)array;
@end
