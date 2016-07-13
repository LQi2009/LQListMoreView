//
//  LZTableView.m
//  LZCollectionListView
//
//  Created by Artron_LQQ on 16/7/11.
//  Copyright © 2016年 Artup. All rights reserved.
//

#import "LZTableView.h"
#import "LZCollectionTableViewCell.h"
#import "LZConfigFile.h"
#import "LZModel.h"

@interface LZTableView ()<UITableViewDelegate,UITableViewDataSource>

@property (strong, nonatomic)NSMutableArray *dataArray;
@property (copy, nonatomic)tableCallBackBlock callBack;
@end
@implementation LZTableView

- (instancetype)initWithFrame:(CGRect)frame andDataArray:(NSArray *)array {
    self = [super initWithFrame:frame];
    if (self) {
        
        [self setUI];
        
        [self.dataArray addObjectsFromArray:array];
    }
    
    return self;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        
        [self setUI];
    }
    
    return self;
}
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
        [self setUI];
    }
    
    return self;
}

- (void)callBackWithBlock:(tableCallBackBlock)block {
    
    self.callBack = block;
}
- (void)setUI {
    
    UITableView *table = [[UITableView alloc]initWithFrame:self.bounds style:UITableViewStylePlain];
    table.delegate = self;
    table.dataSource = self;
    
    [self addSubview:table];

}
- (NSMutableArray *)dataArray {
    
    if (_dataArray == nil) {
        _dataArray = [NSMutableArray array];
    }
    
    return _dataArray;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    LZCollectionTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellid"];
    if (cell == nil) {
        cell = [[LZCollectionTableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cellid"];
    }
    
    LZModel *model = self.dataArray[indexPath.row];
    
    [cell reloadDataWithModel:model];
    
    [cell callBackWithBlock:^(BOOL open) {
        
        NSLog(@"--------%d",open);
        
        model.open = open;
        [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    }];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    LZModel *model = self.dataArray[indexPath.row];
    if (model.open) {
        // 计算每个cell实际的展开高度
        int appendNum = model.array.count%7 == 0?2:3;
        CGFloat height = (model.array.count / 7 + appendNum) * (kLZScreenWidth/7.0 * 0.6) + lz_tableViewCellHeight;
        return height;
    }
    
    return lz_tableViewCellHeight;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSLog(@">>>%ld",(long)indexPath.row);
    LZModel *model = self.dataArray[indexPath.row];
    
    if (self.callBack) {
        self.callBack(model);
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
