//
//  ZFIEFilterCell.m
//  ZFImageEditor
//
//  Created by 张帆 on 2018/10/25.
//  Copyright © 2018 张帆. All rights reserved.
//

#import "ZFIEFilterCell.h"
#import "ZFIEFilterItem.h"
#import <GPUImage.h>
#import <Masonry.h>
#import <ReactiveObjC.h>

@interface ZFIEFilterCell ()
@property (nonatomic, strong) UIImageView *iconView;
@end

@implementation ZFIEFilterCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _iconView = [[UIImageView alloc] init];
        [_iconView setContentMode:UIViewContentModeScaleAspectFit];
        [self.contentView addSubview:_iconView];
        _iconView.layer.cornerRadius = 5;
        _iconView.layer.masksToBounds = YES;
        [_iconView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.contentView).offset(5);
            make.left.mas_equalTo(self.contentView).offset(0);
            make.right.mas_equalTo(self.contentView).offset(0);
            make.bottom.mas_equalTo(self.contentView).offset(-5);
        }];
    }
    return self;
}

- (void)setItem:(ZFIEFilterItem *)item {
    _item = item;
    @weakify(self)
    [[_item.imageHasProcessdone takeUntil:self.rac_prepareForReuseSignal] subscribeNext:^(id  _Nullable x) {
        NSLog(@"imageHasProcessdone");
        dispatch_async(dispatch_get_main_queue(), ^{
            @strongify(self)
            [self.iconView setImage:x];
        });
    }];
    if (item.processImage) {
        [self.iconView setImage:item.processImage];
    } else {
//        [item processFilterImage];
    }
    
}
@end
