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
        
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.contentView);
            make.right.mas_equalTo(self.contentView);
            make.bottom.mas_equalTo(self.contentView);
            make.height.mas_equalTo(15);
        }];
        [_iconView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(self.contentView);
            make.height.mas_equalTo(20);
            make.width.mas_equalTo(20);
            make.bottom.mas_equalTo(self.titleLabel.mas_top);
        }];
    }
    return self;
}
- (void)setTool:(ZFIEToolBase *)tool {
    _tool = tool;
    [_titleLabel setText:tool.name];
    [_iconView setImage:tool.iconImage];
}
@end
