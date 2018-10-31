//
//  UIImage+ZFIEResize.m
//  ZFImageEditor
//
//  Created by 张帆 on 2018/10/25.
//  Copyright © 2018 张帆. All rights reserved.
//

#import "UIImage+ZFIEResize.h"

@implementation UIImage (ZFIEResize)
- (UIImage *)resizeImageWithWidth:(CGFloat)_width {
    
    float imageWidth = self.size.width;
    float imageHeight = self.size.height;
    float width = _width;
    float height = self.size.height/(self.size.width/width);
    float widthScale = imageWidth /width;
    float heightScale = imageHeight /height;
    
    // 创建一个bitmap的context
    // 并把它设置成为当前正在使用的context
    
    UIGraphicsBeginImageContext(CGSizeMake(width, height));
    
    if (widthScale > heightScale) {
        [self drawInRect:CGRectMake(0, 0, imageWidth /heightScale , height)];
    } else {
        [self drawInRect:CGRectMake(0, 0, width , imageHeight /widthScale)];
    }
    
    // 从当前context中创建一个改变大小后的图片
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    // 使当前的context出堆栈
    
    UIGraphicsEndImageContext();
    
    return newImage;
}

- (UIImage *)thumbnailImage {
//    return [self corpImageWithSize:CGSizeMake(80, 80)];
    return [self scaleToSize:CGSizeMake(80, 80)];
}

- (UIImage *)corpImageWithSize:(CGSize)size {
    UIGraphicsBeginImageContext(size);
    [self drawAtPoint:CGPointMake(0, 0)];
    UIImage *cropImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return cropImage;
}

-(UIImage*)scaleToSize:(CGSize)size
{
    // 下面方法，第一个参数表示区域大小。第二个参数表示是否是非透明的。如果需要显示半透明效果，需要传NO，否则传YES。第三个参数就是屏幕密度了
    UIGraphicsBeginImageContextWithOptions(size, NO, [UIScreen mainScreen].scale);
    
    [self drawInRect:CGRectMake(0, 0, size.width, size.height)];
    
    UIImage* scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return scaledImage;   //返回的就是已经改变的图片
}

@end
