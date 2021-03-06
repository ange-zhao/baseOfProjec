//
//  CheckIsRight.h
//  MyOwn
//
//  Created by 赵安吉 on 15/12/30.
//  Copyright © 2015年 赵安吉. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CheckIsRight : NSObject
#pragma 正则匹配手机号
+ (BOOL)checkTelNumber:(NSString *) telNumber;
#pragma 正则匹配用户密码6-18位数字和字母组合
+ (BOOL)checkPassword:(NSString *) password;
#pragma 正则匹配用户姓名,20位的中文或英文
+ (BOOL)checkUserName : (NSString *) userName;
#pragma 正则匹配用户身份证号
+ (BOOL)checkUserIdCard: (NSString *) idCard;
#pragma 正则匹员工号,12位的数字
+ (BOOL)checkEmployeeNumber : (NSString *) number;
#pragma 正则匹配URL
+ (BOOL)checkURL : (NSString *) url;
#pragma 正则匹配Email
+ (BOOL)checkEmail : (NSString *) email;
#pragma 正则匹配Email
+ (BOOL)checkAuthCode : (NSString *) authCode;

@end
