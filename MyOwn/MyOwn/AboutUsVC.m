//
//  AboutUsVC.m
//  MyOwn
//
//  Created by YangYongJie on 16/3/20.
//  Copyright © 2016年 赵安吉. All rights reserved.
//

#import "AboutUsVC.h"
@interface AboutUsVC ()
@property (weak, nonatomic) IBOutlet UIWebView *myWebView;

@end

@implementation AboutUsVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self loadWebView];
    // 下拉刷新
}
-(void)loadWebView{
    NSURL* url = [NSURL URLWithString:@"http://www.sougou.com"];//创建URL
    NSURLRequest* request = [NSURLRequest requestWithURL:url];//创建NSURLRequest
    [_myWebView loadRequest:request];//加载
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
