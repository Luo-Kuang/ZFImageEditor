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

@interface ZFImageEditorVC ()
@property (nonatomic, strong) ZFIETopBar *topView;
@property (nonatomic, strong) UIView *contentView;
@property (nonatomic, strong) UIImageView *imageView;
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
    
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.contentView);
    }];
    
}

#pragma mark - Getter
- (UIView *)operationBar{
    if (_operationBar == nil) {
        _operationBar = [[UIView alloc] init];
    }
    return _operationBar;
}


- (UIView *)topView {
    if (_topView == nil) {
        _topView = [[ZFIETopBar alloc] init];
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
        ZFIEFilterTool *filter = [[ZFIEFilterTool alloc] initWithName:@"Filter" iconName:@"zfiefilterbuttonicon"];
        ZFIEFilterTool *filter1 = [[ZFIEFilterTool alloc] initWithName:@"Magic" iconName:@"zfiemagicIconNomal"];
        ZFIEFilterTool *filter2 = [[ZFIEFilterTool alloc] initWithName:@"Size" iconName:@"zfiefilterbuttonsizeButtonicon"];
        _bottomView = [[ZFIEBottomBar alloc] initWithTarget:self tools:@[filter, filter1, filter2]];
    }
    return _bottomView;
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
