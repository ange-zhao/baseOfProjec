//
//  ViewController.m
//  MyOwn
//
//  Created by 赵安吉 on 15/10/12.
//  Copyright © 2015年 赵安吉. All rights reserved.
//

#import "ViewController.h"
#import "LogInVC.h"
#import "ppppVC.h"
@interface ViewController ()<UITextFieldDelegate,UIScrollViewDelegate,UISearchBarDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *mySV;
@property (weak, nonatomic) IBOutlet UISearchBar *drugSearchBar;
@property (weak, nonatomic) IBOutlet UICollectionView *homeCollectionView;
PROPERTY NSString *phoneUDID;
PROPERTY NSString *strSysName;
PROPERTY NSString *strModel;
PROPERTY NSString *strLocModel;
PROPERTY NSString *userPhoneName;
PROPERTY NSMutableArray *arr ;
Property CGFloat version;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //获取手机设备相关信息
    [self FirstRequeest];
    [_mySV setContentSize:CGSizeMake(self.view.frame.size.width,self.view.frame.size.height+1)];
    _mySV.showsVerticalScrollIndicator = NO;
    _arr = [NSMutableArray arrayWithObjects:@"郭靖",@"虚竹",@"李小龙",@"洪七公",@"神僧",@"段誉",@"乔峰",@"青青",@"欧阳锋",@"老顽童",@"正心",@"修身",@"风",@"治国",@"无名",@"天下",@"黄药师",@"童心",@"囜火",@"雄霸", nil];
    [self Up4RefreshDown4More];
    [self initTapGr];

}
//定义轻拍手势结束编辑
-(void)initTapGr{
    UITapGestureRecognizer *tapGr = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(endEdit)];
    tapGr.cancelsTouchesInView = NO;
    [self.view addGestureRecognizer:tapGr];
}
-(void)endEdit{
    [[UIApplication sharedApplication].keyWindow endEditing:YES];

}
-(void)viewWillAppear:(BOOL)animated{
    self.tabBarController.tabBar.hidden = NO;
    
}
-(void)getUserPhoneInfo{
    self.userPhoneName = [NowDevice name];//手机的用户名字
    _phoneUDID = [NowDevice uniqueGlobalDeviceIdentifier]; // UDID
    _strSysName = [NowDevice systemName]; // "iPhone OS"
    _version = SysVer;// "9.1"
    _strModel = [NowDevice model]; // "iPhone" on both devices
    _strLocModel = [NowDevice localizedModel]; // "iPhone" on both devices
}
-(void)Up4RefreshDown4More{
    // 下拉刷新
    self.homeCollectionView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        // 进入刷新状态后会自动调用这个block
    }];
    
    // 上拉刷新
    self.homeCollectionView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        // 进入刷新状态后会自动调用这个block
    }];



}
-(void)FirstRequeest{
  

    // 构造参数
    NSString *appVersion = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"];
    NSString *deviceToken = [USER_DEFAULT objectForKey:TOKEN_ID];
    NSDictionary *headDic = [NSDictionary dictionaryWithObjectsAndKeys:@"1",@"channel",
                             appVersion ,@"version",
                             deviceToken ? deviceToken : @"a86af741-f4b8-4445-8b0d-1f870bb384fc",@"token_id",
                             @"516",@"command",
                             nil];
    NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithObjectsAndKeys:headDic,@"head",nil];
    //创建网络请求对象及相关请求设置
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    NSMutableSet *types = [NSMutableSet setWithSet:manager.responseSerializer.acceptableContentTypes];
    [types addObject:@"text/html"];
    manager.responseSerializer.acceptableContentTypes = types;
    [manager POST:kBaseUrl parameters:dic success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        NSLog(@"%@",responseObject);
    } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
        //something about request failure
        
        
    }];
}

- (IBAction)go2Login:(id)sender {
    [self didAlertController];
}
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    
    [_drugSearchBar resignFirstResponder];
}
-(void)searchBarCancelButtonClicked:(UISearchBar *)searchBar{
    
    [_drugSearchBar resignFirstResponder];

}
-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    [_drugSearchBar resignFirstResponder];
    pushToDestinationController(self, ppppVC);
}
- (void)didAlertController{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"温馨提示" message:@"您尚未登录请先登录" preferredStyle:UIAlertControllerStyleAlert];
    
        //**************** 类型 *************
        //UIAlertControllerStyleActionSheet
        //UIAlertControllerStyleAlert

//     [alertController addTextFieldWithConfigurationHandler:^(UITextField *textField){
//     textField.placeholder = @"登录";}
//     ];
//    
//     [alertController addTextFieldWithConfigurationHandler:^(UITextField *textField)
//     {
//     textField.placeholder = @"密码";
//     textField.secureTextEntry = YES;
//     }];
    
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
    }];
    
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        pushToDestinationController(self, LogInVC);
    }];
    [alertController addAction:cancelAction];
    [alertController addAction:okAction];
    
    [self presentViewController:alertController animated:YES completion:nil];
    
}
/**
 *
 *
 *     CollectionView  的代理方法
 *
 *
 */
//定义展示的Section的个数
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

//定义展示的UICollectionViewCell的个数
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 20;
}
//每个UICollectionView展示的内容
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    HomeCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    
    
    cell.imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"huoying%ld.jpg",indexPath.row]];
    [cell setCellDataWithModel];
    cell.nameLabel.text = _arr[indexPath.row];
    
    return cell;
}

- (float)imgHeight:(float)height width:(float)width{
    /*
     高度/宽度 = 压缩后高度/压缩后宽度（100）
     */
    float newHeight = height / width * 100;
    return newHeight;
}
#pragma mark - UICollectionView delegate flowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    return CGSizeMake(90, 90);
    
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    UIEdgeInsets edgeInsets = {5,9,5,9};
    return edgeInsets;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
