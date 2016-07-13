//
//  LZCollectionFooter.m
//  LZCollectionListView
//
//  Created by Artron_LQQ on 16/7/12.
//  Copyright © 2016年 Artup. All rights reserved.
//

#import "LZCollectionFooter.h"
#import "LZConfigFile.h"

@interface LZCollectionFooter ()

@property (strong, nonatomic)UILabel *textLabel;
@end
@implementation LZCollectionFooter

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
    label.backgroundColor = [UIColor greenColor];
    label.font = [UIFont systemFontOfSize:12];
    label.textColor = [UIColor blueColor];
    label.text = @"保险费: 40/天    预授权: 2000";
    label.textAlignment = NSTextAlignmentCenter;
    [self addSubview:label];
    self.textLabel = label;
    
    
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self);
    }];
}

@end
