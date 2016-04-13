//
//  CheckUtil.m
//  KunShanNews
//
//  Created by xiaogang meng on 7/11/12.
//  Copyright (c) 2012 itotem. All rights reserved.
//

#import "CheckUtil.h"

@implementation CheckUtil

+ (BOOL)isValid:(NSString *)value;
{
    return [value length] > 0 ? YES : NO;
//    return (value && ![@"" isEqualToString:value] && ![value isKindOfClass:[NSNull class]]);
}

+ (BOOL)isValidServerName:(NSString *)serverName
{
    if((NSNotFound != [serverName rangeOfString:@"test.s.wiseks.net"].location) ||
       (NSNotFound != [serverName rangeOfString:@"s.wiseks.net"].location)) {
        return YES;
    }else {
        return NO;
    }
}

@end
