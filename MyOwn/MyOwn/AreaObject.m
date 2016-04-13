//
//  AreaObject.m
//  MyOwn
//
//  Created by YangYongJie on 16/3/23.
//  Copyright © 2016年 赵安吉. All rights reserved.
//

#import "AreaObject.h"

@implementation AreaObject
- (NSString *)description{
    return [NSString stringWithFormat:@"%@ %@ %@",self.province,self.city,self.area];
}
@end
