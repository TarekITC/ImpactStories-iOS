//
//  PageTwo_2.m
//  ITC Impact Stories
//
//  Created by Tarek Benoudina on 29/08/16.
//  Copyright © 2016 ITC/United Nations. All rights reserved.
//

#import "PageTwo_2.h"
#import "SWRevealViewController.h"
#import "ViewController.h"
#import "ViewControllerThree.h"

@interface PageTwo_2 ()

@end

@implementation PageTwo_2

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
    
    
    // Setting the target and teh action for menu slide out button
    _menuButton.target = self.revealViewController;
    _menuButton.action = @selector(revealToggle:);
    
    // Loading webContent view
    NSString * path = [[NSBundle mainBundle] pathForResource:@"Cote_dIvoire" ofType:@"html"];
    NSURL * url = [NSURL fileURLWithPath:path];
    NSMutableURLRequest * urlRequest = [NSMutableURLRequest requestWithURL:url];
    [self.webContent loadRequest:urlRequest];
    
    
    UISwipeGestureRecognizer * swiperRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeToRight:)];
    swiperRight.numberOfTouchesRequired = 1;
    swiperRight.direction = UISwipeGestureRecognizerDirectionLeft;
    
    [self.view addGestureRecognizer:swiperRight];
    
    
    
    UISwipeGestureRecognizer * swiperLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeToLeft:)];
    swiperLeft.numberOfTouchesRequired = 1;
    swiperLeft.direction = UISwipeGestureRecognizerDirectionRight;
    
    [self.view addGestureRecognizer:swiperLeft];
    
}


-  (void) swipeToLeft:(UISwipeGestureRecognizer*) recogniser {
    CATransition* transition = [CATransition animation];
    transition.duration = .45;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    transition.type = kCATransitionFade;
    [self.navigationController.view.layer addAnimation:transition forKey:kCATransition];
    
    
    ViewController *nextVC =[self.storyboard instantiateViewControllerWithIdentifier:@"Page2"];
    [self.navigationController pushViewController:nextVC animated:NO];
    
    NSLog(@"Swipe to left !!!!!!!!");
    
}

-  (void) swipeToRight:(UISwipeGestureRecognizer*) recogniser {
    CATransition* transition = [CATransition animation];
    transition.duration = .45;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    transition.type = kCATransitionFade;
    [self.navigationController.view.layer addAnimation:transition forKey:kCATransition];
    
    
    ViewControllerThree *nextVC =[self.storyboard instantiateViewControllerWithIdentifier:@"VC3"];
    [self.navigationController pushViewController:nextVC animated:NO];
    
    NSLog(@"Swipe to right !!!!!!!!");
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}





// BackButton and transition to the previous Scene
- (IBAction)backButtonTapped:(id)sender {
    CATransition* transition = [CATransition animation];
    transition.duration = .45;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    transition.type = kCATransitionFade;
    [self.navigationController.view.layer addAnimation:transition forKey:kCATransition];
    
    
    ViewController *nextVC =[self.storyboard instantiateViewControllerWithIdentifier:@"VC1"];
    [self.navigationController pushViewController:nextVC animated:NO];
}


// NextButton and transition to the next Scene
- (IBAction)nextButtonTapped:(id)sender {
    
    CATransition* transition = [CATransition animation];
    transition.duration = .45;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    transition.type = kCATransitionFade;
    [self.navigationController.view.layer addAnimation:transition forKey:kCATransition];
    
    ViewControllerThree *nextViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"VC3"];
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
