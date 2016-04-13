//
//  UINavigationController+Rotate.m
//  travel
//
//  Created by admin on 14/12/16.
//  Copyright (c) 2014年 sx. All rights reserved.
//

#import "UINavigationController+Rotate.h"


@implementation UINavigationController (Rotate)

- (UIViewController *)getLastController
{
    return [self.viewControllers lastObject];
}


//控制旋转
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 60000
- (BOOL)shouldAutorotate
{
    return self.topViewController.shouldAutorotate;
}

- (NSUInteger)supportedInterfaceOrientations
{
    return self.topViewController.supportedInterfaceOrientations;
}
#endif

@end
