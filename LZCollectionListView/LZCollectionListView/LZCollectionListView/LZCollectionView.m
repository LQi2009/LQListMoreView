//
//  LZCollectionView.m
//  LZCollectionListView
//
//  Created by Artron_LQQ on 16/7/11.
//  Copyright © 2016年 Artup. All rights reserved.
//

#import "LZCollectionView.h"
#import "LZModel.h"
#import "LZConfigFile.h"
#import "LZCollectionFooter.h"
#import "LZCollectionViewCell.h"

@interface LZCollectionView ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (strong, nonatomic) UICollectionView *collection;
@property (copy, nonatomic) selectData callBack;
@property (strong, nonatomic)NSArray *weekendArray;
@property (strong, nonatomic)NSMutableArray *dataArray;
@end
@implementation LZCollectionView

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

- (NSArray *)weekendArray {
    if (_weekendArray == nil) {
        
        _weekendArray = @[@"周一",@"周二",@"周三",@"周四",@"周五",@"周六",@"周日"];
    }
    
    return _weekendArray;
}

- (NSMutableArray *)dataArray {
    if (_dataArray == nil) {
        _dataArray = [NSMutableArray array];
    }
    
    return _dataArray;
}
- (void)setUI {
    
    [self addSubview:self.collection];
    
    [self.collection mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self);
    }];
    
    [self.collection registerClass:[LZCollectionViewCell class] forCellWithReuseIdentifier:@"lzCollectionViewCell"];
    
    [self.collection registerClass:[LZCollectionFooter class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"footer"];
}

- (void)reloadDataWithArray:(NSArray *)array {
    
    if (self.dataArray.count > 0) {
        [self.dataArray removeAllObjects];
    }
    
    [self.dataArray addObjectsFromArray:array];
    
    [self.collection reloadData];
}

- (void)callBackWithBlock:(selectData)block {
    self.callBack = block;
}

- (UICollectionView *)collection {
    if (_collection == nil) {
        
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        _collection = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
        _collection.delegate = self;
        _collection.dataSource = self;
        _collection.backgroundColor = [UIColor whiteColor];
        _collection.scrollEnabled = NO;
    }
    
    return _collection;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    if (self.open) {
        if (section == 0) {
            return 7;
        }
        
        return self.dataArray.count;
    }
    
    return 0;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    LZCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"lzCollectionViewCell" forIndexPath:indexPath];
    
    if (indexPath.section == 0) {
        cell.text = self.weekendArray[indexPath.row];
        cell.backgroundColor = [UIColor greenColor];
    } else {
        cell.text = self.dataArray[indexPath.row];
        cell.backgroundColor = [UIColor cyanColor];
    }
    
    return cell;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    
    return 2;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section {
    
    //第二区的区尾,切是在展开状态下
    if (section == 1 && self.open) {
        return CGSizeMake(0, 30);
    }
    
    return CGSizeMake(0, 0);
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    
    if([kind isEqualToString:UICollectionElementKindSectionFooter]){
        
        if (indexPath.section == 1) {
            LZCollectionFooter *footer = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"footer" forIndexPath:indexPath];
            
            
            return footer;
        }
        
        return nil;
    }
    
    return nil;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        CGFloat width = kLZScreenWidth/7.0;
        return CGSizeMake(width, width*0.6);
    }
    
    CGFloat width = (kLZScreenWidth - 6)/7.0;
    return CGSizeMake(width, width*0.6);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    
    return 1;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    
    if (section == 0) {
        return 0;
    }
    
    return 1;
}

- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    //第一区不可选
    if (indexPath.section == 0) {
        return NO;
    }
    
    return YES;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    // 回到选择结果,根据实际需求修改,这里返回选择的索引值,NSnumber类型
    if (self.callBack) {
        self.callBack(@(indexPath.row));
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
