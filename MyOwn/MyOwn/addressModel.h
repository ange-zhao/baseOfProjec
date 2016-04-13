//
//  addressModel.h
//  MyOwn
//
//  Created by 赵安吉 on 15/10/12.
//  Copyright © 2015年 赵安吉. All rights reserved.
//

#import "baseModel.h"

@interface addressModel : baseModel
PROPERTY NSString *addr_id;        // 收货地址主键
PROPERTY NSString *name;           // 收货人姓名
PROPERTY NSString *mobile;         // 联系方式
PROPERTY NSString *province_id;    // 省
PROPERTY NSString *city_id;        // 市
PROPERTY NSString *region_id;      // 县
PROPERTY NSString *addr;           // 详细地址
PROPERTY NSString *def_addr;       // 是否默认收货地址
PROPERTY NSString *drugshop_id;    // 匹配的药店
@property (nonatomic, assign) BOOL isSelected;
@property (nonatomic, assign) BOOL isEdit;

@end
