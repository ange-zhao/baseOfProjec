//
//  YBActivedViewController.m
//  Medicine
//
//  Created by 赵安吉 on 15/10/8.
//  Copyright © 2015年 sx. All rights reserved.
//

#import "YBActivedViewController.h"
#import "PlanNameVC.h"
@interface YBActivedViewController ()
@property (weak, nonatomic) IBOutlet UILabel *planNameLabel;
@end

@implementation YBActivedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
     [self setNavigationBarTitle:@"医宝计划"];
    self.tabBarController.tabBar.hidden = YES;
  

}
- (IBAction)OnMyYBPlanClick:(id)sender {
    PlanNameVC *plan = [[PlanNameVC alloc]initWithNibName:@"PlanNameVC" bundle:nil];
    [self presentViewController:plan animated:YES completion:nil];
    plan.block = ^(NSString *str){
        self.planNameLabel.text = str ;
        
        
    };

    
   
}

- (IBAction)OnAskPayClick:(id)sender {
   
}
- (IBAction)OnPayLogClick:(id)sender {
    // pushToDestinationController(self, YBPayLogViewController);
}
- (IBAction)OnBuyYBClick:(id)sender {
   // pushToDestinationController(self, YBbuyWebViewController);
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
