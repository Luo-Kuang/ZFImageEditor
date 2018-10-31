//
//  ZFIEResizeTool.h
//  ZFImageEditor
//
//  Created by 张帆 on 2018/10/26.
//  Copyright © 2018 张帆. All rights reserved.
//

#import "ZFIEToolBase.h"

NS_ASSUME_NONNULL_BEGIN

@interface ZFIEResizeTool : ZFIEToolBase
@property (nonatomic, copy) void(^ToolStart)(void);
@end

NS_ASSUME_NONNULL_END
