/**
 * This file is generated using the remodel generation script.
 * The name of the input file is ZFIEFilteritem.value
 * Created by zhangfan
 * Copyright © 2018年 zhangfan. All rights reserved.
 */

#import <Foundation/Foundation.h>
#import <IGListKit/IGListDiffable.h>
@class UIImage;
@class RACSubject;

@interface ZFIEFilterItem : NSObject <IGListDiffable, NSCopying>

@property (nonatomic, readonly, copy) NSString *className;
@property (nonatomic, readonly, copy) NSString *name;
@property (nonatomic, strong) UIImage *processImage;
@property (nonatomic, strong) RACSubject *imageHasProcessdone;

- (void)processFilterImage;

+ (instancetype)new NS_UNAVAILABLE;

- (instancetype)init NS_UNAVAILABLE;

- (instancetype)initWithName:(NSString *)name className:(NSString *)className  thumnailImage:(UIImage *)thumnailImage NS_DESIGNATED_INITIALIZER;

@end

