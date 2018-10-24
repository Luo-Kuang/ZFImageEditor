/**
 * This file is generated using the remodel generation script.
 * The name of the input file is ZFITToolBase.value
 * Created by zhangfan
 * Copyright © 2018年 zhangfan. All rights reserved.
 */

#if  ! __has_feature(objc_arc)
#error This file must be compiled with ARC. Use -fobjc-arc flag (or convert project to ARC).
#endif

#import "ZFIEToolBase.h"
#import <UIKit/UIImage.h>
@implementation ZFIEToolBase

- (instancetype)initWithName:(NSString *)name iconName:(NSString *)iconName
{
  if ((self = [super init])) {
      _name = [name copy];
      self.iconName = iconName;
  }
  return self;
}
- (void)setIconName:(NSString *)iconName {
    _iconName = iconName;
    if (iconName.length> 0) {
        _iconImage = [UIImage imageNamed:iconName];
    }
}
- (id)copyWithZone:(nullable NSZone *)zone
{
  return self;
}

- (NSString *)description
{
  return [NSString stringWithFormat:@"%@ - \n\t name: %@; \n", [super description], _name];
}

- (id<NSObject>)diffIdentifier
{
  return _name;
}

- (NSUInteger)hash
{
  NSUInteger subhashes[] = {[_name hash]};
  NSUInteger result = subhashes[0];
  for (int ii = 1; ii < 1; ++ii) {
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

- (BOOL)isEqual:(ZFIEToolBase *)object
{
  if (self == object) {
    return YES;
  } else if (object == nil || ![object isKindOfClass:[self class]]) {
    return NO;
  }
  return
    (_name == object->_name ? YES : [_name isEqual:object->_name]);
}

- (BOOL)isEqualToDiffableObject:(nullable id)object
{
  return [self isEqual:object];
}

@end

