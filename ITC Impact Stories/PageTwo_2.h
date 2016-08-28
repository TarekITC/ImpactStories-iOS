//
//  PageTwo_2.h
//  ITC Impact Stories
//
//  Created by Tarek Benoudina on 29/08/16.
//  Copyright © 2016 ITC/United Nations. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PageTwo_2 : UIViewController <UIGestureRecognizerDelegate>
@property (weak, nonatomic) IBOutlet UIBarButtonItem *menuButton;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *backButton;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *nextButton;
@property (weak, nonatomic) IBOutlet UIWebView *webContent;





- (void) swipeToRight:(UISwipeGestureRecognizer*) recogniser ;
- (void) swipeToLeft:(UISwipeGestureRecognizer*) recogniser ;

@end
