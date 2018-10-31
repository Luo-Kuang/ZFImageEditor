//
//  ZFIEResizeTool.m
//  ZFImageEditor
//
//  Created by 张帆 on 2018/10/26.
//  Copyright © 2018 张帆. All rights reserved.
//

#import "ZFIEResizeTool.h"

#import <Masonry.h>

@interface ZFIEResizeTool () 

@end

@implementation ZFIEResizeTool
- (void)start {
    [super start];
    
    [UIView animateWithDuration:.3 animations:^{
        [self.operationView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(0);
        }];
        [self.operationView.superview layoutIfNeeded];
        
    } completion:^(BOOL finished) {
        
    }];
    
    if (self.ToolStart) {
        self.ToolStart();
    }
    
    
}

//- (void)cropViewController:(TOCropViewController *)cropViewController didFinishCancelled:(BOOL)cancelled {
//
//}

//- (void)cropViewController:(TOCropViewController *)cropViewController didCropToImage:(UIImage *)image withRect:(CGRect)cropRect angle:(NSInteger)angle {
//    [cropViewController dismissViewControllerAnimated:YES completion:^{
//
//    }];
//    [self.imageView setImage:image];
//}

@end
