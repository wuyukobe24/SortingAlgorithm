//
//  SelectViewController.m
//  算法
//
//  Created by WangXueqi on 2018/6/22.
//  Copyright © 2018年 JingBei. All rights reserved.
//

#import "SelectViewController.h"

@interface SelectViewController ()
@property(nonatomic,strong)NSArray * numArray;
@end

@implementation SelectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"选择排序法";
    self.view.backgroundColor = [UIColor darkGrayColor];
    NSLog(@"选择排序为%@",[self sortSelectNumArray:self.numArray]);
}

- (NSMutableArray *)sortSelectNumArray:(NSArray *)array {
    NSInteger count = array.count;
    NSMutableArray * dataArray = [NSMutableArray arrayWithArray:array];
    for (NSInteger i=0; i<count; i++) {
        for (NSInteger j=i+1; j<count; j++) {
            if ([dataArray[i] intValue] < [dataArray[j] intValue]) {
                //交换位置
                [dataArray exchangeObjectAtIndex:i withObjectAtIndex:j];
            }
        }
    }
    return dataArray;
}

#pragma mark - 数据初始化
- (NSArray *)numArray {
    if (!_numArray) {
        _numArray = [NSArray arrayWithObjects:@"3",@"49",@"20",@"88",@"93",@"52",@"9",@"35",@"66",@"29", nil];
    }
    return _numArray;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/**
选择排序（Selection sort）是一种简单直观的排序算法。它的工作原理是每一次从待排序的数据元素中选出最小（或最大）的一个元素，存放在序列的起始位置，直到全部待排序的数据元素排完。 选择排序是不稳定的排序方法。
*/

@end
