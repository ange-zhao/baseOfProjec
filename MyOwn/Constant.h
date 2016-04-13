//
//  Constant.h
//  MyOwn
//
//  Created by 赵安吉 on 15/12/1.
//  Copyright © 2015年 赵安吉. All rights reserved.
//
//控制器的push事件
#define pushToDestinationController(viewController,DestinationController)\
DestinationController * controller = [[DestinationController alloc] init];\
[viewController.navigationController pushViewController:controller animated:YES];\

//   获取系统版本号
#define SysVer [[[UIDevice currentDevice] systemVersion] floatValue]
#define NowDevice [UIDevice currentDevice]
#define APPDELEGATE         (AppDelegate *)[UIApplication sharedApplication].delegate
//   通知中心
#define NOTIFICATION_CENTER                 [NSNotificationCenter defaultCenter]
//   获取系统版本号
#define IOS_VERSION_CODE   [[[UIDevice currentDevice] systemVersion] intValue]
#define IS_IOS7                             (IOS_VERSION_CODE >= 7)
//   颜色
#define UICOLOR_RGB(r,g,b) UICOLOR_RGBA(r,g,b,1)

#define UICOLOR_RGBA(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]

#define kUIColorFromRGB(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

//  UserDefaults
#define USER_DEFAULT                        [NSUserDefaults standardUserDefaults]
//
#define TOKEN_ID                            @"TOKEN_ID"
#define DEVICE_TOKEN                        @"DEVICE_TOKEN"
//image named 给设置图片
#define ImageNamed(_pointer) [UIImage imageNamed:[UIUtil imageName:_pointer]]


//代理
#define APPDELEGATE         (AppDelegate *)[UIApplication sharedApplication].delegate

//屏幕尺寸
#define UISCREEN            [[UIScreen mainScreen] bounds]
#define SCREEN_HEIGHT       UISCREEN.size.height
#define SCREEN_WIDTH        UISCREEN.size.width

//文字
#define UIFontSize(CGFloat) [UIFont systemFontOfSize:CGFloat]
#define UIBoldFontSize(CGFloat)  [UIFont boldSystemFontOfSize:CGFloat]
            //系统文字大小
#define FONT_S             [UIFont systemFontOfSize:12]
#define FONT_M             [UIFont systemFontOfSize:14]
#define FONT_L             [UIFont systemFontOfSize:17]
#define FONT_HTMLTEXT      [UIFont systemFontOfSize:17]
            //加粗文字大小
#define BOLD_FONT_S  [UIFont boldSystemFontOfSize:12]
#define BOLD_FONT_M  [UIFont boldSystemFontOfSize:14]
#define BOLD_FONT_L  [UIFont boldSystemFontOfSize:17]

//服务器URL
#define kBaseUrl @"http://182.192.214.137:9090/yqna.server"
//测试服务器URL
#define kTestUrl @"http://182.192.214.137:9090/yqna.server"
//属性
#define Property @property (nonatomic)
#define PROPERTY @property (nonatomic,strong)
