//
//  ZFIEFoglessTool.m
//  ZFImageEditor
//
//  Created by 张帆 on 2018/10/25.
//  Copyright © 2018 张帆. All rights reserved.
//

#import "ZFIEFoglessTool.h"
#import "UIImage+ZFAutoHug.h"
#import "../NYXImageTool/Categories/UIImage+Enhancing.h"

@implementation ZFIEFoglessTool
- (void)start {
    
    [super start];
    [self.imageView setImage:[self.imageView.image autoHug]];
    
}
@end
