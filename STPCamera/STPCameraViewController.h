//
//  STPCameraViewController.h
//  STPCamera
//
//  Created by 1amageek on 2015/10/30.
//  Copyright © 2015年 Stamp inc. All rights reserved.
//

@import UIKit;

@interface STPCameraViewController : UIViewController

@property (nonatomic) NSArray *images;

@property (nonatomic) UITapGestureRecognizer *tapGestureRecognizer;
@property (nonatomic) UIPanGestureRecognizer *panGestureRecognizer;
@property (nonatomic) UILongPressGestureRecognizer *longPressGestureRecognizer;

+ (void)requestAccessCameraCompletionHandler:(void (^)(BOOL authorized))handler;
- (void)cameraViewStartRecording;

@end
