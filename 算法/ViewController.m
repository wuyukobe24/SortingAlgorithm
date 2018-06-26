//
//  ViewController.m
//  算法
//
//  Created by WangXueqi on 2018/6/22.
//  Copyright © 2018年 JingBei. All rights reserved.
//

#import "ViewController.h"
#import "RecursionViewController.h"
#import "BubbleViewController.h"
#import "SelectViewController.h"
#import "QuickBubbleViewController.h"
#import "MergeViewController.h"
#import "InsertViewController.h"
#import "ShellViewController.h"

static NSString * const cellID = @"cellID";
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView * tableView;
@property(nonatomic,strong)NSArray * dataArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"算法";
    [self.view addSubview:self.tableView];
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = [[UIView alloc]init];
    }
    return _tableView;
}

#pragma mark - UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        cell.textLabel.text = self.dataArray[indexPath.row];
        cell.textLabel.textColor = [UIColor blackColor];
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSInteger row = indexPath.row;
    if (row == 0) {
        RecursionViewController * recursion = [[RecursionViewController alloc]init];
        [self.navigationController pushViewController:recursion animated:YES];
    }else if (row == 1) {
        BubbleViewController * bubble = [[BubbleViewController alloc]init];
        [self.navigationController pushViewController:bubble animated:YES];
    }else if (row == 2) {
        SelectViewController * select = [[SelectViewController alloc]init];
        [self.navigationController pushViewController:select animated:YES];
    }else if (row == 3) {
        QuickBubbleViewController * quick = [[QuickBubbleViewController alloc]init];
        [self.navigationController pushViewController:quick animated:YES];
    }else if (row == 4) {
        MergeViewController * merge = [[MergeViewController alloc]init];
        [self.navigationController pushViewController:merge animated:YES];
    }else if (row == 5) {
        InsertViewController * insert = [[InsertViewController alloc]init];
        [self.navigationController pushViewController:insert animated:YES];
    }else if (row == 6) {
        ShellViewController * shell = [[ShellViewController alloc]init];
        [self.navigationController pushViewController:shell animated:YES];
    }
}

#pragma mark - 初始化数据
- (NSArray *)dataArray {
    if (!_dataArray) {
        _dataArray = [NSArray arrayWithObjects:@"递归",@"冒泡排序法",@"选择排序法",@"快速排序法",@"归并排序法",@"插入排序法",@"希尔排序法", nil];
    }
    return _dataArray;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
