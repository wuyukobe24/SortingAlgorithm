//
//  UIView+Category.m
//  算法
//
//  Created by WangXueqi on 2018/6/22.
//  Copyright © 2018年 JingBei. All rights reserved.
//

#import "UIView+Category.h"

@implementation UIView (Category)

- (void)getSubViews {
    NSLog(@"%@",self);
    for (UIView * subView in self.subviews) {
        [subView getSubViews];
    }
}

@end
