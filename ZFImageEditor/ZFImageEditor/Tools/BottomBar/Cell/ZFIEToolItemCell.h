//
//  ZFIEToolItemCell.h
//  ZFImageEditor
//
//  Created by 张帆 on 2018/10/24.
//  Copyright © 2018 张帆. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class ZFIEToolBase;

@interface ZFIEToolItemCell : UICollectionViewCell
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIImageView *iconView;
@property (nonatomic, strong) ZFIEToolBase *tool;
@end

NS_ASSUME_NONNULL_END
