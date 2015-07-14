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
    STPCameraView *cameraView = [STPCameraView initWithFrame:[[UIScreen mainScreen] bounds]];
    
    [cameraView buildInterface];
    STPCameraViewController *viewController = [[STPCameraViewController alloc] initWithDelegate:self cameraView:cameraView];
    viewController.useCameraSegue = NO;
    //DBCameraViewController *viewController = [[DBCameraViewController alloc] initWithDelegate:self cameraView:cameraView];
    
    //DBCameraContainerViewController *cameraContainer = [[DBCameraContainerViewController alloc] initWithDelegate:self];
    //[cameraContainer setFullScreenMode];
    STPCameraNavigationController *navigationController = [[STPCameraNavigationController alloc] initWithRootViewController:viewController];
    
    [self presentViewController:navigationController animated:YES completion:nil];
    
}



#pragma mark - DBCameraViewControllerDelegate

- (void) dismissCamera:(id)cameraViewController{
    [self.presentedViewController dismissViewControllerAnimated:YES completion:nil];
    [cameraViewController restoreFullScreenMode];
}

- (void) camera:(STPCameraViewController *)cameraViewController didFinishWithImage:(UIImage *)image withMetadata:(NSDictionary *)metadata
{
    [cameraViewController.cameraManager startRunning];
    
    STPCameraNavigationController *navi = (STPCameraNavigationController *)self.presentedViewController;
    [((STPCameraViewController *)navi.topViewController) addImage:image];
    
    /*
    DetailViewController *detail = [[DetailViewController alloc] init];
    [detail setDetailImage:image];
    [self.navigationController pushViewController:detail animated:NO];
    [cameraViewController restoreFullScreenMode];
    [self.presentedViewController dismissViewControllerAnimated:YES completion:nil];
     */
}


@end
