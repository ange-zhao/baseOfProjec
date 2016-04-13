//
//  ppppVC.m
//  MyOwn
//
//  Created by 赵安吉 on 16/1/5.
//  Copyright © 2016年 赵安吉. All rights reserved.
//

#import "ppppVC.h"
#import "MeVC.h"
@interface ppppVC ()<UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UILabel *myL;
@property (weak, nonatomic) IBOutlet UIButton *myBtn;
@property (weak, nonatomic) IBOutlet UIButton *backBtn;
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation ppppVC

- (void)viewDidLoad {
    
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
        self.tabBarController.tabBar.hidden = YES;
    [self initMyBtn];
    [self setNavigationBarTitle:@"江湖追杀令"];

    
}
-(void)viewWillAppear:(BOOL)animated{

    [self loadWebView];

}
-(IBAction)changeBgColor:(UIButton *)sender{
    
   
    
}

- (void)initMyBtn{
    _myBtn.layer.masksToBounds = YES;
    _myBtn.layer.cornerRadius = _myBtn.bounds.size.width/5;
    _myBtn.layer.borderWidth = 2;
    _myBtn.layer.borderColor = [UIColor clearColor].CGColor;
    _backBtn.layer.masksToBounds = YES;
    _backBtn.layer.cornerRadius  = _backBtn.bounds.size.width/5;
    _backBtn.layer.borderWidth   = 2;
    _backBtn.layer.borderColor   = [UIColor clearColor].CGColor;
}
-(void)loadWebView{
    NSURL* url = [NSURL URLWithString:@"http://www.sougou.com"];//创建URL
    NSURLRequest* request = [NSURLRequest requestWithURL:url];//创建NSURLRequest
    [_webView loadRequest:request];//加载
}
- (IBAction)push:(id)sender {
    ExampleVC *pp =[[ExampleVC alloc]initWithNibName:@"ExampleVC" bundle:nil];
    [self presentViewController:pp animated:YES completion:nil];
    pp.block = ^(NSString *s){
        self.myL.text = s ;
                             };
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
