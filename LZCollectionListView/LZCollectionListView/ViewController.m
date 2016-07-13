//
//  ViewController.m
//  LZCollectionListView
//
//  Created by Artron_LQQ on 16/7/11.
//  Copyright © 2016年 Artup. All rights reserved.
//

#import "ViewController.h"
#import "LZModel.h"

#import "LZTableView.h"

@interface ViewController ()

@property (strong, nonatomic)NSMutableArray *dataArray;
@end

@implementation ViewController

- (NSMutableArray *)dataArray {
    
    if (_dataArray == nil) {
        _dataArray = [NSMutableArray array];
    }
    
    return _dataArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    for (int i = 0; i < 20; i++) {
        LZModel *model = [[LZModel alloc]init];
        model.name = [NSString stringWithFormat:@"测试.%d",i];
        model.dsc = @"测试数据";
        model.imageString = @"40fe711f9b754b596159f3a6.jpg";
        NSMutableArray *arr = [NSMutableArray array];
        int num = arc4random() %20 + 6;
        for (int i = 0; i < num; i++) {
            [arr addObject:[NSString stringWithFormat:@"%d",arc4random()%100]];
        }
        
        model.array = arr;
        [self.dataArray addObject:model];
    }
    
    LZTableView *table = [[LZTableView alloc]initWithFrame:self.view.bounds andDataArray:self.dataArray];
    
    [table callBackWithBlock:^(id obj) {
        
        NSLog(@"选择了>>%@",obj);
    }];
    [self.view addSubview:table];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
