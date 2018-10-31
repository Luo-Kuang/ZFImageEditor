//
//  ZFIEToolItemCell.m
//  ZFImageEditor
//
//  Created by 张帆 on 2018/10/24.
//  Copyright © 2018 张帆. All rights reserved.
//

#import "ZFIEToolItemCell.h"
#import <Masonry.h>
#import "../../ToolBase/ZFIEToolBase.h"

@implementation ZFIEToolItemCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _iconView = [[UIImageView alloc] init];
        [_iconView setContentMode:UIViewContentModeScaleAspectFit];
        [self.contentView addSubview:_iconView];
        
        _titleLabel = [[UILabel alloc] init];
        [_titleLabel setFont:[UIFont systemFontOfSize:9]];
        [_titleLabel setTextColor:[UIColor colorWithRed:106/255.0 green:106/255.0 blue:106/255.0 alpha:1]];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:_titleLabel];
        
        
        [_iconView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(self.contentView);
            make.centerY.mas_equalTo(self.contentView).offset(-3);
        }];
        
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.left.mas_equalTo(self.contentView);
//            make.right.mas_equalTo(self.contentView);
//            make.bottom.mas_equalTo(self.contentView);
//            make.height.mas_equalTo(15);
            make.centerX.mas_equalTo(self.contentView);
            make.centerY.mas_equalTo(self.contentView).offset(15);
        }];
        self.backgroundColor = [UIColor clearColor];
        
       
    }
    return self;
}
- (void)setType:(ZFIEToolItemCellType)type {
    _type = type;
    switch (type) {
        case ZFIEToolItemCellCanSelected:
            
            break;
        case ZFIEToolItemCellNomal:
            [self.contentView setBackgroundColor:[UIColor whiteColor]];
            break;
        case ZFIEToolItemCellTypeNomalCorner:
            [self.contentView setBackgroundColor:[UIColor whiteColor]];
            self.contentView.layer.cornerRadius = 10;
//            self.contentView.layer.masksToBounds = YES;
            break;
            
        default:
            break;
    }
}
- (void)setSelected:(BOOL)selected {
    [super setSelected:selected];
//    NSLog(@"%s", __func__);
    if (self.type == ZFIEToolItemCellNomal || self.type == ZFIEToolItemCellTypeNomalCorner) {
        return;
    }
    if (!self.item.hasMenu) {
        return;
    }
    dispatch_async(dispatch_get_main_queue(), ^{
        
        self.contentView.backgroundColor = selected? [UIColor groupTableViewBackgroundColor]: [UIColor whiteColor];
//        [self.iconView setHighlighted:selected];
//        [self.titleLabel setTextColor:selected? [UIColor whiteColor]: [UIColor colorWithRed:106/255.0 green:106/255.0 blue:106/255.0 alpha:1]];
    });
}
- (void)setItem:(ZFIEToolBase *)item {
    _item = item;
    [_titleLabel setText:item.name];
    //    [_iconView setHighlightedImage:tool.iconSelectedImage];
    [_iconView setImage:item.iconImage];
}

@end
