//
//  ViewControllerFour.m
//  ITC Impact Stories
//
//  Created by Tarek Benoudina on 25/06/16.
//  Copyright © 2016 ITC/United Nations. All rights reserved.
//

#import "ViewControllerFour.h"
#import "SWRevealViewController.h"
#import "ViewControllerThree.h"
#import "ViewController.h"
#import "PageFour.h"

@interface ViewControllerFour ()

@end

@implementation ViewControllerFour

@synthesize menuButton,nextButton,backButton,scrollView;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.scrollView setScrollEnabled:YES];
    [self.scrollView setContentSize:CGSizeMake(375,701)];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
   
    
    // Setting the image title in the navigation bar
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 100.0f, 40.0f)];
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    
    UIImage * logo = [UIImage imageNamed:@"ITC-logo-high.png"];
    
    [imageView setImage:logo];
    
    self.navigationItem.titleView = imageView;
    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
    
    
    // setting butoons images
    menuButton.image =  [[UIImage imageNamed:@"menu-30.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    nextButton.image = [[UIImage imageNamed:@"right-30.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    backButton.image = [[UIImage imageNamed:@"left-30.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    menuButton.target = self.revealViewController;
    menuButton.action = @selector(revealToggle:);
    
    
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//- (void) viewDidLayoutSubviews {
//    [self.scrollView setContentSize:CGSizeMake(375,661)];}




// BackButton and transition to the previous Scene
- (IBAction)backButtonTapped:(id)sender {
    CATransition* transition = [CATransition animation];
    transition.duration = .45;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    transition.type = kCATransitionFade;
    [self.navigationController.view.layer addAnimation:transition forKey:kCATransition];
    
    
    ViewControllerThree *nextVC =[self.storyboard instantiateViewControllerWithIdentifier:@"VC3"];
    [self.navigationController pushViewController:nextVC animated:NO];
}


// NextButton and transition to the next Scene
- (IBAction)nextButtonTapped:(id)sender {
    
    CATransition* transition = [CATransition animation];
    transition.duration = .45;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    transition.type = kCATransitionFade;
    [self.navigationController.view.layer addAnimation:transition forKey:kCATransition];
    
    ViewController *nextViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"VC1"];
    [self.navigationController pushViewController:nextViewController animated:NO];
    
    
}



- (IBAction)unwindToViewControllerFour:(UIStoryboardSegue *)unwindSegue
{
    
    UIViewController* sourceViewController = unwindSegue.sourceViewController;
    
}

- (IBAction)readStoryOne:(id)sender {
    
    CATransition* transition = [CATransition animation];
    transition.duration = .30;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    transition.type = kCATransitionFromLeft;
    [self.navigationController.view.layer addAnimation:transition forKey:kCATransition];
    
    PageFour *nextViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"Page4"];
    [nextViewController.segmentedHeader setSelectedSegmentIndex:0];
    [self.navigationController pushViewController:nextViewController animated:NO];
    
}

- (IBAction)readStoryTwo:(id)sender {
    
    CATransition* transition = [CATransition animation];
    transition.duration = .30;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    transition.type = kCATransitionFromLeft;//kCATransitionFade;
    [self.navigationController.view.layer addAnimation:transition forKey:kCATransition];
    
    PageFour *nextViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"Page4"];
    [nextViewController.segmentedHeader setSelectedSegmentIndex:1];
    [self.navigationController pushViewController:nextViewController animated:NO];
    
}



//
//-(void) viewDidAppear{
//   //[self.scrollView setScrollEnabled:YES];
//}
//
//-(void) viewWillAppear:(BOOL)animated{
//
//    [self.scrollView setScrollEnabled:YES];
//    [self.scrollView setContentSize:CGSizeMake(375,661)];
//
//
//}
//
//-(void) viewDidAppear:(BOOL)animated{
//    [super viewDidAppear:animated];
//    [self.scrollView setScrollEnabled:YES];
//    [self.scrollView setContentSize:CGSizeMake(375,661)];
//}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
