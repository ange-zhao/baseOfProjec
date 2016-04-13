//
//  CheckUtil.h
//  KunShanNews
//
//  Created by xiaogang meng on 7/11/12.
//  Copyright (c) 2012 itotem. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CheckUtil : NSObject


+ (BOOL)isValid:(NSString *)value;
+ (BOOL)isValidServerName:(NSString *)serverName;

@end
