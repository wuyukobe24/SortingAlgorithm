//
//  RecursionViewController.m
//  算法
//
//  Created by WangXueqi on 2018/6/22.
//  Copyright © 2018年 JingBei. All rights reserved.
//

#import "RecursionViewController.h"
#import "UIView+Category.h"

@interface RecursionViewController ()
@property(nonatomic,strong)NSMutableArray * resultArray;
@property(nonatomic,strong)NSMutableArray<NSMutableArray *> *eightQueens;/** 全局的二维数组（用于八皇后递归算法）*/
@property(nonatomic,assign)int count;
@end

@implementation RecursionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"递归";
    self.view.backgroundColor = [UIColor darkGrayColor];
    /**1.数组递归*/
    _resultArray = [NSMutableArray array];
    NSArray * dataArray = @[@"c",@[@"aa",@"ee"],@5,@[@"ko",@"ppp",@"ms",@[@[@8,@"yy"],@"zz"]]];
    NSLog(@"%@",[self getResultArrayWithArray:dataArray]);
    /**2.view递归*/
    [self.view getSubViews];
    printf("qwq");
    /**3.八皇后递归算法*/
    [self eightQueen:0];
}

#pragma mark - 1.数组递归
- (NSMutableArray *)getResultArrayWithArray:(NSArray *)array {
    for (int i = 0;i < array.count ; i++) {
        if ([array[i] isKindOfClass:[NSArray class]]) {
            [self getResultArrayWithArray:array[i]];
        }else{
            [_resultArray addObject:array[i]];
        }
    }
    return _resultArray;
}
#pragma mark - 3.八皇后递归算法
- (NSMutableArray<NSMutableArray *> *)eightQueens {
    if (!_eightQueens) {
        _eightQueens = [NSMutableArray array];
        for (int i = 0; i < 8; i++) {
            NSMutableArray *tempArray = [NSMutableArray array];
            for (int i = 0; i < 8; i++) {
                [tempArray addObject:@(0)];
            }
            [_eightQueens addObject:tempArray];
        }
    }
    return _eightQueens;
}

#pragma mark -
/**八皇后的递归方法
 @param row 开始行
 */
- (void)eightQueen:(int)row{
    if (row == 8) {
        NSLog(@"这是第%d种解法",self.count +1);
        for (int i = 0; i < 8; i++) {
            for (int j = 0; j < 8; j ++) {
                printf("%d ",[self.eightQueens[i][j] intValue]);
            }
            printf("\n");
        }
        _count++;
    }else {
        for (int k = 0; k < 8; k++) {
            //查看是否这一行的这些列中是否就是存放皇后的位置
            if ([self isQueenPosition:row col:k]) {
                //接着下一行找合适的皇后插入位置
                [self eightQueen:row + 1];
            }
            //row行 k列情况试探完毕 将对应位置重置为0 防止干扰下次结果
            self.eightQueens[row][k] = @(0);
        }
    }
}

/**判断当前位置是否可以存放皇后
 @param row 当前要求解的行
 @param col 位置的列数
 @return 是否可以存放皇后
 */
- (BOOL)isQueenPosition:(int)row col:(int)col {
    //判断列的方向 也就是竖直方向
    for (int i = 0; i < 8; i++) {
        if ([self.eightQueens[i][col] integerValue] == 1) {
            //表示不能放皇后在这个位置
            return NO;
        }
    }
    //判断左上方
    for (int i = row -1,j = col - 1; i >= 0 && j>=0; i--,j--) {
        if ([self.eightQueens[i][j] integerValue] == 1) {
            //表示不能放皇后在这个位置
            return NO;
        }
    }
    //判断右上方
    for (int i = row - 1,j = col + 1; i >= 0 && j < 8 ; i--,j++) {
        if ([self.eightQueens[i][j] integerValue] == 1) {
            //表示不能放皇后在这个位置
            return NO;
        }
    }
    //判断右下方（由于是从第0行开始排列 所以这里可以不用判断）
    for (int i = row,j = col; i < 8 && j < 8; i++,j++) {
        if ([self.eightQueens[i][j] integerValue] == 1) {
            //表示不能放皇后在这个位置
            return NO;
        }
    }
    //判断左下方（由于是从第0行开始排列 所以这里可以不用判断）
    for (int i = row,j = col; i < 8 && j >= 0 ; i++,j--) {
        if ([self.eightQueens[i][j] integerValue] == 1) {
            //表示不能放皇后在这个位置
            return NO;
        }
    }
    //表示这个位置可以放皇后了
    self.eightQueens[row][col] = @(1);
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
/**
 递归算法（英语：recursion algorithm）在计算机科学中是指一种通过重复将问题分解为同类的子问题而解决问题的方法。递归式方法可以被用于解决很多的计算机科学问题，因此它是计算机科学中十分重要的一个概念。绝大多数编程语言支持函数的自调用，在这些语言中函数可以通过调用自身来进行递归。计算理论可以证明递归的作用可以完全取代循环，因此在很多函数编程语言（如Scheme）中习惯用递归来实现循环。
 */

@end
