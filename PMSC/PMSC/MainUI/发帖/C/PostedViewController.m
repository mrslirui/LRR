//
//  PostedViewController.m
//  PMSC
//
//  Created by 杨晓龙 on 16/8/27.
//  Copyright © 2016年 李锐. All rights reserved.
//

#import "PostedViewController.h"
#import "PostedView.h"
#import "PostedViewModel.h"
#import <MobileCoreServices/MobileCoreServices.h>
@interface PostedViewController ()<UIImagePickerControllerDelegate,UINavigationControllerDelegate>
@property (nonatomic, strong) PostedView *postedView;
@property (nonatomic, strong) NSString *base64String;
@end

@implementation PostedViewController
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden = YES;
}
- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    self.tabBarController.tabBar.hidden = NO;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"发帖";
    self.view.backgroundColor = kHexColor(0xeeeeee);
    self.postedView = [[PostedView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 588 * kScreenWidth)];
    self.postedView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.postedView];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
    [self.postedView.imgView addGestureRecognizer:tap];
    
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button1.frame = CGRectMake(20 * kScreenWidth, CGRectGetMaxY(self.postedView.frame) + 75 * kScreenWidth, 680 * kScreenWidth, 72 * kScreenWidth);
    [button1 setTitle:@"发布" forState:UIControlStateNormal];
    [button1 setBackgroundColor:kHexColor(0xff6347)];
    [button1 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button1 addTarget:self action:@selector(button1Action:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button1];
    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button2.frame = CGRectMake(CGRectGetMinX(button1.frame), CGRectGetMaxY(button1.frame) + 20 * kScreenWidth, 680 * kScreenWidth, 72 * kScreenWidth);
    button2.layer.borderColor = [UIColor colorWithRed:0.6078 green:0.6078 blue:0.6078 alpha:1.0].CGColor;
    [button2 setTitleColor:[UIColor colorWithRed:0.6078 green:0.6078 blue:0.6078 alpha:1.0] forState:UIControlStateNormal];
    button2.layer.borderWidth = 0.5;
    [button2 setTitle:@"取消" forState:UIControlStateNormal];
    [button2 setBackgroundColor:kHexColor(0xeeeeee)];
    [button2 addTarget:self action:@selector(button2Action:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button2];
}
#pragma mark 发布
- (void)button1Action:(UIButton *)sender
{
    [PostedViewModel postWithToken:TOKEN title:self.postedView.titleField.text content:self.postedView.textView.text img:self.base64String block:^(id Value) {
        [self.navigationController popViewControllerAnimated:YES];
    }];
}
#pragma mark 取消
- (void)button2Action:(UIButton *)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}
#pragma mark 选择图片
- (void)tapAction:(UITapGestureRecognizer *)sender
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"选择图片" message:@"" preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *ok = [UIAlertAction actionWithTitle:@"相册" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self localPhotoButtonClicked];
    }];
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    [alert addAction:ok];
    [alert addAction:cancel];
    [self presentViewController:alert animated:YES completion:nil];
}
-(void)localPhotoButtonClicked
{
    BOOL isavailable = [UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary];
    if (isavailable)
    {
        UIImagePickerController * imagepickerphoto = [[UIImagePickerController alloc]init];
        imagepickerphoto.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
        //        imagepickerphoto.allowsEditing = YES;
        imagepickerphoto.mediaTypes = [[NSArray alloc] initWithObjects:(NSString*)kUTTypeImage, nil];
        //允许用户进行编辑
        imagepickerphoto.allowsEditing = YES;
        imagepickerphoto.delegate = self;
        [self presentViewController:imagepickerphoto animated:YES completion:nil];
    }
    else
    {
//        [AlertAndActionTool showAlertWith:@"提示" AndContent:@"手机相机不可用" AndViewController:self AndCallBack:^{
//            
//        }];
    }
}
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    
//    UIImage *selectImage = [self fixOrientation:[info valueForKey:UIImagePickerControllerEditedImage]];
    UIImage *selectImage = [info valueForKey:UIImagePickerControllerEditedImage];
//    selectImage = [XLMethod compressOriginalImage:selectImage toSize:CGSizeMake(1024 * kScreenWidth, 1024 * kScreenWidth)];
//    NSLog(@"%.2f",selectImage.size.width);
//    NSLog(@"%.2f",selectImage.size.height);
//    __block NSString *imageFileName;
//    NSURL *imageURL = [info valueForKey:UIImagePickerControllerReferenceURL];
//    ALAssetsLibraryAssetForURLResultBlock resultblock = ^(ALAsset *myAlAsset) {
//        ALAssetRepresentation *representation = [myAlAsset defaultRepresentation];
//        imageFileName = [representation filename];
//        NSLog(@"%@",imageFileName);
//        self.imageNameFile = imageFileName;
//        
//    };
//    ALAssetsLibrary *assetslibrary = [[ALAssetsLibrary alloc] init];
//    [assetslibrary assetForURL:imageURL resultBlock:resultblock failureBlock:nil];
    
    
    
    _postedView.imgView.image = selectImage;
    
    
    self.base64String = [XLMethod base64String:_postedView.imgView.image];
    
//    NSLog(@"%@",self.base64String);
//    [self.delegate seleteImg:_person.headImageView.image];
    [self dismissViewControllerAnimated:YES completion:nil];
    
}
- (void)image:(UIImage*)image didFinishSavingWithError:(NSError*)error contextInfo:(void*)contextInfo{
}
//取消，不在选取或照照片的代理
-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [picker dismissViewControllerAnimated:YES completion:nil];
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
