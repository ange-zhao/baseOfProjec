//
//  SHBaseViewController.h
//  ShenHuaLuGang
//
//  Created by 李光辉 on 13-6-27.
//
//

#import <UIKit/UIKit.h>
#import "NavigationBarView.h"

typedef enum
{
    UIButtonStyleBack,              // 返回
    UIButtonStyleNone,              // 没有返回
    UIButtonStyleSave,              // 保存
    UIButtonStyleCancel,            // 取消
    UIButtonStyleSearch,            // 搜索
    UIButtonStyleLogin,             // 登录
    UIButtonStyleRegiser,           // 注册
    UIButtonStyleText,              // 文字
    UIButtonStyleMore               // 更多
} UIButtonStyle;


/**
    基本的ViewController    定制navigationBar
 **/
@interface BaseViewController : UIViewController


@property (nonatomic, retain) IBOutlet UIView * contentView;

-(NavigationBarView *) navigationBarView;


-(void)setNavigationBarTitle:(NSString *)title;
-(void) setNavigationBarSubTitle:(NSString *) title;
-(void) setNavigationBarLeftTitle:(NSString *) title;



//是否显示自定义导航栏 需要子类重写 默认显示
-(Boolean) isCustomNavigationBar;



//设置uibutton 样式

//设置左右uibutton样式。   左边默认返回按钮；右边默认无按钮
- (void)setLeftButtonStyle:(UIButtonStyle)style;
- (void)setRightButtonStyle:(UIButtonStyle)style;
-(void)setRightButtonStyle:(UIButtonStyle)style text:(NSString *)text;

-(void) setUIButtonStyle:(UIButtonStyle) style withUIButton:(UIButton *) button;
-(void)setUIButtonStyle:(UIButtonStyle)style withUIButton:(UIButton *)button text:(NSString *)text;




@end
