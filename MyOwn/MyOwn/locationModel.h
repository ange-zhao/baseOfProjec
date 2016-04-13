//
//  locationModel.h
//  MyOwn
//
//  Created by 赵安吉 on 15/10/12.
//  Copyright © 2015年 赵安吉. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef enum {
    LocationModeGaodeMap = 1,
    LocationModeAppleMap = 2
}LocationMode;
@interface locationModel : NSObject
PROPERTY NSString *country;
PROPERTY NSString *province;
PROPERTY NSString *city;
PROPERTY NSString *district;
Property int nIndex;
PROPERTY NSString *poiAddress;
PROPERTY NSString *poiName;
PROPERTY NSString *title;
Property  BOOL selected;
PROPERTY NSString *longitude;
PROPERTY NSString *latitude;
@property (nonatomic,assign) BOOL isRoadAddress;
PROPERTY NSString *distance;
@property (nonatomic,assign) BOOL isDefaultAddress;

@end
