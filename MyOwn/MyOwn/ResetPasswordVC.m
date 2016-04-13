//
//  ResetPasswordVC.m
//  MyOwn
//
//  Created by YangYongJie on 16/3/16.
//  Copyright © 2016年 赵安吉. All rights reserved.
//

#import "ResetPasswordVC.h"

@interface ResetPasswordVC ()
@property (weak, nonatomic) IBOutlet UITextField *passwordTF;
@property (weak, nonatomic) IBOutlet UITextField *againTF;
@property (weak, nonatomic) IBOutlet UIButton *finishBtn;

@end

@implementation ResetPasswordVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self setNavigationBarTitle:@"重置密码"];
    
    _finishBtn.layer.cornerRadius = 3;
    _finishBtn.layer.borderWidth  = 1.0f;
    _finishBtn.layer.borderColor  = [UIColor clearColor].CGColor;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)FinishClick:(id)sender {
    [_passwordTF resignFirstResponder];
    [_againTF resignFirstResponder];
    
//    if (![CheckUtil isValid:_passwordTF.text])  {
//        [UIAlertView popupAlertByDelegate:self title:@"notice" message:@"empty password"];
//        
//        return;
//    }
//    if (![CheckUtil isValid:_againTF.text]) {
//        [UIAlertView popupAlertByDelegate:self title:@"notice" message:@"empty password"];
//        return;
//    }
    if (![CheckIsRight checkPassword:_passwordTF.text]) {
        [UIAlertView popupAlertByDelegate:self title:@"温馨提示" message:@"请输入6-20位的密码"];
        return;
    }
    if (![_againTF.text isEqualToString:_passwordTF.text]) {
        [UIAlertView popupAlertByDelegate:self title:@"温馨提示" message:@"两次输入的密码不一致"];
        return;
    }

    
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
