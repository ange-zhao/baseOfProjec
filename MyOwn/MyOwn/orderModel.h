//
//  orderModel.h
//  MyOwn
//
//  Created by 赵安吉 on 15/10/12.
//  Copyright © 2015年 赵安吉. All rights reserved.
//

#import "baseModel.h"

@interface orderModel : baseModel
@property (nonatomic, strong) NSString *order_id;       // 订单id
@property (nonatomic, strong) NSString *order_type;     // 订单类型 1:普通2；煎药3:拍照
@property (nonatomic, strong) NSString *status;         // 状态  -3待处理,0未付款,1已付款,2已发货,3.完成
@property (nonatomic, strong) NSString *create_time;    // 生产时间
@property (nonatomic, strong) NSString *order_amount;   // 付款金额
@property (nonatomic, strong) NSArray *images;          //  图片

@end

///////////////////////////////////////////////
@interface OrderMoneyModel : baseModel

@property (nonatomic, strong) NSString *pmt_id;     // 优惠活动标识
@property (nonatomic, strong) NSString *pmt_name;   // 优惠描述
@property (nonatomic, strong) NSString *cpns_id;    // 代金卷
@property (nonatomic, strong) NSString *cart_amount;// 购物车总价
@property (nonatomic, strong) NSString *pmt_amount; // 优惠总价
@property (nonatomic, strong) NSString *order_amount;// 订单总价

@end

///////////////////////////////////////////////
@interface OrderDetailModel : baseModel

@property (nonatomic, strong) NSString *order_id;       // 订单id
@property (nonatomic, strong) NSString *order_type;     // 订单类型 1:普通2；煎药3:拍照
@property (nonatomic, strong) NSString *status;         // 状态  -3待处理,0未付款,1已付款,2已发货,3.完成
@property (nonatomic, strong) NSString *create_time;    // 生产时间
@property (nonatomic, strong) NSString *pay_status;     // 支付状态 0未付款1已付款
@property (nonatomic, strong) NSString *ship_name;      // 收货人姓名
@property (nonatomic, strong) NSString *ship_mobile;    // 联系电话
@property (nonatomic, strong) NSString *ship_addr;      // 收货地址
@property (nonatomic, strong) NSString *remark;         // 客户备注
@property (nonatomic, strong) NSString *drugshop_mark;  // 药店备注
@property (nonatomic, strong) NSString *pay_type;       // 支付方式
@property (nonatomic, strong) NSString *pmt_id;         // 活动id
@property (nonatomic, strong) NSString *pmt_name;       // 活动描述
@property (nonatomic, strong) NSString *cpns_id;        // 代金卷编号
@property (nonatomic, strong) NSString *cpns_name;      // 代金卷描述
@property (nonatomic, strong) NSString *goods_amount;   // 商品金额
@property (nonatomic, strong) NSString *ship_amount;    // 配送金额
@property (nonatomic, strong) NSString *order_amount;   // 付款金额
@property (nonatomic, strong) NSString *cpns_money;
@property (nonatomic, strong) NSString *jy_num;

@property (nonatomic, strong) NSArray *productsArray;
@property (nonatomic, strong) NSArray *picsArray;

@end
