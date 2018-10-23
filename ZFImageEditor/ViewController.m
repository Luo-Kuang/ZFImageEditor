//
//  ViewController.m
//  ZFImageEditor
//
//  Created by 张帆 on 2018/10/23.
//  Copyright © 2018 张帆. All rights reserved.
//

#import "ViewController.h"
#import "ZFImageEditor/VC/ZFImageEditorVC.h"

@interface ViewController () <UINavigationControllerDelegate, UIImagePickerControllerDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}

- (IBAction)startButtonClick:(id)sender {
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) {
        UIImagePickerController *pickerVC = [[UIImagePickerController alloc] init];
        pickerVC.allowsEditing = YES;
        pickerVC.delegate = self;
        pickerVC.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        [self presentViewController:pickerVC animated:YES completion:^{
            
        }];
    }
}


- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<UIImagePickerControllerInfoKey,id> *)info {
    ZFImageEditorVC *editor = [[ZFImageEditorVC alloc] init];
    editor.image = info[UIImagePickerControllerOriginalImage];
    [picker presentViewController:editor animated:YES completion:^{
        
    }];
}

@end
