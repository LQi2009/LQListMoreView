//
//  LZModel.h
//  LZCollectionListView
//
//  Created by Artron_LQQ on 16/7/11.
//  Copyright © 2016年 Artup. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LZModel : NSObject

@property (copy, nonatomic) NSString *imageString;
@property (copy, nonatomic) NSString *name;
@property (copy, nonatomic) NSString *dsc;
@property (assign, nonatomic) BOOL open;

@property (strong, nonatomic) NSArray *array;
@end
