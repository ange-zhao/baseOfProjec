//
//  userModel.h
//  MyOwn
//
//  Created by 赵安吉 on 15/10/12.
//  Copyright © 2015年 赵安吉. All rights reserved.
//

#import "baseModel.h"

@interface userModel : baseModel
PROPERTY NSString *token_id;           //
PROPERTY NSString *bk_img_url;
PROPERTY NSString *head_img_url;       // 头像url
PROPERTY NSString *nick_name;
PROPERTY NSString *sex;                // 性别 0：男  1：女
PROPERTY NSString *age;                // 年龄
PROPERTY NSString *high;               // 身高
PROPERTY NSString *weight;             // 体重
PROPERTY NSString *urgent_address;     // 应急地址


@end
