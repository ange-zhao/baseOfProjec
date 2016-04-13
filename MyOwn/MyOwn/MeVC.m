//
//  MeVC.m
//  MyOwn
//
//  Created by 赵安吉 on 15/12/25.
//  Copyright © 2015年 赵安吉. All rights reserved.
//

#import "MeVC.h"
#import "EditUsersInfoViewController.h"
#import "ModifyPasswordViewController.h"
#import "YBActivedViewController.h"
#import "ppppVC.h"
#import "SettingVC.h"
#import "AddressVC.h"
#import "PickPhotoVC.h"
@interface MeVC ()
@property (weak, nonatomic) IBOutlet UILabel *addL;
@property (weak, nonatomic) IBOutlet UIScrollView *meSV;
@property (weak, nonatomic) IBOutlet UIImageView *iconIV;

@end

@implementation MeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initUserIcon];
    [_meSV setContentSize:CGSizeMake(self.view.size.width, 540)];
    
}
-(void)viewWillAppear:(BOOL)animated{
    self.tabBarController.tabBar.hidden = NO;
}
- (void)initUserIcon{
    self.iconIV.layer.cornerRadius = self.iconIV.frame.size.height/2;
    self.iconIV.layer.masksToBounds = YES;
    self.iconIV.layer.borderWidth = 1.f;
}
- (IBAction)myInfoClick:(id)sender {
    pushToDestinationController(self, EditUsersInfoViewController);
}
- (IBAction)EditPassordClick:(id)sender {
    pushToDestinationController(self, ModifyPasswordViewController);
}
- (IBAction)AdressManageClick:(id)sender {
    pushToDestinationController(self, AddressVC);
}
- (IBAction)MyOrderClick:(id)sender {
    pushToDestinationController(self,PickPhotoVC);
}
- (IBAction)JuanClick:(id)sender {
}
- (IBAction)YbPlanClick:(id)sender {
    pushToDestinationController(self, YBActivedViewController);
}
- (IBAction)MoreClick:(id)sender {
    pushToDestinationController(self, SettingVC);
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
