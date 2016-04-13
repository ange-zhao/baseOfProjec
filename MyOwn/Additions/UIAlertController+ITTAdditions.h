//
//  UIAlertController+ITTAdditions.h
//  MyOwn
//
//  Created by YangYongJie on 16/3/17.
//  Copyright © 2016年 赵安吉. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIAlertController (ITTAdditions)
+ (void) popAlertTitle:(NSString *)title message:(NSString *)msg;
+ (void) popAlertTitle:(NSString *)title message:(NSString *)msg cancel:(NSString *)cancel others:(NSString *)others, ...;

@end
