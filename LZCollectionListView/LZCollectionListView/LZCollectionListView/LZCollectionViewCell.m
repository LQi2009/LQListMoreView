//
//  LZCollectionViewCell.m
//  LZCollectionListView
//
//  Created by Artron_LQQ on 16/7/12.
//  Copyright © 2016年 Artup. All rights reserved.
//

#import "LZCollectionViewCell.h"
#import "LZConfigFile.h"

@interface LZCollectionViewCell ()

@property (strong, nonatomic)UILabel *textLabel;
@end
@implementation LZCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
        [self setUI];
    }
    
    return self;
}

- (void)setText:(NSString *)text {
    
    self.textLabel.text = text;
}

- (void)setUI {
    
    UILabel *label = [[UILabel alloc]init];
    label.textColor = [UIColor grayColor];
    label.numberOfLines = 0;
    label.font = [UIFont systemFontOfSize:14];
    label.textAlignment = NSTextAlignmentCenter;
    [self addSubview:label];
    self.textLabel = label;
    
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self);
    }];
}
@end
