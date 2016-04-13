//
//  addressModel.m
//  MyOwn
//
//  Created by 赵安吉 on 15/10/12.
//  Copyright © 2015年 赵安吉. All rights reserved.
//

#import "addressModel.h"

@implementation addressModel
- (NSDictionary*)attributeMapDictionary{
    return @{
             @"addr_id"         :       @"addr_id"
             ,@"name"           :       @"name"
             ,@"mobile"         :       @"mobile"
             ,@"province_id"    :       @"province_id"
             ,@"city_id"        :       @"city_id"
             ,@"region_id"      :       @"region_id"
             ,@"addr"           :       @"addr"
             ,@"def_addr"       :       @"def_addr"
             ,@"drugshop_id"    :       @"drugshop_id"
             };
}

@end
