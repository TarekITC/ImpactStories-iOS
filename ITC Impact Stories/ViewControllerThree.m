//
//  ViewControllerThree.m
//  ITC Impact Stories
//
//  Created by Tarek Benoudina on 25/06/16.
//  Copyright © 2016 ITC/United Nations. All rights reserved.
//

#import "ViewControllerThree.h"
#import "SWRevealViewController.h"
#import "ViewControllerFour.h"
#import "ViewControllerTwo.h"
#import "ViewController.h"

@interface ViewControllerThree ()

@end

@implementation ViewControllerThree

- (void)viewDidLoad {
    [super viewDidLoad];
   
    
    
    // Setting the image title in the navigation bar
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 100.0f, 40.0f)];
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    
    UIImage * logo = [UIImage imageNamed:@"ITC-logo-high.png"];
    
    [imageView setImage:logo];
    
    self.navigationItem.titleView = imageView;
    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
    
    
    // setting butoons images
    _menuButton.image =  [[UIImage imageNamed:@"menu-30.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    _nextButton.image = [[UIImage imageNamed:@"right-30.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    _backButton.image = [[UIImage imageNamed:@"left-30.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    _menuButton.target = self.revealViewController;
    _menuButton.action = @selector(revealToggle:);
    
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)unwindToViewControllerThree:(UIStoryboardSegue *)unwindSegue
{
    
    UIViewController* sourceViewController = unwindSegue.sourceViewController;
    
    if ([sourceViewController isKindOfClass:[ViewControllerFour class]])
    {
        NSLog(@"Coming from BLUE!");
    }else if ([sourceViewController isKindOfClass:[ViewControllerTwo class]]){
        NSLog(@"coming from VC2 or green !");
    }

}



// BackButton and transition to the previous Scene
- (IBAction)backButtonTapped:(id)sender {
    CATransition* transition = [CATransition animation];
    transition.duration = .45;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    transition.type = kCATransitionFade;
    [self.navigationController.view.layer addAnimation:transition forKey:kCATransition];
    
    
    ViewControllerTwo *nextVC =[self.storyboard instantiateViewControllerWithIdentifier:@"VC2"];
    [self.navigationController pushViewController:nextVC animated:NO];
}


// NextButton and transition to the next Scene
- (IBAction)nextButtonTapped:(id)sender {
    
    CATransition* transition = [CATransition animation];
    transition.duration = .45;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    transition.type = kCATransitionFade;
    [self.navigationController.view.layer addAnimation:transition forKey:kCATransition];
    
   // ViewControllerFour *nextViewController = [[ViewControllerFour alloc] init];
    
    //[nextViewController.scrollView setScrollEnabled:YES];
    
    ViewControllerFour *nextViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"VC4"];
    [self.navigationController pushViewController:nextViewController animated:NO];
    
    
}





/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
