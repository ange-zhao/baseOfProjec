//
//  GuideVC.m
//  MyOwn
//
//  Created by YangYongJie on 16/4/10.
//  Copyright © 2016年 赵安吉. All rights reserved.
//

#import "GuideVC.h"

@interface GuideVC ()<UIScrollViewDelegate>

@end

@implementation GuideVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self getGuideView];

}
-(void)getGuideView
{
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:UISCREEN];
    scrollView.contentSize = CGSizeMake(SCREEN_WIDTH*3, SCREEN_HEIGHT-64);
    for (int i = 0; i < 3; i++)
    {
        UIImageView *guideIV = [[UIImageView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH*(i), 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
        NSString *strImgName = [NSString stringWithFormat:@"huoying%d.jpg",i];
        guideIV.image = [UIImage imageNamed:strImgName];
        [scrollView addSubview:guideIV];
        scrollView.pagingEnabled = YES;
        scrollView.delegate = self;
    }
    [self.view addSubview:scrollView];
    
    UIPageControl *page = [[UIPageControl alloc] initWithFrame:CGRectMake(self.view.bounds.origin.x, SCREEN_HEIGHT-50, SCREEN_WIDTH, 40)];
    page.numberOfPages = 3;
    page.currentPageIndicatorTintColor = [UIColor purpleColor];
    page.tag = 1001;
    [self.view addSubview:page];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(SCREEN_WIDTH*2.5-50, SCREEN_HEIGHT-140, 100, 44);
    button.layer.cornerRadius = button.width/6;
    [button setTitle:@"走你" forState:UIControlStateNormal];
    button.backgroundColor = [UIColor purpleColor];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(skipGuide) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview:button];
}
-(void)skipGuide
{
    UIViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"tab"];
    
   [self.navigationController pushViewController:vc animated:YES];
    
    
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    UIPageControl *paged = (UIPageControl *) [self.view viewWithTag:1001];
    paged.currentPage = scrollView.contentOffset.x / 320;
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
