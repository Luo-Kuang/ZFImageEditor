//
//  UIImage+ZFIEResize.h
//  ZFImageEditor
//
//  Created by 张帆 on 2018/10/25.
//  Copyright © 2018 张帆. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (ZFIEResize)
- (UIImage *)resizeImageWithWidth:(CGFloat)_width;
- (UIImage *)thumbnailImage;
- (UIImage *)corpImageWithSize:(CGSize)size;
@end

NS_ASSUME_NONNULL_END
