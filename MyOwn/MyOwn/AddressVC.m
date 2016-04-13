//
//  AddressVC.m
//  MyOwn
//
//  Created by YangYongJie on 16/3/23.
//  Copyright © 2016年 赵安吉. All rights reserved.
//

#import "AddressVC.h"
#import "AddressChoicePickerView.h"
@interface AddressVC ()
@property (weak, nonatomic) IBOutlet UILabel *addressLabel;

@end

@implementation AddressVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavigationBarTitle:@"地址管理"];
    self.tabBarController.tabBar.hidden = YES;


    // Do any additional setup after loading the view from its nib.
}
- (IBAction)provinceCity:(id)sender {
        AddressChoicePickerView *addressPickerView = [[AddressChoicePickerView alloc]init];
        addressPickerView.block = ^(AddressChoicePickerView *view,UIButton *btn,AreaObject *locate){
        self.addressLabel.text = [NSString stringWithFormat:@"%@",locate];
       // self.addressLabel.textColor = [UIColor blackColor];
        };
        [addressPickerView show];
}
- (IBAction)specificAdd:(id)sender {
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
