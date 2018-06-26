//
//  ShellViewController.m
//  算法
//
//  Created by WangXueqi on 2018/6/25.
//  Copyright © 2018年 JingBei. All rights reserved.
//

#import "ShellViewController.h"

@interface ShellViewController ()
@property(nonatomic,strong)NSArray * numArray;
@end

@implementation ShellViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"希尔排序法";
    self.view.backgroundColor = [UIColor darkGrayColor];
    NSLog(@"希尔排序法:%@",[self shellSportArray:[self.numArray mutableCopy]]);
}

- (NSArray *)shellSportArray:(NSMutableArray *)array {
    //起始间隔值gap设置为总数的一半
    NSInteger gap = array.count/2;
    //当gap==1时结束循环
    while (gap >= 1) {
        //把距离为gap的元素编为一个组，循环所有组
        for(NSInteger i=gap; i<array.count; i++){
            //取出第gap的数据
            NSInteger j = i;
            NSNumber * temp = array[i];
            //对距离为gap的元素组进行排序
            while (j >= gap && [temp integerValue] < [array[(j-gap)] integerValue]) {
                [array exchangeObjectAtIndex:j withObjectAtIndex:(j-gap)];
                j = j - gap;
            }
        }
        gap = gap/2;
    }
    return array;
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
希尔排序(Shell Sort)是插入排序的一种。也称缩小增量排序，是直接插入排序算法的一种更高效的改进版本。希尔排序是非稳定排序算法。希尔排序是把记录按下标的一定增量分组，对每组使用直接插入排序算法排序；随着增量逐渐减少，每组包含的关键词越来越多，当增量减至1时，整个文件恰被分成一组，算法便终止。
*/

@end
