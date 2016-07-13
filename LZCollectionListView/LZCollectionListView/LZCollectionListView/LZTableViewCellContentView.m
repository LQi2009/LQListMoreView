//
//  LZTableViewCellContentView.m
//  LZCollectionListView
//
//  Created by Artron_LQQ on 16/7/11.
//  Copyright © 2016年 Artup. All rights reserved.
//

#import "LZTableViewCellContentView.h"
#import "LZConfigFile.h"
#import "LZModel.h"

@interface LZTableViewCellContentView ()

@property (strong, nonatomic) UIImageView *imageView;
@property (strong, nonatomic) UILabel *nameLabel;
@property (strong, nonatomic) UILabel *dscLabel;
@property (strong, nonatomic) UIButton *moreButton;
@property (copy, nonatomic) callBackBlock callBack;
@end

@implementation LZTableViewCellContentView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
        [self setUI];
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

- (void)reloadDataWithModel:(LZModel *)model {
    
    self.imageView.image = [UIImage imageNamed:model.imageString];
    self.nameLabel.text = model.name;
    self.dscLabel.text = model.dsc;
    
    self.moreButton.selected = model.open;
}

- (void)callBackWithBlock:(callBackBlock)block {
    
    self.callBack = block;
}
- (void)moreButtonClick:(UIButton *)button {
    
    button.selected = !button.selected;
    if (self.callBack) {
        self.callBack(button.selected);
    }
}

- (void)setUI {
    
    [self addSubview:self.imageView];
    [self addSubview:self.nameLabel];
    [self addSubview:self.dscLabel];
    [self addSubview:self.moreButton];
    [self.moreButton addTarget:self action:@selector(moreButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self).offset(10);
        make.top.mas_equalTo(self).offset(4);
        make.bottom.mas_equalTo(self).offset(-4);
        make.width.mas_equalTo(self.imageView.mas_height);
    }];
    
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.imageView.mas_right).offset(10);
        make.top.mas_equalTo(self).offset(4);
        make.right.mas_equalTo(self).offset(-10);
        make.height.mas_equalTo(@30);
    }];
    
    [self.dscLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.imageView.mas_right).offset(10);
        make.bottom.mas_equalTo(self.imageView);
        make.height.mas_equalTo(@30);
        make.right.mas_equalTo(self.moreButton.mas_left).offset(-10);
    }];
    
    [self.moreButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self).offset(-10);
        make.bottom.mas_equalTo(self).offset(-4);
        make.height.mas_equalTo(@30);
        make.width.mas_equalTo(@50);
    }];
}

- (UIImageView *)imageView {
    if (_imageView == nil) {
        _imageView = [[UIImageView alloc]init];
        _imageView.contentMode = UIViewContentModeScaleAspectFit;
    }
    
    return _imageView;
}

- (UILabel *)nameLabel {
    if (_nameLabel == nil) {
        _nameLabel = [[UILabel alloc]init];
        _nameLabel.font = [UIFont systemFontOfSize:18];
        _nameLabel.textColor = [UIColor blackColor];
    }
    
    return _nameLabel;
}

- (UILabel *)dscLabel {
    if (_dscLabel == nil) {
        _dscLabel = [[UILabel alloc]init];
        _dscLabel.font = [UIFont systemFontOfSize:14];
        _dscLabel.textColor = [UIColor grayColor];
    }
    
    return _dscLabel;
}

- (UIButton *)moreButton {
    if (_moreButton == nil) {
        _moreButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _moreButton.titleLabel.font = [UIFont systemFontOfSize:14];
        [_moreButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_moreButton setTitle:@"更多" forState:UIControlStateNormal];
    }
    
    return _moreButton;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
