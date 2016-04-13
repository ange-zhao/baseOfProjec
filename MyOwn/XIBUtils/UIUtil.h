//
//  UIUtil.h
//
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>


@interface UIUtil : NSObject {
	
}

+ (void)showHint:(UIView *)viewToShowHint 
      hintCenter:(CGPoint)hintCenter
     textContent:(NSString*)text;

+ (void)removeSubviews: (UIView *)superview;

+ (NSString *)getStringWithDate:(NSDate *)date seperator:(NSString *)seperator;
+ (NSString *)getStringWithData:(NSDate *)date format:(NSString*)format;
+ (NSDate *)getDateWithString:(NSString *)str formate:(NSString *)formate;
+ (NSString *)getStringWithDate:(NSDate *)date seperator:(NSString *)seperator includeYear:(BOOL)includeYear;
+ (NSString *)getGroupDateWithDate:(NSDate *)date;
+ (NSDate *)theDateRelativeTodayWithInterval:(NSInteger)interval;
+ (NSDate *)theDateRelativeGivenDayWithInterval:(NSInteger)interval date:(NSDate *)date;
+ (NSString *)getWeekdayWithDate:(NSDate *)date;

+ (NSString*)urlEncode:(NSString*)url stringEncoding:(NSStringEncoding)stringEncoding;

+ (void)adjustPositionToPixel:(UIView*)view;
+ (void)adjustPositionToPixelByOrigin:(UIView*)view;

+ (BOOL)isHighResolutionDevice;

+ (NSString*)imageName:(NSString*) name;
+ (void)setRoundCornerForView:(UIView*)view 
                   withRadius:(CGFloat)r;
+ (void)setBorderForView:(UIView*)view 
               withWidth:(CGFloat)width
               withColor:(UIColor*)color;
+ (CGSize)getFillInImageSize:(CGSize)imgSize frameSize:(CGSize)frameSize;
+ (NSInteger)getImageTypeWithSize:(CGSize)imgSize;
+(UIImage*)getImage:(UIImage*)pImage width:(float)width height:(float)heigth;

+ (void)showHorizontalAnimation:(UIView*)view endX:(CGFloat)endx;

+ (void)showVerticalAnimation:(UIView*)view endY:(CGFloat)endy;

// 字典转换成json字符串   modify by mingtao on 2013-12-17
+ (NSString *)dictionaryToString:(NSDictionary *)dic;
+(UIImage *) imageCompressForWidth:(UIImage *)sourceImage targetWidth:(CGFloat)defineWidth;

// json字符串转换成字典
+ (NSDictionary *)stringToDictionary:(NSString *)resultString;


@end
