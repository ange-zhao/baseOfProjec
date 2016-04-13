//
//  UIAlertController+ITTAdditions.m
//  MyOwn
//
//  Created by YangYongJie on 16/3/17.
//  Copyright © 2016年 赵安吉. All rights reserved.
//

#import "UIAlertController+ITTAdditions.h"

@implementation UIAlertController (ITTAdditions)
+ (void) popAlertTitle:(NSString *)title message:(NSString *)msg {
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:msg preferredStyle:UIAlertControllerStyleAlert];
    
    
    
    
    
    
}

+ (void) popAlertTitle:(NSString *)title message:(NSString *)msg cancel:(NSString *)cancel others:(NSString *)others, ... {
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:msg preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
    }];
    
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    [alertController addAction:cancelAction];
    [alertController addAction:okAction];
   
}


@end
