//
//  SecondTopViewController.m
//  ECSlidingViewController
//
//  Created by Michael Enriquez on 1/23/12.
//  Copyright (c) 2012 EdgeCase. All rights reserved.
//

#import "SecondTopViewController.h"

@implementation SecondTopViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    if (![self.slidingViewController.underLeftViewController isKindOfClass:[MenuViewController class]]) {
        self.slidingViewController.underLeftViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"Menu"];
    }
    self.slidingViewController.underRightViewController = nil;
    
    [self.view addGestureRecognizer:self.slidingViewController.panGesture];
    
    self.slidingViewController.topViewCenterMoved = ^(float x){
        self.view.backgroundColor = [UIColor colorWithRed:x/self.view.bounds.size.width green:50 blue:70 alpha:1];
    };
}

- (IBAction)revealMenu:(id)sender
{
    [self.slidingViewController anchorTopViewTo:ECRight];
}

@end
