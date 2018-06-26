//
//  MergeViewController.m
//  算法
//
//  Created by WangXueqi on 2018/6/25.
//  Copyright © 2018年 JingBei. All rights reserved.
//

#import "MergeViewController.h"

@interface MergeViewController ()
@property(nonatomic,strong)NSArray * numArray;
@end

@implementation MergeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"归并排序法";
    self.view.backgroundColor = [UIColor darkGrayColor];
    NSLog(@"归并排序结果：%@",[self mergeSortArray:[NSMutableArray arrayWithArray:self.numArray]]);
}

- (NSArray *)mergeSortArray:(NSMutableArray *)array {
    //归并排序需要两大步:首先将序列每次折半划分，然后将划分后的序列段两两合并后排序
    NSMutableArray * tempArray = [NSMutableArray arrayWithCapacity:1];
    for (NSNumber * num in array) {
        NSMutableArray * subArray = [NSMutableArray array];
        [subArray addObject:num];
        [tempArray addObject:subArray];
    }
    //分解操作 每一次归并操作 tempArray的个数为（当数组个数为偶数时tempArray.count/2;当数组个数为奇数时tempArray.count/2+1）;当tempArray.count == 1时，归并排序完成
    while (tempArray.count != 1) {
        NSInteger i = 0;
        //当数组个数为偶数时，进行合并操作，当数组个数为奇数时，最后一位轮空
        while (i < tempArray.count - 1) {
            //将i与i+1进行合并操作，将合并结果放入i位置上，将i+1位置上的元素删除
            tempArray[i] = [self mergeFirstArray:tempArray[i] secondArray:tempArray[i + 1]];
            [tempArray removeObjectAtIndex:i + 1];
            i++;
        }
    }
    return [tempArray firstObject];
}
//合并
- (NSArray *)mergeFirstArray:(NSArray *)firArray secondArray:(NSArray *)secArray {
    NSMutableArray * resultArray = [NSMutableArray array];
    //firstIndex是第一段序列的下标 secondIndex是第二段序列的下标
    NSInteger firstIndex = 0, secondIndex = 0;
    //循环第一段和第二段序列，直到任一段序列循环结束
    while (firstIndex < firArray.count && secondIndex < secArray.count) {
        //比较两段序列取出的数值大小，将其存入合并序列，并继续向下循环
        if ([firArray[firstIndex] integerValue] < [secArray[secondIndex] integerValue]) {
            [resultArray addObject:firArray[firstIndex]];
            firstIndex++;
        } else {
            [resultArray addObject:secArray[secondIndex]];
            secondIndex++;
        }
    }
    //将第一段未循环剩余参数全部添加到合并序列
    while (firstIndex < firArray.count) {
        [resultArray addObject:firArray[firstIndex]];
        firstIndex++;
    }
    //将第二段未循环剩余参数全部添加到合并序列
    while (secondIndex < secArray.count) {
        [resultArray addObject:secArray[secondIndex]];
        secondIndex++;
    }
    return resultArray.copy;
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
 归并排序：归并排序是建立在归并操作上的一种有效的排序算法,该算法是采用分治法（Divide and Conquer）的一个非常典型的应用。将已有序的子序列合并，得到完全有序的序列；即先使每个子序列有序，再使子序列段间有序。若将两个有序表合并成一个有序表，称为二路归并。
*/

@end
