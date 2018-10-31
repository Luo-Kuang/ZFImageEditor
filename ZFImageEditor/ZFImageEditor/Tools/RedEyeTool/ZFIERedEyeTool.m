//
//  ZFIERedEyeTool.m
//  ZFImageEditor
//
//  Created by 张帆 on 2018/10/29.
//  Copyright © 2018 张帆. All rights reserved.
//

#import "ZFIERedEyeTool.h"
#import "../NYXImageTool/Categories/UIImage+Enhancing.h"

@implementation ZFIERedEyeTool
- (void)start {
    [self.imageView setImage:[self.imageView.image redEyeCorrection]];
}
@end
