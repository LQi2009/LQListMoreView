//
//  LZConfigFile.h
//  LZCollectionListView
//
//  Created by Artron_LQQ on 16/7/11.
//  Copyright © 2016年 Artup. All rights reserved.
//

#ifndef LZConfigFile_h
#define LZConfigFile_h

static CGFloat lz_tableViewCellHeight = 105.0;

#define kLZScreenWidth ([UIScreen mainScreen].bounds.size.width)
#define kLZScreenHeight ([UIScreen mainScreen].bounds.size.height)

#define LZWIDTH(W)                       (W/375.f)*kScreenWidth  //获取在当前屏幕的width
#define LZHEIGHT(H)                      (H/667.f)*kScreenHeight //获取在当前屏幕的height
#import "Masonry.h"
#endif /* LZConfigFile_h */
