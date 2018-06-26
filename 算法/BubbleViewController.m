//
//  BubbleViewController.m
//  算法
//
//  Created by WangXueqi on 2018/6/22.
//  Copyright © 2018年 JingBei. All rights reserved.
//

#import "BubbleViewController.h"

@interface BubbleViewController ()
@property(nonatomic,strong)NSArray * numArray;
@end

@implementation BubbleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"冒泡排序法";
    self.view.backgroundColor = [UIColor darkGrayColor];
    NSLog(@"冒泡排序为%@",[self sortBubbleNumArray:self.numArray]);
}

- (NSMutableArray *)sortBubbleNumArray:(NSArray *)array {
    NSInteger count = array.count;
    NSMutableArray * dataArray = [NSMutableArray arrayWithArray:array];
    for (NSInteger i=0; i<count-1; i++) {
        for (NSInteger j=0; j<count-1-i; j++) {
            if ([dataArray[j] intValue] < [dataArray[j+1] intValue]) {
                //交换位置
                [dataArray exchangeObjectAtIndex:j withObjectAtIndex:j+1];
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
 冒泡排序（Bubble Sort），是一种计算机科学领域的较简单的排序算法。它重复地走访过要排序的数列，一次比较两个元素，如果他们的顺序错误就把他们交换过来。走访数列的工作是重复地进行直到没有再需要交换，也就是说该数列已经排序完成。这个算法的名字由来是因为越大的元素会经由交换慢慢“浮”到数列的顶端。
 */

@end
