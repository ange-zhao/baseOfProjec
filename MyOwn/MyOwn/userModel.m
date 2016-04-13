//
//  userModel.m
//  MyOwn
//
//  Created by 赵安吉 on 15/10/12.
//  Copyright © 2015年 赵安吉. All rights reserved.
//

#import "userModel.h"

@implementation userModel
- (NSDictionary*)attributeMapDictionary{
    return @{
              @"token_id"            :       @"token_id"
             ,@"bk_img_url"          :       @"bk_img_url"
             ,@"head_img_url"        :       @"head_img_url"
             ,@"nick_name"           :       @"nick_name"
             ,@"sex"                 :       @"sex"
             ,@"age"                 :       @"age"
             ,@"high"                :       @"high"
             ,@"weight"              :       @"weight"
             ,@"urgent_address"      :       @"urgent_address"
             };
}


@end
