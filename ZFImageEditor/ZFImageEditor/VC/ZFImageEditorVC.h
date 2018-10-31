//
//  ZFImageEditorVC.h
//  ZFImageEditor
//
//  Created by 张帆 on 2018/10/23.
//  Copyright © 2018 张帆. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZFImageEditorVC : UIViewController
@property (nonatomic, strong) UIImage *image;

@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, copy) NSMutableArray *imageOperationCaches;

@property (nonatomic, assign) BOOL hasChanged;


@end

NS_ASSUME_NONNULL_END
