//
//  ZFIEBottomBar.m
//  ZFImageEditor
//
//  Created by 张帆 on 2018/10/23.
//  Copyright © 2018 张帆. All rights reserved.
//

#import "ZFIEBottomBar.h"
#import <IGListKit.h>
#import <Masonry.h>
#import "../ToolBase/ZFIEToolBase.h"
#import "Cell/ZFIEToolItemCell.h"

@interface ZFIEBottomBar () <IGListAdapterDataSource, IGListSingleSectionControllerDelegate>
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) IGListAdapter *adapter;
@property (nonatomic, weak) id target;
@property (nonatomic, strong, nonnull) NSArray *tools;
@end

@implementation ZFIEBottomBar

- (instancetype)initWithTarget:(id)target tools:(nonnull NSArray *)tools{
    self = [super init];
    if (self) {
        _tools = tools;
        _target = target;
        [self addSubviews];
        [self setBackgroundColor:[UIColor clearColor]];
        self.adapter = [[IGListAdapter alloc] initWithUpdater:[[IGListAdapterUpdater alloc] init] viewController:self.target];
        self.adapter.dataSource = self;
        [self.adapter setCollectionView:self.collectionView];
        [self.adapter performUpdatesAnimated:YES completion:^(BOOL finished) {
            
        }];
    }
    return self;
}
- (void)addConstraints {
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self);
    }];
}

#pragma mark - Getter
- (UICollectionView *)collectionView {
    if (!_collectionView) {
        IGListCollectionViewLayout *layout = [[IGListCollectionViewLayout alloc] initWithStickyHeaders:NO scrollDirection:UICollectionViewScrollDirectionHorizontal topContentInset:0 stretchToEdge:YES];
        _collectionView = [[IGListCollectionView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 44) listCollectionViewLayout:layout];
        _collectionView.showsVerticalScrollIndicator = NO;
        _collectionView.showsHorizontalScrollIndicator = NO;
        [_collectionView setBackgroundColor:[UIColor clearColor]];
    }
    return _collectionView;
}


- (void)addSubviews {
    [self addSubview:self.collectionView];
    
}

- (NSArray<id<IGListDiffable>> *)objectsForListAdapter:(IGListAdapter *)listAdapter {
    return self.tools;
}

-(UIView *)emptyViewForListAdapter:(IGListAdapter *)listAdapter {
    return nil;
}

- (IGListSectionController *)listAdapter:(IGListAdapter *)listAdapter sectionControllerForObject:(id)object {
    NSInteger toolsCount = self.tools.count;
    IGListSingleSectionController *sc = [[IGListSingleSectionController alloc] initWithCellClass:[ZFIEToolItemCell class] configureBlock:^(id  _Nonnull item, __kindof ZFIEToolItemCell * _Nonnull cell) {
        cell.tool = item;
    } sizeBlock:^CGSize(id  _Nonnull item, id<IGListCollectionContext>  _Nullable collectionContext) {
        CGFloat width = [UIScreen mainScreen].bounds.size.width;
        return CGSizeMake(width / toolsCount, 44);
    }];
    sc.selectionDelegate = self;
    return sc;
}

- (void)didSelectSectionController:(IGListSingleSectionController *)sectionController withObject:(id)object {
    
}
@end
