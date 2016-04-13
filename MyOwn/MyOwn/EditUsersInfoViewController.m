//
//  EditUsersInfoViewController.m
//  Medicine
//
//  Created by MT on 15/5/16.
//  Copyright (c) 2015年 ange. All rights reserved.
//

#import "EditUsersInfoViewController.h"


@interface EditUsersInfoViewController () <UIPickerViewDataSource,UIPickerViewDelegate,UIScrollViewDelegate>
{
    IBOutlet UIImageView   *_imageView;
    IBOutlet UILabel        *_sexLabel;
    IBOutlet UITextField    *_nameTextField;
    IBOutlet UITextField    *_ageTextField;
    IBOutlet UITextField    *_weightTextField;      // 体重
    IBOutlet UITextField    *_heihtTextField;       // 身高
    IBOutlet UITextView     *_addressTextView;
    IBOutlet UIView         *_infoView;
    
    IBOutlet UIScrollView *_scrollView;
    UIPickerView            *_pickerView;
    NSMutableArray          *_dataArray;
    UIView                  *_firstResponderView;
}


- (IBAction)onSaveInfoBtnClicked:(id)sender;
- (IBAction)onChangePosBtnClicked:(id)sender;
- (IBAction)onKeyboardNext:(id)sender;

@end

@implementation EditUsersInfoViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tabBarController.tabBar.hidden = YES;
    [self setNavigationBarTitle:@"我的资料"];
    _dataArray = [[NSMutableArray alloc] init];
    
    _imageView.layer.cornerRadius = _imageView.width / 2;
    _imageView.layer.borderWidth  = 1.0f;
    _imageView.layer.borderColor  = [UIColor whiteColor].CGColor;
    
    //    _pickerView = [[UIPickerView alloc]init];
    //    _pickerView.frame = CGRectMake(0, 0, self.view.width, self.view.height - 20);
    //    _pickerView.delegate = self;
    //    _pickerView.dataSource = self;
    //    [self.view addSubview:_pickerView];
    
    NSArray *array = [NSArray arrayWithObjects:@"男",@"女", nil];
    
    [_dataArray addObjectsFromArray:array];
    
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillChangeFrame:) name:UIKeyboardWillChangeFrameNotification object:nil];
    
    UITapGestureRecognizer *tapGr = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onChangePosBtnClicked:)];
    tapGr.cancelsTouchesInView = NO;
    [_scrollView addGestureRecognizer:tapGr];
    
    
    _scrollView.width = [UIScreen mainScreen].bounds.size.width;
    _infoView.width = [UIScreen mainScreen].bounds.size.width;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




- (IBAction)onKeyboardNext:(id)sender
{
    [_ageTextField becomeFirstResponder];
}

- (IBAction)onChangePosBtnClicked:(id)sender
{
    [_ageTextField resignFirstResponder];
    [_heihtTextField resignFirstResponder];
    [_weightTextField resignFirstResponder];
    [_addressTextView resignFirstResponder];
    [_nameTextField resignFirstResponder];
    
    [UIView animateWithDuration:0.3 animations:^{
        _infoView.top = 0;
    }];
}


- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self onChangePosBtnClicked:scrollView];
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
//    [UIView animateWithDuration:0.3 animations:^{
//        _infoView.top = 0;
//    }];
    _firstResponderView = textField;
    return YES;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
//    [UIView animateWithDuration:0.3 animations:^{
//        _infoView.top = -170;
//    }];
}

- (void)textViewDidEndEditing:(UITextView *)textView
{
//    [UIView animateWithDuration:0.3 animations:^{
//        _infoView.top = 0;
//    }];
}

- (void)textViewDidBeginEditing:(UITextView *)textView
{
//    [UIView animateWithDuration:0.3 animations:^{
//        _infoView.top = -170;
//    }];
    _firstResponderView = textView;
}

-(BOOL)textViewShouldBeginEditing:(UITextView *)textView

{
    _firstResponderView = textView;
    return YES;
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    if ([text isEqualToString:@"\n"]){ //判断输入的字是否是回车，即按下return
        //在这里做你响应return键的代码
        [textView resignFirstResponder];
        
        return NO; //这里返回NO，就代表return键值失效，即页面上按下return，不会出现换行，如果为yes，则输入页面会换行
    }
    
    return YES;
}

- (IBAction)onSaveInfoBtnClicked:(id)sender
{
    
}
//返回组件数
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

//返回组件的数据条数
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return  [_dataArray count];
}

//返回各个行的数据
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [_dataArray objectAtIndex:row];
}


#pragma ------DataRequestDelegate Method---


- (IBAction)selectHeader:(id)sender {

    [self popAlertController4Header];
}
- (void)popAlertController4Header{
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
- (void)popAlertController4Sex{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
    }];
    
    UIAlertAction *nan = [UIAlertAction actionWithTitle:@"男" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        //[self takePhoto];
        _sexLabel.text = @"男";
    }];
    UIAlertAction *nv = [UIAlertAction actionWithTitle:@"女" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        //[self LocalPhoto];
        _sexLabel.text = @"女";
    }];
    [alertController addAction:cancelAction];
    [alertController addAction:nan];
    [alertController addAction:nv];
    [self presentViewController:alertController animated:YES completion:nil];
    
}

- (IBAction)selectSex:(id)sender {

    [self popAlertController4Sex];
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
    NSString *type = [info objectForKey:UIImagePickerControllerMediaType];
    //当选择的类型是图片
    if (![type isEqualToString:@"public.image"]){
        return;
    }
    
    //先把图片转成NSData
    UIImage* image = [info objectForKey:UIImagePickerControllerEditedImage];
    [picker dismissViewControllerAnimated:YES completion:^{
        //创建一个选择后图片的小图标放在下方
        //类似微薄选择图后的效果
        _imageView.image = image;
        [self uploadHeadImage:image];
    }];
    
    
    
    
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

-(void) uploadHeadImage:(UIImage *) image
{
    
}


-(void)keyboardWillChangeFrame:(NSNotification*)notif{
    
    CGRect keyboardEndFrame = [[[notif userInfo] objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];    
    UIViewAnimationCurve animationCurve = [[[notif userInfo] objectForKey:UIKeyboardAnimationCurveUserInfoKey] integerValue];
    NSTimeInterval animationDuration = [[[notif userInfo] objectForKey:UIKeyboardAnimationDurationUserInfoKey] integerValue];
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:animationDuration];
    [UIView setAnimationCurve:animationCurve];
    
    CGRect keyboardFrameEnd = [self.view convertRect:keyboardEndFrame toView:nil];
    CGRect _firstViewRect = [_firstResponderView convertRect:_firstResponderView.bounds toView:nil];
    
    UIEdgeInsets insets = _scrollView.contentInset;
    insets.top -= (_firstViewRect.origin.y+_firstViewRect.size.height) - keyboardFrameEnd.origin.y + 10;
    
    if (insets.top > 0) {
        insets.top = 0;
    }
    
    _scrollView.contentInset = insets;
    
    _scrollView.height = keyboardFrameEnd.origin.y - 50;
    _scrollView.contentSize = CGSizeMake(_scrollView.contentSize.width,390);
    
    [UIView commitAnimations];

    
    
}
@end
