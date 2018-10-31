//
//  ZFIEEnhanceTool.m
//  ZFImageEditor
//
//  Created by 张帆 on 2018/10/29.
//  Copyright © 2018 张帆. All rights reserved.
//

#import "ZFIEEnhanceTool.h"
#import "../NYXImageTool/Categories/UIImage+Enhancing.h"

@implementation ZFIEEnhanceTool
- (void)start {
    [self.imageView setImage:[self.imageView.image autoEnhance]];
}
@end
