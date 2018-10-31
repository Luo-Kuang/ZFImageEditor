/**
 * This file is generated using the remodel generation script.
 * The name of the input file is ZFITToolBase.value
 * Created by zhangfan
 * Copyright © 2018年 zhangfan. All rights reserved.
 */

#import <Foundation/Foundation.h>
#import <IGListKit/IGListDiffable.h>
#import <UIKit/UIKit.h>
#import "../../VC/ZFImageEditorVC.h"

@interface ZFIEToolBase : NSObject <IGListDiffable, NSCopying>

@property (nonatomic, readonly, copy) NSString *name;
@property (nonatomic, readonly, copy) NSString *iconName;

@property (nonatomic, assign) BOOL hasMenu;

@property (nonatomic, strong)  UIImage *iconImage;
@property (nonatomic, strong)  UIImage *iconSelectedImage;

@property (nonatomic, weak) UIView *operationView;
@property (nonatomic, weak) ZFImageEditorVC *target;


@property (nonatomic, strong) UIImage *originImage;
@property (nonatomic, strong) UIImage *thumbinalImage;
@property (nonatomic, weak) UIImageView *imageView;

@property (nonatomic, assign) CGSize nomalCellSize;



- (void)start;
- (void)end;


+ (instancetype)new NS_UNAVAILABLE;

- (instancetype)init NS_UNAVAILABLE;

- (instancetype)initWithName:(NSString *)name iconName:(NSString *)iconName operationView:(UIView *)operationView NS_DESIGNATED_INITIALIZER;

@end

