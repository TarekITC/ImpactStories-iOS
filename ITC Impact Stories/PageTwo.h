//
//  PageTwo.h
//  ITC Impact Stories
//
//  Created by Tarek Benoudina on 26/06/16.
//  Copyright © 2016 ITC/United Nations. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PageTwo : UIViewController
@property (weak, nonatomic) IBOutlet UIBarButtonItem *menuButton;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *backButton;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *nextButton;
@property (weak, nonatomic) IBOutlet UIWebView *webContent;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedHeader;

@end
