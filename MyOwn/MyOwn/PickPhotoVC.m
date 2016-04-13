//
//  PickPhotoVC.m
//  MyOwn
//
//  Created by YangYongJie on 16/3/25.
//  Copyright © 2016年 赵安吉. All rights reserved.
//

#import "PickPhotoVC.h"
#import "DrugsItemView.h"
#define LEFT_POINT      10
@interface PickPhotoVC ()<UIImagePickerControllerDelegate,UINavigationControllerDelegate>
Property     NSInteger            width;     // 照片的宽度
PROPERTY     NSMutableArray      *imageArray;
@property (weak, nonatomic) IBOutlet UIView *camView;

@end

@implementation PickPhotoVC
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if ( self ) {

        _imageArray = [[NSMutableArray alloc] init];
        
        _width = (SCREEN_WIDTH - 50) / 4;

    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
        [self AddMoreView];
    [self setNavigationBarTitle:@"选照片"];
    self.tabBarController.tabBar.hidden = YES;


}

- (void)onCamaraBtnClicked{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
    }];
    
    UIAlertAction *takePhoto = [UIAlertAction actionWithTitle:@"拍照" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self takePhoto];
    }];
    UIAlertAction *LocalPhoto = [UIAlertAction actionWithTitle:@"从手机相册选择" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self LocalPhoto];
    }];
    [alertController addAction:cancelAction];
    [alertController addAction:takePhoto];
    [alertController addAction:LocalPhoto];
    [self presentViewController:alertController animated:YES completion:nil];
    
}
//开始拍照
-(void)takePhoto
{
    UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypeCamera;
    if ([UIImagePickerController isSourceTypeAvailable: UIImagePickerControllerSourceTypeCamera])
    {
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        picker.delegate = self;
        //设置拍照后的图片可被编辑
        picker.allowsEditing = YES;
        picker.sourceType = sourceType;
        picker.videoQuality = UIImagePickerControllerQualityTypeLow;
        [self presentViewController:picker animated:YES completion:^{
        }];
    }else
    {
        NSLog(@"模拟其中无法打开照相机,请在真机中使用");
    }
}



//打开本地相册
-(void)LocalPhoto
{
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    picker.delegate = self;
    //设置选择后的图片可被编辑
    picker.allowsEditing = YES;
    [self presentViewController:picker animated:YES completion:^{
    }];
    
}
//当选择一张图片后进入这里
-(void)imagePickerController:(UIImagePickerController*)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    [picker dismissViewControllerAnimated:YES completion:nil];

    UIImage* image = nil;
    if (picker.sourceType == UIImagePickerControllerSourceTypeCamera)
    {
        //UIImage* cameraImage = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
        image = [info objectForKey:@"UIImagePickerControllerEditedImage"];
        
        
        UIImageWriteToSavedPhotosAlbum(image, self,
                                       @selector(image:didFinishSavingWithError:contextInfo:),
                                       nil);
        
    }else if (picker.sourceType == UIImagePickerControllerSourceTypePhotoLibrary) {
        

        image = [info objectForKey: @"UIImagePickerControllerEditedImage"];
    }
    
    [_imageArray addObject:image];
    
    [_camView removeAllSubviews];
    [self addDrugsView:_imageArray];
    [self AddMoreView];

    
    
    
}
- (void)addDrugsView:(NSArray *)array
{  // 52
    for ( int i = 0 ; i < [array count]; i++ ) {
        NSInteger startX = 0;
        NSInteger startY = 0;
        if ( i >= 4 ) {
            startX = (i == 4) ? (LEFT_POINT + i % 4 * _width) : (LEFT_POINT + LEFT_POINT * (i % 4) + (i % 4) * _width);
            startY = 16 + _width;
        } else {
            startX = (i == 0) ? (LEFT_POINT + i * _width) : (LEFT_POINT * (i + 1) + i * _width);
            startY = 8;
        }
        DrugsItemView *view = [[DrugsItemView alloc] initWithFrame:CGRectMake(startX, startY, _width, _width)];
        UIImageView *img = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, _width, _width)];
        
        img.image = ImageNamed(@"background_googds.png");
        [view addSubview:img];
        
        UIImageView *drugsImage = [[UIImageView alloc] initWithFrame:CGRectMake(1, 1, _width - 2, _width - 2)];
        drugsImage.image = [array objectAtIndex:i];
        [view addSubview:drugsImage];
        
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(view.width - 12, - 7, 20, 20);
        btn.tag = i;
        [ btn setBackgroundImage:ImageNamed(@"btn_Picture_Close.png") forState:UIControlStateNormal ];
        [btn setImageEdgeInsets:UIEdgeInsetsMake(7, 7, 7, 7)];
        [btn addTarget:self action:@selector(deleteDrugsItemView:) forControlEvents:UIControlEventTouchDown];
        [view addSubview:btn];
        
        [_camView addSubview:view];
        
        
    }
}

- (void)deleteDrugsItemView:(UIButton *)botton
{
    [_imageArray removeObjectAtIndex:botton.tag];
    [_camView removeAllSubviews];
    [self addDrugsView:_imageArray];
    [self AddMoreView];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    NSLog(@"您取消了选择图片");
    [picker dismissViewControllerAnimated:YES completion:^{
        
    }];
}

//-(void)sendInfo
//{
//    NSLog(@"图片的路径是：%@", filePath);
//    NSLog(@"您输入框中的内容是：%@", _textEditor.text);
//}

-(void)AddMoreView
{
    
    NSInteger count = [_imageArray count];
    
    if (  count > 7 ) {
        return;
    }
    
    
    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    if ( count <= 3 ) {
        NSInteger x = count == 0 ? (10 + count * _width) : (10 + 10 * count + count * _width);
        rightBtn.frame = CGRectMake(x, 8, _width, _width);
    } else {
        NSInteger x = count == 4 ? (10 + count % 4 * _width) : (10 + 10 * (count % 4) + (count % 4) * _width);
        
        rightBtn.frame = CGRectMake(x, 16 + _width, _width, _width);
    }
    
    
    [rightBtn setBackgroundImage:ImageNamed(@"btn_Add_Picture") forState:UIControlStateNormal ];

    [rightBtn addTarget:self action:@selector(onCamaraBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    
    [_camView addSubview:rightBtn];
    
    UILabel *_orderStatusLabel = [[UILabel alloc] initWithFrame:CGRectMake(9, rightBtn.bottom + 8, SCREEN_WIDTH - 18, 21)];
    
    _orderStatusLabel.textColor = [UIColor grayColor];
    _orderStatusLabel.text = [NSString stringWithFormat:@"最多可拍8张，已拍%zd张，还可拍%zd张",count,8 - count];
    _orderStatusLabel.font = [UIFont systemFontOfSize:14];
    
    [_camView addSubview:_orderStatusLabel];

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
