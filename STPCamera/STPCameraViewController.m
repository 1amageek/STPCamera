//
//  STPCameraViewController.m
//  STPCamera
//
//  Created by Norikazu on 2015/07/14.
//  Copyright © 2015年 Stamp inc. All rights reserved.
//

#import "STPCameraViewController.h"

@interface STPCameraImageCell : UICollectionViewCell

@property (nonatomic) UIImage *image;
- (void)setImage:(UIImage *)image;
@end


@implementation STPCameraImageCell

- (void)setImage:(UIImage *)image
{
    _image = image;
    if (image) {
        UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
        imageView.image = image;
        imageView.contentMode = UIViewContentModeScaleAspectFill;
        self.backgroundView = imageView;
    }
}


@end

@interface STPCameraViewController () <UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic) CGFloat collectionViewContentHeight;

@end

@implementation STPCameraViewController

- (instancetype)initWithDelegate:(id<DBCameraViewControllerDelegate>)delegate cameraView:(id)camera
{
    self = [super initWithDelegate:delegate cameraView:camera];
    if (self) {
        _images = @[];
    }
    return self;
}


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
    _collectionView.alwaysBounceHorizontal = YES;
    
    [_collectionView registerClass:[STPCameraImageCell class] forCellWithReuseIdentifier:@"STPCameraImageCell"];
    [self.view addSubview:_collectionView];
    
}

- (void)setImages:(NSArray *)images
{
    _images = images;
}

- (void)addImage:(UIImage *)image
{
    if (image) {
        NSMutableArray *images = [NSMutableArray arrayWithArray:_images];
        [images insertObject:image atIndex:0];
        _images = images;
        
        [self.collectionView performBatchUpdates:^{
            [self.collectionView insertItemsAtIndexPaths:@[[NSIndexPath indexPathForItem:0 inSection:0]]];
        } completion:^(BOOL finished) {
            
        }];
        
    }
}

- (CGFloat)collectionViewContentHeight
{
    return self.view.bounds.size.height * _collectionViewContentHeightRatio;
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _images.count;
}

- (nonnull UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    STPCameraImageCell *cell = (STPCameraImageCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"STPCameraImageCell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor whiteColor];
    [cell setImage:[self.images objectAtIndex:indexPath.item]];
    
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
