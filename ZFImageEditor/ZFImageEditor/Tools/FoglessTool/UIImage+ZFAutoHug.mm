//
//  UIImage+ZFAutoHug.m
//  Gladius
//
//  Created by 张帆 on 2018/8/27.
//  Copyright © 2018年 张帆. All rights reserved.
//



#ifdef __cplusplus
#import <opencv2/opencv.hpp>
#import <opencv2/imgcodecs/ios.h>
#import <opencv2/imgproc/imgproc_c.h>
#import "MSRCR.h"
#endif

#import "UIImage+ZFAutoHug.h"

@implementation UIImage (ZFAutoHug)

- (UIImage *)autoHug {
    Mat orgionImage;
    UIImageToMat(self, orgionImage);
    //    cvtColor(orgionImage, orgionImage, COLOR_BGRA2BGR);
    cvtColor(orgionImage, orgionImage, COLOR_BGRA2BGR);
    vector<double> sigema;
    vector<double> weight;
    for (int i = 0; i < 3; i++) {
        weight.push_back(1./3);
    }
    
    sigema.push_back(30);
    sigema.push_back(200);
    sigema.push_back(250);
    
    //    char key;
    Mat imgdst;
    Msrcr msrcr;
    
    msrcr.MultiScaleRetinexCR(orgionImage, imgdst, weight, sigema, 128, 128, 2, 2);
    
    UIImage *oc_dst_img = MatToUIImage(imgdst);
    return oc_dst_img;
}
@end
