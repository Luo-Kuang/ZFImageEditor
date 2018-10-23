//
//  ZFImageEditorVC.m
//  ZFImageEditor
//
//  Created by 张帆 on 2018/10/23.
//  Copyright © 2018 张帆. All rights reserved.
//

#import "ZFImageEditorVC.h"
#import <Masonry.h>

@interface ZFImageEditorVC ()
@property (nonatomic, strong) UIView *topView;
@property (nonatomic, strong) UIView *contentView;
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UIView *bottomView;
@property (nonatomic, strong) UIButton *backButton;

@end

@implementation ZFImageEditorVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addSubviews];
    [self addConstraints];
}

- (void)addConstraints {
    

    [self.topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view);
        make.right.mas_equalTo(self.view);
        make.left.mas_equalTo(self.view);
        make.height.mas_equalTo(64);
    }];
    
    [self.bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view);
        make.right.mas_equalTo(self.view);
        make.bottom.mas_equalTo(self.view);
        make.height.mas_equalTo(44);
    }];
    
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view);
        make.right.mas_equalTo(self.view);
        make.top.mas_equalTo(self.topView.mas_bottom);
        make.bottom.mas_equalTo(self.bottomView.mas_top);
    }];
    
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.contentView);
    }];
    [self.backButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(self.topView).offset(0);
        make.left.mas_equalTo(self.topView).offset(10);
        make.width.mas_equalTo(44);
        make.height.mas_equalTo(44);
    }];

}

#pragma mark - Getter
- (UIButton *)backButton{
    if (_backButton == nil) {
        _backButton = [[UIButton alloc] init];
        [_backButton setTitle:@"返回" forState:UIControlStateNormal];
        [_backButton addTarget:self action:@selector(backButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _backButton;
}

- (void)backButtonClick:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

- (UIView *)topView {
    if (_topView == nil) {
        _topView = [[UIView alloc] init];
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
        _bottomView = [[UIView alloc] init];
    }
    return _bottomView;
}


- (void)addSubviews {

    [self.view addSubview:self.topView];
    [self.topView addSubview:self.backButton];

    [self.view addSubview:self.contentView];

    [self.contentView addSubview:self.imageView];

    [self.view addSubview:self.bottomView];
    
}

@end
