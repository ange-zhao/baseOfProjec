//
//  SettingVC.m
//  MyOwn
//
//  Created by YangYongJie on 16/3/20.
//  Copyright © 2016年 赵安吉. All rights reserved.
//

#import "SettingVC.h"
#import "AboutUsVC.h"
@interface SettingVC ()

@property (weak, nonatomic) IBOutlet UIButton *logoutBtn;

@end

@implementation SettingVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self setNavigationBarTitle:@"设置"];
    self.tabBarController.tabBar.hidden = YES;
    _logoutBtn.layer.cornerRadius = 3;
    _logoutBtn.layer.borderWidth  = 1.0f;
    _logoutBtn.layer.borderColor  = [UIColor clearColor].CGColor;

}
- (IBAction)suggestionFeedBack:(id)sender {
}
- (IBAction)AboutUs:(id)sender {
    pushToDestinationController(self, AboutUsVC);
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
