//
//  QuickBubbleViewController.m
//  算法
//
//  Created by WangXueqi on 2018/6/22.
//  Copyright © 2018年 JingBei. All rights reserved.
//

#import "QuickBubbleViewController.h"

@interface QuickBubbleViewController ()
@property(nonatomic,strong)NSArray * numArray;
@end

@implementation QuickBubbleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"快速排序法";
    self.view.backgroundColor = [UIColor darkGrayColor];
    NSMutableArray * dataArray = [NSMutableArray arrayWithArray:self.numArray];
    [self quickSortArray:dataArray leftIndex:0 rightIndex:dataArray.count-1];
    NSLog(@"快速排序法%@",dataArray);
}

/**
 * 快速排序法
 * @param array                 排序数组
 * @param leftIndex             数组首位
 * @param rightIndex            数组末位
 */
- (void)quickSortArray:(NSMutableArray *)array leftIndex:(NSInteger)leftIndex rightIndex:(NSInteger)rightIndex {
    if (leftIndex >= rightIndex) {//如果数组长度为0或1时返回
        return;
    }
    NSInteger i = leftIndex;
    NSInteger j = rightIndex;
    NSInteger key = [array[i] integerValue];//记录比较基准数
    while (i < j) {
        //首先从右边j开始查找比基准数小的值
        while (i < j && [array[j] integerValue] >= key) {//如果比基准数大，继续查找
            j--;
        }
        array[i] = array[j];//如果比基准数小，则将查找到的小值调换到i的位置
        
        //当在右边查找到一个比基准数小的值时，就从i开始往后找比基准数大的值
        while (i < j && [array[i] integerValue] <= key) {//如果比基准数小，继续查找
            i++;
        }
        array[j] = array[i];//如果比基准数大，则将查找到的大值调换到j的位置
    }
    //将基准数放到正确位置
    array[i] = @(key);
    /**递归排序*/
    //排序基准数左边的
    [self quickSortArray:array leftIndex:leftIndex rightIndex:i - 1];
    //排序基准数右边的
    [self quickSortArray:array leftIndex:i + 1 rightIndex:rightIndex];
}

#pragma mark - 数据初始化
- (NSArray *)numArray {
    if (!_numArray) {
        _numArray = [NSArray arrayWithObjects:@"6",@"9",@"3",@"8",@"2",@"0",@"7",@"5",@"1",@"4", nil];
    }
    return _numArray;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/**
快速排序（Quicksort）是对冒泡排序的一种改进。它的基本思想是：通过一趟排序将要排序的数据分割成独立的两部分，其中一部分的所有数据都比另外一部分的所有数据都要小，然后再按此方法对这两部分数据分别进行快速排序，整个排序过程可以递归进行，以此达到整个数据变成有序序列。
*/

@end
