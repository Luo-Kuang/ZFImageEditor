//
//  ZFIEAutoColorTool.m
//  ZFImageEditor
//
//  Created by 张帆 on 2018/10/29.
//  Copyright © 2018 张帆. All rights reserved.
//

#import "ZFIEAutoColorTool.h"
#import <IGListKit.h>
#import <Masonry.h>
#import "../FoglessTool/ZFIEFoglessTool.h"
#import "ZFIEToolItemCell.h"
#import "../NYXImageTool/Categories/UIImage+Enhancing.h"
#import "../RedEyeTool/ZFIERedEyeTool.h"
#import "../EnhanceTool/ZFIEEnhanceTool.h"


@interface ZFIEAutoColorTool () <IGListAdapterDataSource, IGListSingleSectionControllerDelegate>

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) IGListAdapter *adapter;
@property (nonatomic, strong) NSArray *filterArr;
@end

@implementation ZFIEAutoColorTool

- (void)start {
    
    
    [super start];
    
    [self addSubviews];
    [self addConstraints];
    self.adapter = [[IGListAdapter alloc] initWithUpdater:[[IGListAdapterUpdater alloc] init] viewController:self.target];
    self.adapter.dataSource = self;
    [self.adapter setCollectionView:self.collectionView];
    
    [UIView animateWithDuration:.3 animations:^{
        [self.operationView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(self.nomalCellSize.height);
        }];
        [self.operationView.superview layoutIfNeeded];
        self.collectionView.alpha = 1;
    } completion:^(BOOL finished) {
       
    }];
    
    
}

- (void)end {
    for (UIView *view in self.operationView.subviews) {
        [view removeFromSuperview];
    }
    [UIView animateWithDuration:.3 animations:^{
        [self.operationView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(0);
        }];
        [self.operationView.superview layoutIfNeeded];
        
    } completion:^(BOOL finished) {
        
        
    }];
}
- (void)addConstraints {
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.operationView);
    }];
}


#pragma mark - Getter
- (UICollectionView *)collectionView {
    if (!_collectionView) {
        IGListCollectionViewLayout *layout = [[IGListCollectionViewLayout alloc] initWithStickyHeaders:NO scrollDirection:UICollectionViewScrollDirectionHorizontal topContentInset:0 stretchToEdge:NO];
        _collectionView = [[IGListCollectionView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 80) listCollectionViewLayout:layout];
        _collectionView.showsVerticalScrollIndicator = NO;
        _collectionView.showsHorizontalScrollIndicator = NO;
        _collectionView.alpha = 0;
        [_collectionView setBackgroundColor:[UIColor groupTableViewBackgroundColor]];
    }
    return _collectionView;
}


- (void)addSubviews {
    [self.operationView addSubview:self.collectionView];
    
}

- (NSArray<id<IGListDiffable>> *)objectsForListAdapter:(IGListAdapter *)listAdapter {
    return self.filterArr;
}

-(UIView *)emptyViewForListAdapter:(IGListAdapter *)listAdapter {
    return nil;
}

- (IGListSectionController *)listAdapter:(IGListAdapter *)listAdapter sectionControllerForObject:(id)object {
    IGListSingleSectionController *sc = [[IGListSingleSectionController alloc] initWithCellClass:[ZFIEToolItemCell class] configureBlock:^(id  _Nonnull item, __kindof ZFIEToolItemCell * _Nonnull cell) {
        cell.type = ZFIEToolItemCellTypeNomalCorner;
        cell.item = item;
    } sizeBlock:^CGSize(id  _Nonnull item, id<IGListCollectionContext>  _Nullable collectionContext) {
        return CGSizeMake(70, 70);
    }];
    sc.inset = UIEdgeInsetsMake(5, 5, 5, 5);
    sc.selectionDelegate = self;
    return sc;
}

- (void)didSelectSectionController:(IGListSingleSectionController *)sectionController withObject:(id)object {
    ZFIEToolBase *tool = object;
    [tool start];
}

- (NSArray *)filterArr {
    if (!_filterArr) {
        
        ZFIEFoglessTool *fogless = [[ZFIEFoglessTool alloc] initWithName:@"Fogless" iconName:@"zfiefoglessbuttonicon" operationView:self.operationView];
        fogless.target = self.target;
        fogless.originImage = self.originImage;
        fogless.imageView = self.imageView;
        
        ZFIERedEyeTool *redEye = [[ZFIERedEyeTool alloc] initWithName:@"RedEye" iconName:@"zfirremoveredeyebuttonicon" operationView:self.operationView];
        redEye.target = self.target;
        redEye.originImage = self.originImage;
        redEye.imageView = self.imageView;
        
        ZFIEEnhanceTool *enhance = [[ZFIEEnhanceTool alloc] initWithName:@"Enhance" iconName:@"zfieenhancebuttonicon" operationView:self.operationView];
        enhance.target = self.target;
        enhance.originImage = self.originImage;
        enhance.imageView = self.imageView;
        
        _filterArr = @[fogless, redEye, enhance];
    }
    return _filterArr;
}

@end
