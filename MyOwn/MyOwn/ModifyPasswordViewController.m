//
//  ModifyPasswordViewController.m
//  TelecomTravel
//
//  Created by MT on 14-5-11.
//
//

#import "ModifyPasswordViewController.h"

@interface ModifyPasswordViewController ()
Property NSInteger time;
@end

@implementation ModifyPasswordViewController


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        _time = 60;
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tabBarController.tabBar.hidden = YES;
    self.navigationBarView.rightBarButton.hidden = NO;
    [self setRightButtonStyle:UIButtonStyleSave];
    
    self.saveBtn.hidden = YES;
    if (_cType == CHANGE_PASSWORD) {
        [self setNavigationBarTitle:@"修改密码"];
        
    }else if (_cType == REGISTER){
        [self setNavigationBarTitle:@"找回密码"];
    }
}
- (IBAction)getAuthCodeClick:(id)sender {
    [_phoneTF resignFirstResponder];
    [_verificationTF resignFirstResponder];
    if (![CheckUtil isValid:_phoneTF.text]) {
        [self alertShowMessage:@"手机号码不能为空"];
        
        return;
    }
    if (![CheckIsRight checkTelNumber:_phoneTF.text]) {
       [self alertShowMessage:@"请输入有效的手机号码"];
        return;
    }
    _sendBtn.enabled = NO;
    [_sendBtn setTitle:@"重新获取(60)" forState:UIControlStateNormal];
    [self performSelector:@selector(setButtonTitle) withObject:nil afterDelay:1];
}

-(void)alertShowMessage:(NSString *)message{
//    UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"温馨提示" message:message delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
//    [alertView show];
     UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"温馨提示" message:message preferredStyle:UIAlertControllerStyleAlert];
   // UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
    //}];
    
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    //[alertController addAction:cancelAction];
    [alertController addAction:okAction];
    
    [self presentViewController:alertController animated:YES completion:nil];

}

- (IBAction)nextStepClick:(id)sender {
    [_phoneTF resignFirstResponder];
    [_verificationTF resignFirstResponder];
    
    if (![CheckUtil isValid:_phoneTF.text]) {
        [self alertShowMessage:@"手机号码不能为空"];
        
        return;
    }
    if (![CheckUtil isValid:_verificationTF.text]) {
        [self alertShowMessage:@"验证码不能为空"];
        
        return;
    }
    if (![CheckIsRight checkTelNumber:_phoneTF.text]) {
        [self alertShowMessage:@"请输入有效的手机号码"];
        return;
    }
    if (![CheckIsRight checkAuthCode:_verificationTF.text]) {
        [self alertShowMessage:@"请输入有效的验证码"];
        return;
    }

    
    
    
}

- (void)setButtonTitle
{
    _time--;
    [_sendBtn setTitle:[NSString stringWithFormat:@"重新获取(%li)",(long)_time] forState:UIControlStateNormal];
    if ( _time >= 0 ) {
        [self performSelector:@selector(setButtonTitle) withObject:nil afterDelay:1];
    } else {
        [[self class] cancelPreviousPerformRequestsWithTarget:self];
        [_sendBtn setTitle:@"发送验证码" forState:UIControlStateNormal];
        _time = 60;
        _sendBtn.enabled = YES;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -- NavigationBarButtonClick
- (void)rightBarButtonClick:(id)sender
{
    
}

- (void)leftBarButtonClick:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}



-(void)exitViewControll
{
    [self.navigationController popViewControllerAnimated:YES];
}


@end
