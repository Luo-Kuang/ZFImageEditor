//
//  ZFImageEditorVC.m
//  ZFImageEditor
//
//  Created by 张帆 on 2018/10/23.
//  Copyright © 2018 张帆. All rights reserved.
//

#import "ZFImageEditorVC.h"
#import <Masonry.h>
#import "../Tools/TopBar/ZFIETopBar.h"
#import "../Tools/BottomBar/ZFIEBottomBar.h"
#import "../Tools/FilterTool/ZFIEFilterTool.h"
#import "../Tools/FoglessTool/ZFIEFoglessTool.h"
#import "../Tools/ResizeTool/ZFIEResizeTool.h"
#import <ReactiveObjC.h>
#import "../Tools/FilterTool/UIImage+ZFIEResize.h"
#import "../Tools/AutoColorTool/ZFIEAutoColorTool.h"

#import "TOCropViewController.h"

@interface ZFImageEditorVC () <TOCropViewControllerDelegate>
@property (nonatomic, strong) ZFIETopBar *topView;
@property (nonatomic, strong) UIView *contentView;
@property (nonatomic, strong) ZFIEBottomBar *bottomView;
@property (nonatomic, strong) UIView *operationBar;



@end

@implementation ZFImageEditorVC

- (void)viewDidLoad {
    [super viewDidLoad];
    if (self.navigationController) {
        self.navigationController.navigationBar.hidden = YES;
    }
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    [self addSubviews];
    [self addConstraints];
    @weakify(self)
    [[self.imageView rac_signalForSelector:@selector(setImage:)] subscribeNext:^(RACTuple * _Nullable x) {
        @strongify(self)
        self.hasChanged = YES;
    }];
}
- (void)setImage:(UIImage *)image {
    _image = [image resizeImageWithWidth:640];
}
- (void)addConstraints {
   
    [self.topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view);
        make.right.mas_equalTo(self.view);
        make.left.mas_equalTo(self.view);
        make.height.mas_equalTo(44);
    }];
    
    [self.bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view);
        make.right.mas_equalTo(self.view);
        make.bottom.mas_equalTo(self.view);
        make.height.mas_equalTo(44);
    }];
    
    
    [self.operationBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view);
        make.right.mas_equalTo(self.view);
        make.bottom.mas_equalTo(self.bottomView.mas_top);
        make.height.mas_equalTo(0);
    }];
    
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view);
        make.right.mas_equalTo(self.view);
        make.top.mas_equalTo(self.topView.mas_bottom);
        make.bottom.mas_equalTo(self.operationBar.mas_top);
    }];
    
    
    [self layoutImageView];
//    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.mas_equalTo(self.contentView);
////        make.centerX.mas_equalTo(self.contentView);
////        make.centerY.mas_equalTo(self.contentView);
////        make.height.mas_lessThanOrEqualTo(self.contentView.mas_height);
////        make.width.mas_lessThanOrEqualTo(self.contentView.mas_width);
//    }];
    
}


//- (void)viewDidLayoutSubviews
//{
//    [super viewDidLayoutSubviews];
//    [self layoutImageView];
//}

#pragma mark - Image Layout -
- (void)layoutImageView
{
    if (self.imageView.image == nil)
        return;
    
    CGFloat padding = 20.0f;
    
    CGRect viewFrame = CGRectMake(0, 44, self.view.frame.size.width, self.view.frame.size.height - 44 - 44 - 80);
    viewFrame.size.width -= (padding * 2.0f);
    viewFrame.size.height -= ((padding * 2.0f));
    
    CGRect imageFrame = CGRectZero;
    imageFrame.size = self.imageView.image.size;
    
    if (self.imageView.image.size.width > viewFrame.size.width ||
        self.imageView.image.size.height > viewFrame.size.height)
    {
        CGFloat scale = MIN(viewFrame.size.width / imageFrame.size.width, viewFrame.size.height / imageFrame.size.height);
        imageFrame.size.width *= scale;
        imageFrame.size.height *= scale;
        imageFrame.origin.x = (CGRectGetWidth(self.view.bounds) - imageFrame.size.width) * 0.5f;
        imageFrame.origin.y = (CGRectGetHeight(self.view.bounds) - imageFrame.size.height - 44 - 44 - 80) * 0.5f;
        self.imageView.frame = imageFrame;
    }
    else {
        self.imageView.frame = imageFrame;
        self.imageView.center = (CGPoint){CGRectGetMidX(self.contentView.bounds), CGRectGetMidY(self.contentView.bounds)};
    }
}


#pragma mark - Getter
- (UIView *)operationBar{
    if (_operationBar == nil) {
        _operationBar = [[UIView alloc] init];
        [_operationBar setBackgroundColor:[UIColor groupTableViewBackgroundColor]];
    }
    return _operationBar;
}

- (NSMutableArray *)imageOperationCaches {
    if (!_imageOperationCaches) {
        _imageOperationCaches = [NSMutableArray arrayWithCapacity:5];
    }
    return _imageOperationCaches;
}

- (UIView *)topView {
    if (_topView == nil) {
        _topView = [[ZFIETopBar alloc] init];
        @weakify(self)
        [[_topView.backButton rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
            @strongify(self)
            if (self.topView.backButtonType != ZFIETopBarBackButtonTypeBack) {
                [self dismissViewControllerAnimated:YES completion:^{
                    
                }];
            }
        }];
        
        [[_topView.resetButton rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
            @strongify(self)
            [self.imageView setImage:self.image];
            self.hasChanged = NO;
        }];
        
        RAC(_topView.resetButton, enabled) = RACObserve(self, hasChanged);
    }
    return _topView;
}

- (UIView *)contentView {
    if (_contentView == nil) {
        _contentView = [[UIView alloc] init];
    }
    return _contentView;
}

- (UIImageView *)imageView {
    if (_imageView == nil) {
        _imageView = [[UIImageView alloc] init];
        [_imageView setImage:self.image];
        [_imageView setContentMode:UIViewContentModeScaleAspectFit];
    }
    return _imageView;
}

- (UIView *)bottomView {
    if (_bottomView == nil) {
        
        ZFIEFilterTool *filter = [[ZFIEFilterTool alloc] initWithName:@"Filter" iconName:@"zfiefilterbuttonicon" operationView:self.operationBar];
        filter.target = self;
        filter.originImage = self.image;
        filter.imageView = self.imageView;
//        filter.iconSelectedImage = [UIImage imageNamed:@"zfiefilterbuttoniconselect"];
        filter.hasMenu = YES;

        ZFIEAutoColorTool *autoColor = [[ZFIEAutoColorTool alloc] initWithName:@"Auto" iconName:@"zfiemagicIconNomal" operationView:self.operationBar];
        autoColor.target = self;
        autoColor.originImage = self.image;
        autoColor.imageView = self.imageView;
        autoColor.hasMenu = YES;
        
        ZFIEResizeTool *resize = [[ZFIEResizeTool alloc] initWithName:@"Transform" iconName:@"zfiefilterbuttonsizeButtonicon" operationView:self.operationBar];
//        resize.originImage = self.image;
//        resize.imageView = self.imageView;
//        resize.target = self;
        resize.ToolStart = ^{
            TOCropViewController *cropViewController = [[TOCropViewController alloc] initWithCroppingStyle:TOCropViewCroppingStyleDefault image:self.imageView.image];
            cropViewController.delegate = self;

            CGRect viewFrame = [self.view convertRect:self.imageView.frame toView:self.contentView];
            
            [cropViewController presentAnimatedFromParentViewController:self fromView:self.imageView fromFrame:viewFrame setup:^{
//                self.imageView.hidden = YES;
            } completion:^{
                
            }];
            
        };
        
//        ZFIEResizeTool *text = [[ZFIEResizeTool alloc] initWithName:@"Text" iconName:@"zfietextbuttonicon" operationView:self.operationBar];
        
        _bottomView = [[ZFIEBottomBar alloc] initWithTarget:self tools:@[filter, autoColor, resize]];
        
    }
    return _bottomView;
}

- (void)cropViewController:(TOCropViewController *)cropViewController didCropToImage:(UIImage *)image withRect:(CGRect)cropRect angle:(NSInteger)angle {
    [self updateImageWithCroped:image cropViewController:cropViewController];
}

- (void)cropViewController:(TOCropViewController *)cropViewController didFinishCancelled:(BOOL)cancelled {
    [self updateImageWithCroped:self.imageView.image cropViewController:cropViewController];
}

- (void)updateImageWithCroped:(UIImage *)image cropViewController:(TOCropViewController *)cropViewController {
    self.imageView.image = image;
    [cropViewController dismissAnimatedFromParentViewController:self
                                               withCroppedImage:image
                                                         toView:self.imageView
                                                        toFrame:CGRectZero
                                                          setup:^{ [self layoutImageView]; }
                                                     completion:
     ^{
         
     }];
}

- (void)addSubviews {

    [self.view addSubview:self.topView];

    [self.view addSubview:self.contentView];

    [self.contentView addSubview:self.imageView];

    [self.view addSubview:self.operationBar];
    
    [self.view addSubview:self.bottomView];
    
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}

@end
