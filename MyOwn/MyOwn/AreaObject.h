//
//  AreaObject.h
//  MyOwn
//
//  Created by YangYongJie on 16/3/23.
//  Copyright © 2016年 赵安吉. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AreaObject : NSObject
//区域
@property (copy, nonatomic) NSString *region;
//省名
@property (copy, nonatomic) NSString *province;
//城市名
@property (copy, nonatomic) NSString *city;
//区县名
@property (copy, nonatomic) NSString *area;


@end
