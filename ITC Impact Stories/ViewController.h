//
//  ViewController.h
//  ITC Impact Stories
//
//  Created by Tarek Benoudina on 24/06/16.
//  Copyright © 2016 ITC/United Nations. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak,nonatomic) IBOutlet UIBarButtonItem *menuButton;

@property (weak, nonatomic) IBOutlet UIBarButtonItem *nextButton;

@property (weak, nonatomic) IBOutlet UIBarButtonItem *backButton;

@property (strong, nonatomic) IBOutlet UIWebView *webContent;


@end

