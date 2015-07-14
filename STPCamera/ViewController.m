//
//  ViewController.m
//  STPCamera
//
//  Created by Norikazu on 2015/07/13.
//  Copyright © 2015年 Stamp inc. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <DBCameraViewControllerDelegate>

@property (nonatomic) UITapGestureRecognizer *tapGestureRecognizer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapped:)];
    
    [self.view addGestureRecognizer:_tapGestureRecognizer];
    
}

- (void)tapped:(UITapGestureRecognizer *)recognizer
{
    STPCameraView *cameraView = [[STPCameraView alloc] initWithFrame:self.view.bounds];
    [cameraView buildInterface];
    STPCameraViewController *viewController = [[STPCameraViewController alloc] initWithDelegate:self cameraView:cameraView];
    STPCameraNavigationController *navigationController = [[STPCameraNavigationController alloc] initWithRootViewController:viewController];
    
    [self presentViewController:navigationController animated:YES completion:nil];
    
}


#pragma mark - <DBCameraViewControllerDelegate>

#pragma mark - DBCameraViewControllerDelegate

- (void) dismissCamera:(id)cameraViewController{
    [self.presentedViewController dismissViewControllerAnimated:YES completion:nil];
    [cameraViewController restoreFullScreenMode];
}

- (void) camera:(id)cameraViewController didFinishWithImage:(UIImage *)image withMetadata:(NSDictionary *)metadata
{
    NSLog(@"didFinish");
    /*
    DetailViewController *detail = [[DetailViewController alloc] init];
    [detail setDetailImage:image];
    [self.navigationController pushViewController:detail animated:NO];
    [cameraViewController restoreFullScreenMode];
    [self.presentedViewController dismissViewControllerAnimated:YES completion:nil];
     */
}


@end
