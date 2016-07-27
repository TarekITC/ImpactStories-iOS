//
//  PageThree.m
//  ITC Impact Stories
//
//  Created by Tarek Benoudina on 27/06/16.
//  Copyright © 2016 ITC/United Nations. All rights reserved.
//

#import "PageThree.h"
#import "SWRevealViewController.h"
#import "ViewControllerTwo.h"
#import "ViewControllerThree.h"
#import "ViewController.h"
#import "ViewControllerFour.h"


@interface PageThree ()

@end

@implementation PageThree



- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Setting the image title in the navigation bar
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 100.0f, 40.0f)];
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    
    UIImage * logo = [UIImage imageNamed:@"5912.png"];
    
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
    NSString * path = [[NSBundle mainBundle] pathForResource:@"2-Egypt" ofType:@"html"];
    NSURL * url = [NSURL fileURLWithPath:path];
    NSMutableURLRequest * urlRequest = [NSMutableURLRequest requestWithURL:url];
    [self.webContent loadRequest:urlRequest];
    
    
    // setting target and action for the segmented header
    
    [self.segmentedHeader addTarget:self action:@selector(segmentedControlTapped:) forControlEvents:UIControlEventValueChanged];
    
    
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
    
    
    ViewController *nextVC =[self.storyboard instantiateViewControllerWithIdentifier:@"VC2"];
    [self.navigationController pushViewController:nextVC animated:NO];
}


// NextButton and transition to the next Scene
- (IBAction)nextButtonTapped:(id)sender {
    
    CATransition* transition = [CATransition animation];
    transition.duration = .45;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    transition.type = kCATransitionFade;
    [self.navigationController.view.layer addAnimation:transition forKey:kCATransition];
    
    ViewControllerFour *nextViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"VC4"];
    [self.navigationController pushViewController:nextViewController animated:NO];
    
    
}




// SegmentControl method
- (void) segmentedControlTapped:(UISegmentedControl *)paramSender{
    
    switch (paramSender.selectedSegmentIndex) {
        case 0:
        {
            NSLog(@"left pressed");
            NSString *path = [[NSBundle mainBundle] pathForResource:@"2-Egypt" ofType:@"html" ];
            NSURL *url = [NSURL fileURLWithPath:path];
            NSMutableURLRequest *urlRequest = [NSMutableURLRequest requestWithURL:url];
            [self.webContent loadRequest:urlRequest];
        }
            break;
            
        case 1:
        {
            NSLog(@"Right pressed");
            NSString *path = [[NSBundle mainBundle] pathForResource:@"2-Mekong-region" ofType:@"html"];
            NSURL *url = [NSURL fileURLWithPath:path];
            NSMutableURLRequest *urlRequest = [NSMutableURLRequest requestWithURL:url];
            [self.webContent loadRequest:urlRequest];
        }
            break;
    }
    
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
