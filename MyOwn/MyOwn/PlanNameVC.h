//
//  PlanNameVC.h
//  MyOwn
//
//  Created by 赵安吉 on 16/1/5.
//  Copyright © 2016年 赵安吉. All rights reserved.
//

#import "BaseViewController.h"
typedef void (^block) (NSString *str);
@interface PlanNameVC : BaseViewController
@property (nonatomic,copy)block block;
@end
