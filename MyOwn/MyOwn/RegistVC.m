//
//  RegistVC.m
//  MyOwn
//
//  Created by YangYongJie on 16/3/17.
//  Copyright © 2016年 赵安吉. All rights reserved.
//

#import "RegistVC.h"
#define WAIT_TIME 30
@interface RegistVC ()<UIScrollViewDelegate,UITextFieldDelegate,UIAlertViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *mySV;
@property (weak, nonatomic) IBOutlet UITextField *phoneNumTF;
@property (weak, nonatomic) IBOutlet UITextField *authCodeTF;
@property (weak, nonatomic) IBOutlet UITextField *passwordTF;
@property (weak, nonatomic) IBOutlet UITextField *repasswordTF;
@property (weak, nonatomic) IBOutlet UITextField *inviteTF;
@property (weak, nonatomic) IBOutlet UIButton *getAuthBtn;
PROPERTY UIView *firstResponderView;
@property(nonatomic)int time;

@end

@implementation RegistVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self setNavigationBarTitle:@"注册"];
    _time = WAIT_TIME;
    [self.mySV setContentSize:CGSizeMake(self.view.frame.size.width, self.view.frame.size.height+1)];
    [self somethingAboutScrollViewAndKeyBoardChange];
}
-(void)somethingAboutScrollViewAndKeyBoardChange{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillChangeFrame:) name:UIKeyboardWillChangeFrameNotification object:nil];
    
    UITapGestureRecognizer *tapGr = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onChangePosBtnClicked)];
    tapGr.cancelsTouchesInView = NO;
    [_mySV addGestureRecognizer:tapGr];
}
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self onChangePosBtnClicked];
}

- (void)onChangePosBtnClicked
{
    [_inviteTF resignFirstResponder];
    [_passwordTF resignFirstResponder];
    [_repasswordTF resignFirstResponder];
    [_phoneNumTF resignFirstResponder];
    [_authCodeTF resignFirstResponder];
}

- (IBAction)getAuthCodeClick:(id)sender {
    
    [self onChangePosBtnClicked];
    
    if (![CheckUtil isValid:_phoneNumTF.text]) {
        
        [UIAlertView popupAlertByDelegate:self
                                  message:@"手机号码不能为空"];
        return;
    }
    if (![CheckIsRight checkTelNumber:_phoneNumTF.text]) {
       
        [UIAlertView popupAlertByDelegate:self
                                  message:@"请输入有效的手机号码"];
        return;
    }
    
    _getAuthBtn.enabled = NO;
    [_getAuthBtn setTitle:[NSString stringWithFormat:@"获取验证码(%d秒)" ,WAIT_TIME] forState:UIControlStateNormal];
    [self performSelector:@selector(setAuthBtnTitle) withObject:nil afterDelay:1];
}






- (IBAction)finishClick:(id)sender {
    [self onChangePosBtnClicked];
    if (![CheckUtil isValid:_phoneNumTF.text]) {
        
    }
    if (![CheckUtil isValid:_passwordTF.text]) {
        
    }
    if (![CheckUtil isValid:_repasswordTF.text]) {
        
    }
    if (![CheckUtil isValid:_authCodeTF.text]) {
        
    }
}


- (void)setAuthBtnTitle
{
    _time--;
    [_getAuthBtn setTitle:[NSString stringWithFormat:@"获取验证码(%i秒)",_time] forState:UIControlStateNormal];
    if ( _time >= 0 ) {
        [self performSelector:@selector(setAuthBtnTitle) withObject:self afterDelay:1];
    } else {
        [[self class] cancelPreviousPerformRequestsWithTarget:self];
        [_getAuthBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
        _time = WAIT_TIME;
        _getAuthBtn.enabled = YES;
    }
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    _firstResponderView = textField;
    return YES;
}

-(BOOL)textViewShouldBeginEditing:(UITextView *)textView

{
    _firstResponderView = textView;
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

-(void)keyboardWillChangeFrame:(NSNotification*)notif{
    
    CGRect keyboardEndFrame = [[[notif userInfo] objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
    UIViewAnimationCurve animationCurve = [[[notif userInfo] objectForKey:UIKeyboardAnimationCurveUserInfoKey] integerValue];
    NSTimeInterval animationDuration = [[[notif userInfo] objectForKey:UIKeyboardAnimationDurationUserInfoKey] integerValue];
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:animationDuration];
    [UIView setAnimationCurve:animationCurve];
    
    CGRect keyboardFrameEnd = [self.view convertRect:keyboardEndFrame toView:nil];
    CGRect _firstViewRect = [_firstResponderView convertRect:_firstResponderView.bounds toView:nil];
    
    
    
    UIEdgeInsets insets = _mySV.contentInset;
    insets.top -= (_firstViewRect.origin.y+_firstViewRect.size.height) - keyboardFrameEnd.origin.y + 10;
    
    if (insets.top > 0) {
        insets.top = 0;
    }
    
    _mySV.contentInset = insets;
    //    [_scrollView setContentOffset:CGPointMake(0, -(_firstViewRect.origin.y+_firstViewRect.size.height)) animated:YES];
    _mySV.height = keyboardFrameEnd.origin.y;
    _mySV.contentSize = CGSizeMake(_mySV.contentSize.width,390);
    
    [UIView commitAnimations];
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
