//
//  orderModel.m
//  MyOwn
//
//  Created by 赵安吉 on 15/10/12.
//  Copyright © 2015年 赵安吉. All rights reserved.
//

#import "orderModel.h"

@implementation orderModel
- (NSDictionary*)attributeMapDictionary{
    return @{
             @"order_id"            :       @"order_id"
             ,@"order_type"         :       @"order_type"
             ,@"status"             :       @"status"
             ,@"create_time"        :       @"create_time"
             ,@"order_amount"       :       @"order_amount"
             };
}

@end

//////////////////////////////////////////////
@implementation OrderMoneyModel


- (NSDictionary*)attributeMapDictionary{
    return @{
             @"pmt_name"            :       @"pmt_name"
             ,@"pmt_id"         :       @"pmt_id"
             ,@"cpns_id"         :       @"cpns_id"
             ,@"cart_amount"             :       @"cart_amount"
             ,@"pmt_amount"        :       @"pmt_amount"
             ,@"order_amount"       :       @"order_amount"
             };
}

@end

//////////////////////////////////////////////
@implementation OrderDetailModel



- (NSDictionary*)attributeMapDictionary{
    return @{
             @"order_id"            :       @"order_id"
             ,@"order_type"         :       @"order_type"
             ,@"status"             :       @"status"
             ,@"pay_status"         :       @"pay_status"
             ,@"create_time"        :       @"create_time"
             ,@"ship_name"          :       @"ship_name"
             ,@"ship_mobile"        :       @"ship_mobile"
             ,@"ship_addr"          :       @"ship_addr"
             ,@"remark"             :       @"remark"
             ,@"drugshop_mark"      :       @"drugshop_mark"
             ,@"pay_type"           :       @"pay_type"
             ,@"pmt_id"             :       @"pmt_id"
             ,@"pmt_name"           :       @"pmt_name"
             ,@"cpns_id"            :       @"cpns_id"
             ,@"cpns_name"          :       @"cpns_name"
             ,@"goods_amount"       :       @"goods_amount"
             ,@"ship_amount"        :       @"shipping_amount"
             ,@"order_amount"       :       @"order_amount"
             ,@"cpns_money"         :       @"cpns_money"
             ,@"jy_num"             :       @"jy_num"
             };
}

@end
