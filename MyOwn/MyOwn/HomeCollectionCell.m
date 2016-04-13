//
//  HomeCollectionCell.m
//  MyOwn
//
//  Created by YangYongJie on 16/3/24.
//  Copyright © 2016年 赵安吉. All rights reserved.
//

#import "HomeCollectionCell.h"

@implementation HomeCollectionCell
- (void)setCellDataWithModel
{

    self.imageView.layer.cornerRadius = self.imageView.frame.size.height/2;
    self.imageView.layer.masksToBounds = YES;
    self.imageView.layer.borderWidth = 1.f;
    self.imageView.layer.borderColor = [UIColor redColor].CGColor;
    }
@end
