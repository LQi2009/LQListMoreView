//
//  LZCollectionTableViewCell.m
//  LZCollectionListView
//
//  Created by Artron_LQQ on 16/7/11.
//  Copyright © 2016年 Artup. All rights reserved.
//

#import "LZCollectionTableViewCell.h"
#import "LZConfigFile.h"
#import "LZModel.h"
#import "LZTableViewCellContentView.h"
#import "LZCollectionView.h"

@interface LZCollectionTableViewCell ()

@property (strong, nonatomic) LZTableViewCellContentView *cellContentView;

@property (copy, nonatomic) callBackBlock callBack;
@property (strong, nonatomic) LZModel *model;
@property (strong, nonatomic) LZCollectionView *collection;
@end
@implementation LZCollectionTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self setUI];
    }
    
    return self;
}

- (void)reloadDataWithModel:(LZModel *)model {
    
    self.model = model;
    [self.cellContentView reloadDataWithModel:model];
    self.collection.open = model.open;
    [self.collection reloadDataWithArray:model.array];
}

- (void)callBackWithBlock:(callBackBlock)block {
    
    self.callBack = block;
}

- (void)setUI {
    LZTableViewCellContentView *cellContentView = [[LZTableViewCellContentView alloc]init];
    [self addSubview:cellContentView];
    self.cellContentView = cellContentView;
    
    [cellContentView callBackWithBlock:^(BOOL open) {
        
        if (self.callBack) {
            self.callBack(open);
        }
    }];
    
    [cellContentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.mas_equalTo(self);
        make.height.mas_equalTo(@(lz_tableViewCellHeight - 2));
    }];
    
    LZCollectionView *collection = [[LZCollectionView alloc]init];
    collection.open = self.model.open;
    [self addSubview:collection];
    self.collection = collection;
    
    [collection mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.mas_equalTo(self);
        make.top.mas_equalTo(cellContentView.mas_bottom);
    }];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
