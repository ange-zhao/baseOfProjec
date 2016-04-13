//
//  PlanNameVC.m
//  MyOwn
//
//  Created by 赵安吉 on 16/1/5.
//  Copyright © 2016年 赵安吉. All rights reserved.
//

#import "PlanNameVC.h"
#import "YBActivedViewController.h"
@interface PlanNameVC ()
PROPERTY UIButton *button;

@end

@implementation PlanNameVC
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self setNavigationBarTitle:@"选择医宝类型"];
    [self setLeftButtonStyle:UIBarButtonItemStyleDone];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)popBack:(id)sender {

    _button = (UIButton *)sender;
    self.block(_button.titleLabel.text);
    
    [self dismissViewControllerAnimated:YES completion:nil];
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
