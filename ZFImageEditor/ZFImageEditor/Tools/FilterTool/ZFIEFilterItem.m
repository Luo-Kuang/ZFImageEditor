/**
 * This file is generated using the remodel generation script.
 * The name of the input file is ZFIEFilteritem.value
 * Created by zhangfan
 * Copyright © 2018年 zhangfan. All rights reserved.
 */

#if  ! __has_feature(objc_arc)
#error This file must be compiled with ARC. Use -fobjc-arc flag (or convert project to ARC).
#endif

#import "ZFIEFilterItem.h"
#import <GPUImage.h>
#import <RACSubject.h>

@interface ZFIEFilterItem ()

@property (nonatomic, strong) UIImage *thumnailImage;
@end

@implementation ZFIEFilterItem

- (void)setThumnailImage:(UIImage *)thumnailImage {
    _thumnailImage = thumnailImage;
    
}
- (RACSubject *)imageHasProcessdone {
    if (!_imageHasProcessdone) {
        _imageHasProcessdone = [RACSubject subject];
    }
    return _imageHasProcessdone;
}
- (void)processFilterImage {
    if (!_processImage) {
        GPUImageOutput<GPUImageInput> *filter = [[NSClassFromString(self.className) alloc] init];
        [filter useNextFrameForImageCapture];
        GPUImagePicture *stillImageSource = [[GPUImagePicture alloc]initWithImage:self.thumnailImage];
        [stillImageSource addTarget:filter];
        [stillImageSource processImage];
        _processImage = [filter imageFromCurrentFramebuffer];
        [self.imageHasProcessdone sendNext:_processImage];
    }
}


- (instancetype)initWithName:(NSString *)name className:(NSString *)className thumnailImage:(UIImage *)thumnailImage {
    if ((self = [super init])) {
        _className = [className copy];
        _name = [name copy];
        _thumnailImage = thumnailImage;
    }
    return self;
}


- (id)copyWithZone:(nullable NSZone *)zone
{
  return self;
}

- (NSString *)description
{
  return [NSString stringWithFormat:@"%@ - \n\t className: %@; \n\t name: %@; \n", [super description], _className, _name];
}

- (id<NSObject>)diffIdentifier
{
  return _className;
}

- (NSUInteger)hash
{
  NSUInteger subhashes[] = {[_className hash], [_name hash]};
  NSUInteger result = subhashes[0];
  for (int ii = 1; ii < 2; ++ii) {
    unsigned long long base = (((unsigned long long)result) << 32 | subhashes[ii]);
    base = (~base) + (base << 18);
    base ^= (base >> 31);
    base *=  21;
    base ^= (base >> 11);
    base += (base << 6);
    base ^= (base >> 22);
    result = base;
  }
  return result;
}

- (BOOL)isEqual:(ZFIEFilterItem *)object
{
  if (self == object) {
    return YES;
  } else if (object == nil || ![object isKindOfClass:[self class]]) {
    return NO;
  }
  return
    (_className == object->_className ? YES : [_className isEqual:object->_className]) &&
    (_name == object->_name ? YES : [_name isEqual:object->_name]);
}

- (BOOL)isEqualToDiffableObject:(nullable id)object
{
  return [self isEqual:object];
}

@end

