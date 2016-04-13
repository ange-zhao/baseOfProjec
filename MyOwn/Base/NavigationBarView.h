//
//  SHNavigationBarView.h
//  ShenHuaLuGang
//
//  Created by sprint on 13-7-3.
//
//

#import <UIKit/UIKit.h>
#import "ITTXibView.h"


/**
    自定义导航栏
 **/
@interface NavigationBarView : ITTXibView


- (UIButton *)leftBarButton;

- (UIButton *)rightBarButton;

- (UIButton *)midBarButton;

- (UILabel  *)navigationBarTitleLabel;

-(void) setNavigationBarTitle:(NSString *) title;
-(void) setNavigationBarSubTitle:(NSString *) title;
-(void) setNavigationBarLeftTitle:(NSString *) title;

@property (nonatomic,retain)    IBOutlet UIView         *searchView;
@property (nonatomic,retain)    IBOutlet UITextField    *searchTextField;
@property (nonatomic,retain)    IBOutlet UILabel *navigationTitleLabel;

@end
