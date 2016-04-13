//
//  SHBaseViewController.m
//  ShenHuaLuGang
//
//  Created by sprint on 13-6-27.
//
//

#import "BaseViewController.h"

#define P_COLOR [UIColor colorWithWhite:1.0f alpha:0.8f]

@interface BaseViewController ()
{
    
    NavigationBarView *_navigationBarView;
}
@end

@implementation BaseViewController

//是否显示自定义导航栏 需要子类重写 默认显示
-(Boolean)isCustomNavigationBar
{
    return true;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self initSwipeGr];
    [self setViewControllerBackgroundView];
    
    if([ self isCustomNavigationBar])
    {
        [self loadNavigationBar];
    }
    
    [self setLeftButtonStyle:UIButtonStyleBack];
    
    [self setUpView];
    
    //[APPDELEGATE hideTabBarAnimated:YES];
    
    if ( SysVer >= 7 ) {
        self.automaticallyAdjustsScrollViewInsets = NO;
        [self setAutoLayout];
    }
}
//定义扫动手势返回上一个控制器
-(void)initSwipeGr{
    UISwipeGestureRecognizer *swipeGr = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(goLastVC)];
    [swipeGr setDirection:UISwipeGestureRecognizerDirectionRight];
    swipeGr.cancelsTouchesInView = NO;
    [self.view addGestureRecognizer:swipeGr];
}
-(void)goLastVC{
[self.navigationController popViewControllerAnimated:YES];
}
- (void)setUpView
{
    if (!_contentView) {
        _contentView = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
        [self.view addSubview:_contentView];
    }
//    _contentView.frame = [UIScreen mainScreen].bounds;
//    [self setAutoLayout];
    self.view.height = IS_IOS7 ? SCREEN_HEIGHT : SCREEN_HEIGHT - 20;
    CGFloat navgationHeight = IS_IOS7 ? 64 : 44;
    
    if( [ self isCustomNavigationBar] )
    {
        _contentView.top = navgationHeight;
        _contentView.height = SCREEN_HEIGHT - 64;
    } else {
        _contentView.top = 20;
        _contentView.height = SCREEN_HEIGHT - 20;
    }
//    _contentView.top = navgationHeight;
//    _contentView.height = SCREEN_HEIGHT - 64;

}

/**
 * 设置 _contentView 以自动布局的方式填充父窗体
 */
-(void)setAutoLayout
{
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_contentView
                                                              attribute:NSLayoutAttributeTop
                                                              relatedBy:NSLayoutRelationEqual
                                                                 toItem:self.view
                                                              attribute:NSLayoutAttributeBottom
                                                             multiplier:1.0
                                                               constant:10]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_contentView
                                                          attribute:NSLayoutAttributeLeft
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeLeft
                                                         multiplier:1.0
                                                           constant:0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_contentView
                                                          attribute:NSLayoutAttributeRight
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeRight
                                                         multiplier:1.0
                                                           constant:0]];
}

//设置背景图片
-(void) setViewControllerBackgroundView
{    
    self.view.backgroundColor = [UIColor colorWithRed:247.0 / 255 green:244.0 / 255 blue:238.0 / 255 alpha:1];
    
//    UIImageView *backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bg_main.png"]];
//    backgroundView.contentMode=UIViewContentModeScaleToFill;
//    backgroundView.frame =CGRectMake(0, 0,SCREEN_WIDTH, SCREEN_HEIGHT);
//    backgroundView.tag = 1000;
//    [self.view insertSubview:backgroundView atIndex:0];
//    [backgroundView release];
}

//自定义导航栏背景
-(void) loadNavigationBar
{
    CGSize allSize = [UIScreen mainScreen ].bounds.size;

    [self.navigationController setNavigationBarHidden:YES];
    _navigationBarView = [NavigationBarView loadFromXib];
    _navigationBarView.width = allSize.width;
    
    if (IS_IOS7) {
        _navigationBarView.height = 64;
    }
    [self.view addSubview:_navigationBarView];
    
    
    [_navigationBarView.leftBarButton addTarget:self action:@selector(leftBarButtonClick:) forControlEvents:UIControlEventTouchUpInside];

    [_navigationBarView.rightBarButton addTarget:self action:@selector(rightBarButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [_navigationBarView.midBarButton addTarget:self action:@selector(midBarButtonClick:) forControlEvents:UIControlEventTouchUpInside];
}

-(void)setNavigationBarTitle:(NSString *)title;
{
    [_navigationBarView setNavigationBarTitle:title];
}

-(void) setNavigationBarSubTitle:(NSString *) title{
    [_navigationBarView setNavigationBarSubTitle:title];
}

-(void) setNavigationBarLeftTitle:(NSString *) title{
    [_navigationBarView setNavigationBarLeftTitle:title];
}


-(NavigationBarView *)navigationBarView
{

    return _navigationBarView;
}


-(void)setRightButtonStyle:(UIButtonStyle)style
{
    UIButton *button = [_navigationBarView rightBarButton];
    [self setUIButtonStyle:style withUIButton:button];
}

-(void)setRightButtonStyle:(UIButtonStyle)style text:(NSString *)text
{
    self.navigationBarView.rightBarButton.hidden = NO;
    UIButton *button = [_navigationBarView rightBarButton];
    [self setUIButtonStyle:style withUIButton:button text:text];
}

-(void)setLeftButtonStyle:(UIButtonStyle)style
{
    UIButton *button = [_navigationBarView leftBarButton];
    [self setUIButtonStyle:style withUIButton:button];
}

-(void)setUIButtonStyle:(UIButtonStyle)style withUIButton:(UIButton *)button
{
    CGSize allSize = [UIScreen mainScreen ].bounds.size;

    if(style == UIButtonStyleBack)
    {

        [button setImage:[UIImage imageNamed:@"btn_back"] forState:UIControlStateNormal];
        
        [button setImage:[UIImage imageNamed:@"btn_back"] forState:UIControlStateHighlighted];
    }else if (style == UIButtonStyleNone){
        button.hidden = YES;
    }else if (style == UIButtonStyleMore){
        [button setImage:[UIImage imageNamed:@"btn_add"] forState:UIControlStateNormal];
        
        [button setImage:[UIImage imageNamed:@"btn_add"] forState:UIControlStateHighlighted];
    }else if (style == UIButtonStyleSave){
        [button setImage:[UIImage imageNamed:@"save_bg"] forState:UIControlStateNormal];
        
        [button setImage:[UIImage imageNamed:@"save_bg"] forState:UIControlStateHighlighted];
    }
    else if (style == UIButtonStyleCancel){
        button.frame = CGRectMake(5, 5, 70, 44);
//        button.contentEdgeInsets = UIEdgeInsetsMake(15, 20, 5, 10);
//        button.titleLabel.textColor = [UIColor whiteColor];
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [button setTitleColor:P_COLOR forState:UIControlStateHighlighted];
        
        [button setTitle:@"取消" forState:UIControlStateNormal];
        [button setTitle:@"取消" forState:UIControlStateHighlighted];
        [button setImage:nil forState:UIControlStateNormal];
        [button setImage:nil forState:UIControlStateHighlighted];
        
        if (IS_IOS7) {
            _navigationBarView.leftBarButton.top = 20;
        }
    }
    else if (style == UIButtonStyleSearch ){
        [button setImage:[UIImage imageNamed:@"btn_search"] forState:UIControlStateNormal];
        
        [button setImage:[UIImage imageNamed:@"btn_search"] forState:UIControlStateHighlighted];
        
        
        if (IS_IOS7) {
            _navigationBarView.rightBarButton.top = 15;
        }
        
    }
    else if (style == UIButtonStyleLogin){
        button.frame = CGRectMake(allSize.width - 70, 5, 70, 44);
        button.contentEdgeInsets = UIEdgeInsetsMake(15, 20, 5, 10);
        button.titleLabel.textColor = [UIColor whiteColor];
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [button setTitleColor:P_COLOR forState:UIControlStateHighlighted];
        
        [button setTitle:@"登录" forState:UIControlStateNormal];
        [button setTitle:@"登录" forState:UIControlStateHighlighted];
        
    }
    else if (style == UIButtonStyleRegiser){
        button.frame = CGRectMake(allSize.width - 70, 5, 70, 44);
        button.contentEdgeInsets = UIEdgeInsetsMake(15, 20, 15, 10);
        button.titleLabel.textColor = [UIColor whiteColor];
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [button setTitleColor:P_COLOR forState:UIControlStateHighlighted];
        
        [button setTitle:@"注册" forState:UIControlStateNormal];
        [button setTitle:@"注册" forState:UIControlStateHighlighted];
        
    }
}

-(void)setUIButtonStyle:(UIButtonStyle)style withUIButton:(UIButton *)button text:(NSString *)text
{
    CGSize allSize = [UIScreen mainScreen ].bounds.size;
    
    if (style == UIButtonStyleText){
        button.frame = CGRectMake(allSize.width - 100, 5, 100, 44);
        button.contentEdgeInsets = UIEdgeInsetsMake(15, 20, 15, 10);
        button.contentHorizontalAlignment=UIControlContentHorizontalAlignmentRight ;
        button.titleLabel.textColor = [UIColor whiteColor];
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [button setTitleColor:P_COLOR forState:UIControlStateHighlighted];
        
        [button setTitle:text forState:UIControlStateNormal];
        [button setTitle:text forState:UIControlStateHighlighted];
        if (IS_IOS7) {
            _navigationBarView.rightBarButton.top = 20;
        }
    }
}

#pragma mark -- NavigationBarButtonClick
- (void)leftBarButtonClick:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)rightBarButtonClick:(id)sender
{
    
}


- (void)midBarButtonClick:(id)sender
{
    
}


#pragma mark -- UITouch

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self endEditing];
}


- (void)endEditing
{
    [[UIApplication sharedApplication].keyWindow endEditing:YES];
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

//控制旋转
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 60000
- (BOOL)shouldAutorotate
{
    return NO;
}

- (NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskPortrait;
}
#endif

@end
