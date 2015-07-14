//
//  STPCameraViewController.m
//  STPCamera
//
//  Created by Norikazu on 2015/07/14.
//  Copyright © 2015年 Stamp inc. All rights reserved.
//

#import "STPCameraViewController.h"

@interface STPCameraViewController () <UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic) CGFloat collectionViewContentHeight;

@end

@implementation STPCameraViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _collectionViewContentHeightRatio = 0.15;
    _collectionViewContentInsets = UIEdgeInsetsMake(self.view.bounds.size.height - self.collectionViewContentHeight, 5, 5, 5);
    
    
    UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
    layout.minimumInteritemSpacing = 0;
    layout.minimumLineSpacing = 5;
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    _collectionView = [[STPCameraContentCollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
    _collectionView.dataSource = self;
    _collectionView.delegate = self;
    _collectionView.contentInset = _collectionViewContentInsets;
    _collectionView.backgroundColor = [UIColor clearColor];
    _collectionView.opaque = YES;
    
    [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"CameraImageCell"];
    [self.view addSubview:_collectionView];
    
}

- (CGFloat)collectionViewContentHeight
{
    return self.view.bounds.size.height * _collectionViewContentHeightRatio;
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 50;
}

- (nonnull UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CameraImageCell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor whiteColor];
    return cell;
}

- (CGSize)collectionView:(nonnull UICollectionView *)collectionView layout:(nonnull UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    return CGSizeMake(90, self.view.bounds.size.height - self.collectionViewContentInsets.top - self.collectionViewContentInsets.bottom);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
