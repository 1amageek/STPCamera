//
//  STPCameraNavigationController.m
//  STPCamera
//
//  Created by Norikazu on 2015/07/14.
//  Copyright © 2015年 Stamp inc. All rights reserved.
//

#import "STPCameraNavigationController.h"

@interface STPCameraNavigationController ()

@end

@implementation STPCameraNavigationController

- (void)viewDidLoad
{
    self.navigationBarHidden = YES;
}

- (BOOL)prefersStatusBarHidden
{
    return YES;
}

- (NSUInteger)supportedInterfaceOrientations {
    if (self.topViewController.presentedViewController) {
        return self.topViewController.presentedViewController.supportedInterfaceOrientations;
    }
    return self.topViewController.supportedInterfaceOrientations;
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation {
    return self.topViewController.preferredInterfaceOrientationForPresentation;
}


@end
