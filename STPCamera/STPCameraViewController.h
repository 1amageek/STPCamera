//
//  STPCameraViewController.h
//  STPCamera
//
//  Created by Norikazu on 2015/07/14.
//  Copyright © 2015年 Stamp inc. All rights reserved.
//

#import "DBCameraViewController.h"
#import "STPCameraContentCollectionView.h"

@interface STPCameraViewController : DBCameraViewController

@property (nonatomic) STPCameraContentCollectionView *collectionView;
@property (nonatomic) CGFloat collectionViewContentHeightRatio;
@property (nonatomic) UIEdgeInsets collectionViewContentInsets;

@end
