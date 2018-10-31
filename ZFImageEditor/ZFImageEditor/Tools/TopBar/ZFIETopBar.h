//
//  ZFIETopBar.h
//  ZFImageEditor
//
//  Created by 张帆 on 2018/10/23.
//  Copyright © 2018 张帆. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, ZFIETopBarBackButtonType) {
    ZFIETopBarBackButtonTypeNomal, // ZFIETopBarBackButtonDown
    ZFIETopBarBackButtonTypeBack,
    ZFIETopBarBackButtonDown,
};

@interface ZFIETopBar : UIView
@property (nonatomic, strong) UIButton *backButton;
@property (nonatomic, strong) UIButton *shareButton;
@property (nonatomic, strong) UIButton *resetButton;

@property (nonatomic, assign) ZFIETopBarBackButtonType backButtonType;

@end

NS_ASSUME_NONNULL_END
