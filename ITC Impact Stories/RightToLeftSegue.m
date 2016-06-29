//
//  rightToLeftSegue.m
//  ITC Impact Stories
//
//  Created by Tarek Benoudina on 25/06/16.
//  Copyright © 2016 ITC/United Nations. All rights reserved.
//

#import "RightToLeftSegue.h"
#import "ViewControllerThree.h"

@implementation RightToLeftSegue

-(void) perform {


//    UIViewController *source  = self.sourceViewController;
//    ViewControllerThree *destView = [[ViewControllerThree alloc] init];
//    UIViewController *destination = destView;
//    
//    [UIView transitionFromView:source.view toView:destination.view duration:0.50f options:UIViewAnimationOptionTransitionFlipFromRight completion:^(BOOL finished) { NSLog(@"Transitioning is finished");
//    }];
//    
//    
//    NSLog(@"go through this !");
    

    UIViewController *sourceViewController = self.sourceViewController;
    UIViewController *destinationViewController = self.destinationViewController;
    
    // Add the destination view as a subview, temporarily
    [sourceViewController.view addSubview:destinationViewController.view];
    
    // Transformation start scale
    destinationViewController.view.transform = CGAffineTransformMakeScale(0.05, 0.05);
    
    // Store original centre point of the destination view
    CGPoint originalCenter = destinationViewController.view.center;
    // Set center to start point of the button
    destinationViewController.view.center = self.originatingPoint;
    
    [UIView animateWithDuration:0.5
                          delay:0.0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         // Grow!
                         destinationViewController.view.transform = CGAffineTransformMakeScale(1.0, 1.0);
                         destinationViewController.view.center = originalCenter;
                     }
                     completion:^(BOOL finished){
                         [destinationViewController.view removeFromSuperview]; // remove from temp super view
                         [sourceViewController presentViewController:destinationViewController animated:NO completion:NULL]; // present VC
                     }];
    
}

@end
