//
//  ZFIETopBar.m
//  ZFImageEditor
//
//  Created by 张帆 on 2018/10/23.
//  Copyright © 2018 张帆. All rights reserved.
//

#import "ZFIETopBar.h"
#import <Masonry.h>

static int NOMAL_BUTTON_WIDTH = 44;

@interface ZFIETopBar ()

@end

@implementation ZFIETopBar
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setBackgroundColor:[UIColor clearColor]];
        _backButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self setBackButtonType:ZFIETopBarBackButtonTypeNomal];
        [self addSubview:_backButton];
        
        _resetButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_resetButton setImage:[UIImage imageNamed:@"zfieresetbuttoniconAble"] forState:UIControlStateNormal];
        [_resetButton setImage:[UIImage imageNamed:@"zfieresetbuttoniconUnable"] forState:UIControlStateDisabled];
        [_resetButton setEnabled:NO];
        [self addSubview:_resetButton];
        
        
        _saveButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_saveButton setImage:[UIImage imageNamed:@"zfiesavebuttonicon"] forState:UIControlStateNormal];
        [self addSubview:_saveButton];
        
        _shareButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_shareButton setImage:[UIImage imageNamed:@"zfieexportbuttonicon"] forState:UIControlStateNormal];
        [self addSubview:_shareButton];
        
        [_backButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self);
            make.centerY.mas_equalTo(self);
            make.width.mas_equalTo(NOMAL_BUTTON_WIDTH);
            make.height.mas_equalTo(NOMAL_BUTTON_WIDTH);
        }];
        
        [_resetButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(self.backButton);
            make.centerX.mas_equalTo(self);
            make.width.mas_equalTo(NOMAL_BUTTON_WIDTH);
            make.height.mas_equalTo(NOMAL_BUTTON_WIDTH);
        }];
        
        [_shareButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(self).offset(0);
            make.centerY.mas_equalTo(self.backButton);
            make.width.mas_equalTo(NOMAL_BUTTON_WIDTH);
            make.height.mas_equalTo(NOMAL_BUTTON_WIDTH);
        }];
        
        [_saveButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(self.shareButton.mas_left).offset(0);
            make.centerY.mas_equalTo(self.shareButton);
            make.width.mas_equalTo(NOMAL_BUTTON_WIDTH);
            make.height.mas_equalTo(NOMAL_BUTTON_WIDTH);
        }];
    }
    return self;
}

- (void)setBackButtonType:(ZFIETopBarBackButtonType)backButtonType {
    switch (backButtonType) {
        case ZFIETopBarBackButtonTypeNomal:
        case ZFIETopBarBackButtonDown:
            [_backButton setImage:[UIImage imageNamed:@"zfiebackbuttondownicon"] forState:UIControlStateNormal];
            break;
        case ZFIETopBarBackButtonTypeBack:
            [_backButton setImage:[UIImage imageNamed:@"zfiebackbuttonIcon"] forState:UIControlStateNormal];
            break;
        default:
            break;
    }
}
@end
