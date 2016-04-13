//
//  LogInVC.m
//  MyOwn
//
//  Created by 赵安吉 on 15/12/25.
//  Copyright © 2015年 赵安吉. All rights reserved.
//

#import "LogInVC.h"
#import "AFNetworking/AFNetworking.h"
#import "RegistVC.h"
#import "ModifyPasswordViewController.h"
@interface LogInVC ()<UIAlertViewDelegate>
@property (weak, nonatomic) IBOutlet UITextField *accountTF;
@property (weak, nonatomic) IBOutlet UITextField *passwordTF;

@end

@implementation LogInVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.tabBarController.tabBar.hidden = YES;
    [self setNavigationBarTitle:@"登录"];
       
    
    
}
- (void)LoginRequest
{
//    NSMutableDictionary *bodyDic = [NSMutableDictionary dictionaryWithObjectsAndKeys:
//                                         _accountTF.text,@"mobile",
//                                         [_passwordTF.text md5],@"password",
//                                         nil];
//    NSString *token = [USER_DEFAULT objectForKey:DEVICE_TOKEN];
//    if (token) {
//        [bodyDic setObject:token forKey:@"ch_id"];
//    }
//    
//    
//    NSString *appVersion = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"];
//    
//    NSDictionary *headDic = [NSDictionary dictionaryWithObjectsAndKeys:@"1",
//                             @"channel",
//                             appVersion,
//                             @"version",
//                             @"104",
//                             @"command",
//                             @"",
//                             @"token_id",
//                             nil];
//    
//    NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithObjectsAndKeys:headDic,@"head",bodyDic,@"body",nil];
//
//    //创建网络请求对象及相关请求设置
//    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
//    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
//    NSMutableSet *types = [NSMutableSet setWithSet:manager.responseSerializer.acceptableContentTypes];
//    [types addObject:@"text/html"];
//    manager.responseSerializer.acceptableContentTypes = types;
//    [manager POST:kBaseUrl parameters:dic success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
//        NSLog(@"%@",responseObject);
//    } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
//        
////        [UIAlertView popupAlertByDelegate:self
////                                  message:@"请求失败"];
//        NSLog(@"fhglksjdghdsjkhg");
//    }];
//
   
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)logInClick:(id)sender {
    

}
- (IBAction)phoneNumResignClick:(id)sender {
    pushToDestinationController(self, RegistVC);
}
- (IBAction)findPasswordClick:(id)sender {

    ModifyPasswordViewController *m = [[ModifyPasswordViewController alloc]initWithNibName:@"ModifyPasswordViewController" bundle:nil];
    m.cType = REGISTER;
    [self.navigationController pushViewController:m animated:YES];
    
}
- (IBAction)button2Resign:(id)sender {
    [_accountTF resignFirstResponder];
    [_passwordTF resignFirstResponder];
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
