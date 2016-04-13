//
//  ExampleVC.h
//  MyOwn
//
//  Created by 赵安吉 on 16/1/5.
//  Copyright © 2016年 赵安吉. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^ablock) (NSString *str);

@interface ExampleVC : UIViewController
@property (nonatomic,copy)ablock block;
@end
