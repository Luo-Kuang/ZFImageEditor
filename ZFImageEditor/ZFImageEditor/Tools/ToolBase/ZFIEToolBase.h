/**
 * This file is generated using the remodel generation script.
 * The name of the input file is ZFITToolBase.value
 * Created by zhangfan
 * Copyright © 2018年 zhangfan. All rights reserved.
 */

#import <Foundation/Foundation.h>
#import <IGListKit/IGListDiffable.h>
@class UIImage;

@interface ZFIEToolBase : NSObject <IGListDiffable, NSCopying>

@property (nonatomic, readonly, copy) NSString *name;
@property (nonatomic, readonly, copy) NSString *iconName;
@property (nonatomic, strong)  UIImage *iconImage;

@property (nonatomic, strong) NSArray *subTools;

+ (instancetype)new NS_UNAVAILABLE;

- (instancetype)init NS_UNAVAILABLE;

- (instancetype)initWithName:(NSString *)name iconName:(NSString *)iconName NS_DESIGNATED_INITIALIZER;

@end

