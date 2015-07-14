//
//  STPCameraContentCollectionView.m
//  STPCamera
//
//  Created by Norikazu on 2015/07/14.
//  Copyright © 2015年 Stamp inc. All rights reserved.
//

#import "STPCameraContentCollectionView.h"

@implementation STPCameraContentCollectionView

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    UIView *view = [super hitTest:point withEvent:event];
    UICollectionViewCell *cell = [self cellForItemAtIndexPath:[self indexPathForItemAtPoint:point]];
    if (cell) {
        return view;
    }
    return nil;
}

@end
