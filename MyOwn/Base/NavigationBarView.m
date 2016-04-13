//
//  SHNavigationBarView.m
//  ShenHuaLuGang
//
//  Created by sprint on 13-7-3.
//
//

#import "NavigationBarView.h"

@interface NavigationBarView()
{

    //左边按钮
    IBOutlet UIButton *_leftBarButton;

    //右边按钮
    IBOutlet UIButton *_rightBarButton;
    
    IBOutlet UIButton *_midBarButton;

    
    //导航栏标题
    IBOutlet UILabel *_navigationTitleLabel;
    IBOutlet UILabel *_navigationSubTitleLabel;
    IBOutlet UILabel *_navigationLeftTitleLabel;
    
    IBOutlet UITextField    *_searchTextField;
    IBOutlet UIView         *_searchView;
}
@end

@implementation NavigationBarView




- (void)awakeFromNib
{
    if (IS_IOS7) {
        [self loadNavigationBarViewInIOS7];
    }
    
    _searchView.layer.cornerRadius = 3;
    _searchView.layer.borderWidth  = 1.0f;
    _searchView.layer.borderColor  = [UIColor whiteColor].CGColor;
}

- (void)loadNavigationBarViewInIOS7
{
    _leftBarButton.top = 20;
    _rightBarButton.top = 20;
    _navigationTitleLabel.top = 30;
    _navigationSubTitleLabel.top=50;
    _navigationLeftTitleLabel.top=30;
    _midBarButton.top = 20;
}


-(void)setNavigationBarTitle:(NSString *)title
{

    [_navigationTitleLabel setText:title];

}

-(void) setNavigationBarSubTitle:(NSString *) title{
    [_navigationSubTitleLabel setText:title];
    _navigationTitleLabel.top = _navigationTitleLabel.top-6.0f;
}

-(void) setNavigationBarLeftTitle:(NSString *) title{
    [_navigationLeftTitleLabel setText:title];
}


-(UIButton *)leftBarButton
{
    
    return _leftBarButton;

}

-(UIButton *)rightBarButton
{
    return _rightBarButton;
}

-(UIButton *)midBarButton
{
    return _midBarButton;
}

-(UILabel *) navigationBarTitleLabel
{

    return _navigationTitleLabel;
}

- (UIViewController*)viewController
{
    for (UIView* next = [self superview]; next; next = next.superview)
    {
        UIResponder* nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController*)nextResponder;
        }
    }
    return nil;
}

//- (IBAction)tapGoBackBtn:(id)sender
//{
//    [[self viewController].navigationController popViewControllerAnimated:YES];
//}

@end
