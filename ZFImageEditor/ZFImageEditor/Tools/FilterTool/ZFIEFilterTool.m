//
//  ZFIEFilterTool.m
//  ZFImageEditor
//
//  Created by 张帆 on 2018/10/24.
//  Copyright © 2018 张帆. All rights reserved.
//

#import "ZFIEFilterTool.h"
#import <Masonry.h>
#import <IGListKit.h>
#import "ZFIEFilterItem.h"
#import "UIImage+ZFIEResize.h"
#import "ZFIEFilterCell.h"
#import <GPUImage.h>

@interface ZFIEFilterTool () <IGListAdapterDataSource, IGListSingleSectionControllerDelegate>
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) IGListAdapter *adapter;
@property (nonatomic, strong) NSArray *filterArr;
@end

@implementation ZFIEFilterTool

- (void)start {
    
    [super start];
    self.originImage = self.target.imageView.image;
    [self addSubviews];
    [self addConstraints];
    self.adapter = [[IGListAdapter alloc] initWithUpdater:[[IGListAdapterUpdater alloc] init] viewController:self.target];
    self.adapter.dataSource = self;
    [self.adapter setCollectionView:self.collectionView];
    dispatch_queue_t que = dispatch_queue_create("processimage", DISPATCH_QUEUE_SERIAL);
    dispatch_async(que, ^{
        for (ZFIEFilterItem *item in self.filterArr) {
            [item processFilterImage];
        }
    });
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
        IGListCollectionViewLayout *layout = [[IGListCollectionViewLayout alloc] initWithStickyHeaders:NO scrollDirection:UICollectionViewScrollDirectionHorizontal topContentInset:0 stretchToEdge:YES];
        _collectionView = [[IGListCollectionView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, self.nomalCellSize.height) listCollectionViewLayout:layout];
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
    IGListSingleSectionController *sc = [[IGListSingleSectionController alloc] initWithCellClass:[ZFIEFilterCell class] configureBlock:^(id  _Nonnull item, __kindof ZFIEFilterCell * _Nonnull cell) {
        cell.item = item;
        [item processFilterImage];
    } sizeBlock:^CGSize(id  _Nonnull item, id<IGListCollectionContext>  _Nullable collectionContext) {
        return self.nomalCellSize;
    }];
    sc.inset = UIEdgeInsetsMake(0, 0, 0, 0);
    sc.selectionDelegate = self;
    return sc;
}

- (void)didSelectSectionController:(IGListSingleSectionController *)sectionController withObject:(id)object {
    ZFIEFilterItem *item = object;
    GPUImageOutput<GPUImageInput> *filter = [[NSClassFromString(item.className) alloc] init];
    [filter useNextFrameForImageCapture];
    GPUImagePicture *stillImageSource = [[GPUImagePicture alloc] initWithImage:self.originImage];
    [stillImageSource addTarget:filter];
    [stillImageSource processImage];
    UIImage *newImg = [filter imageFromCurrentFramebuffer];
    [self.imageView setImage:newImg];
}



- (NSArray *)filterArr {
    if (!_filterArr) {
        _filterArr = @[
                       [[ZFIEFilterItem alloc] initWithName:@"Normal" className:@"IFNormalFilter" thumnailImage:self.thumbinalImage],
                       [[ZFIEFilterItem alloc] initWithName:@"Sutro" className:@"IFSutroFilter" thumnailImage:self.thumbinalImage],
                       [[ZFIEFilterItem alloc] initWithName:@"Amaro" className:@"IFAmaroFilter" thumnailImage:self.thumbinalImage],
                       [[ZFIEFilterItem alloc] initWithName:@"Rise" className:@"IFRiseFilter" thumnailImage:self.thumbinalImage],
                       [[ZFIEFilterItem alloc] initWithName:@"Hudson" className:@"IFHudsonFilter" thumnailImage:self.thumbinalImage],
                       [[ZFIEFilterItem alloc] initWithName:@"XproIilter" className:@"IFXproIIFilter" thumnailImage:self.thumbinalImage],
                       [[ZFIEFilterItem alloc] initWithName:@"Sierra" className:@"IFSierraFilter" thumnailImage:self.thumbinalImage],
                       [[ZFIEFilterItem alloc] initWithName:@"Lomofi" className:@"IFLomofiFilter" thumnailImage:self.thumbinalImage],
                       [[ZFIEFilterItem alloc] initWithName:@"Earlybird" className:@"IFEarlybirdFilter" thumnailImage:self.thumbinalImage],
                       [[ZFIEFilterItem alloc] initWithName:@"Toaster" className:@"IFToasterFilter" thumnailImage:self.thumbinalImage],
                       [[ZFIEFilterItem alloc] initWithName:@"Brannan" className:@"IFBrannanFilter" thumnailImage:self.thumbinalImage],
                       [[ZFIEFilterItem alloc] initWithName:@"Inkwell" className:@"IFInkwellFilter" thumnailImage:self.thumbinalImage],
                       [[ZFIEFilterItem alloc] initWithName:@"Walden" className:@"IFWaldenFilter" thumnailImage:self.thumbinalImage],
                       [[ZFIEFilterItem alloc] initWithName:@"Hefe" className:@"IFHefeFilter" thumnailImage:self.thumbinalImage],
                       [[ZFIEFilterItem alloc] initWithName:@"Valencia" className:@"IFValenciaFilter" thumnailImage:self.thumbinalImage],
                       [[ZFIEFilterItem alloc] initWithName:@"Nashville" className:@"IFNashvilleFilter" thumnailImage:self.thumbinalImage],
                       [[ZFIEFilterItem alloc] initWithName:@"1977" className:@"IF1977Filter" thumnailImage:self.thumbinalImage],
                       [[ZFIEFilterItem alloc] initWithName:@"LordKelvin" className:@"IFLordKelvinFilter" thumnailImage:self.thumbinalImage],
                       [[ZFIEFilterItem alloc] initWithName:@"Sepia" className:@"GPUImageSepiaFilter" thumnailImage:self.thumbinalImage],
                       ];
    }
    return _filterArr;
}




@end
