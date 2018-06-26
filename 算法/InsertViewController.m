//
//  InsertViewController.m
//  算法
//
//  Created by WangXueqi on 2018/6/25.
//  Copyright © 2018年 JingBei. All rights reserved.
//

#import "InsertViewController.h"

@interface InsertViewController ()
@property(nonatomic,strong)NSArray * numArray;
@end

@implementation InsertViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"插入排序法";
    self.view.backgroundColor = [UIColor darkGrayColor];
    NSLog(@"插入排序法:%@", [self insertSportArray:self.numArray]);
}

//插入排序法（默认从小到大）
- (NSArray *)insertSportArray:(NSArray *)array {
    NSMutableArray * resultArray = [NSMutableArray array];
    for (NSInteger i=0; i<array.count; i++) {
        if (i==0) {//默认第一位不参与排位，直接添加到排序数组中
            [resultArray addObject:array[i]];
        } else {
            if ([array[i] integerValue] >= [[resultArray lastObject] integerValue]) {
                //如果待排位数据大于已排位数组最后一位，则待排位数据直接插入到已排位数组最后一位
                [resultArray addObject:array[i]];
            } else {
                //遍历已排位数组，如果待排位数据小于某个已排位数据，则带排位数据直接插入到该已排位数据的位置
                for (NSInteger j=0; j<resultArray.count; j++) {
                    if ([array[i] integerValue] <= [resultArray[j] integerValue]) {
                        [resultArray insertObject:array[i] atIndex:j];
                        break;
                    }
                }
            }
        }
    }
    return resultArray;
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

/*
插入排序基本操作就是将一个数据插入到已经排好序的有序数据中，从而得到一个新的、个数加一的有序数据，算法适用于少量数据的排序，时间复杂度为O(n^2)。是稳定的排序方法。插入排序的基本思想是：每步将一个待排序的纪录，按其关键码值的大小插入前面已经排序的文件中适当位置上，直到全部插入完为止。
*/

@end
