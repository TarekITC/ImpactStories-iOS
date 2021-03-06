//
//  CaseTableViewController_5.m
//  ITC Impact Stories
//
//  Created by Tarek Benoudina on 29/08/16.
//  Copyright © 2016 ITC/United Nations. All rights reserved.
//

#import "CaseTableViewController_5.h"


#import "CaseTableViewController_4.h"
#import "SWRevealViewController.h"
#import "CaseTableViewController_6.h"
#import "StoryCell.h"

@interface CaseTableViewController_5()


{
    NSArray *menu;
}

@end

@implementation CaseTableViewController_5

@synthesize headerLabel,headerView;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    menu = @[@"cell", @"cell_2", @"cell_3", @"cell_4"];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    
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
    
    CGRect newFrame = self.headerView.frame;
    
    newFrame.size.height = 180;
    
    [self.headerView setFrame:newFrame];
    
    self.headerLabel.text = @"Promoting and mainstreaming inclusive and green trade";
    
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    
    //self.tableView.separatorColor = [UIColor clearColor];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [menu count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    NSString *cellIdentifier = [menu objectAtIndex:indexPath.row];
    //UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    
    
    StoryCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    
    if ([cellIdentifier isEqualToString:@"cell"]) {
        
        NSLog(@"Cell 1 / case 5 ");
        
        cell.storyTitle.text = @"Ethical Fashion";
        cell.storyDescription.text = @"Perfect fit - tailor from Nairobi slum finds stable work, better pay";
        cell.storyThumbnail.image = [UIImage imageNamed:@"Ethical_Fashion/Ethical_Fashion1.jpeg"];
        
    } else if ([cellIdentifier isEqualToString:@"cell_2"]) {
        
        NSLog(@"Cell 2 / case 5");
        
        cell.storyTitle.text = @"Peru";
        cell.storyDescription.text = @"US safety certificate could quintuple Peru's exports of indigenous food product";
        cell.storyThumbnail.image = [UIImage imageNamed:@"Peru/Peru1.jpeg"];
        
        
    } else if ([cellIdentifier isEqualToString:@"cell_3"]) {
        
        NSLog(@"Cell 3 / case 5");
        
        cell.storyTitle.text = @"Papua New Guinea";
        cell.storyDescription.text = @"Success in a cup: first woman coffee exporter in PNG secures premium price from major international buyer";
        cell.storyThumbnail.image = [UIImage imageNamed:@"Papua_New_Guinea/Papua_New_Guinea1.jpeg"];
        
        
    } else if ([cellIdentifier isEqualToString:@"cell_4"]) {
        
        NSLog(@"Cell 4 / case 5");
        
        cell.storyTitle.text = @"Kenya";
        cell.storyDescription.text = @"Hot tea: Kenya's tea sector adapts to climate change";
        cell.storyThumbnail.image = [UIImage imageNamed:@"Kenya/Kenya1.jpeg"];
        
        
    }
    
    
    
    return cell;
}


// setting the height of the cell
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 160;
}



// BackButton and transition to the previous Scene
- (IBAction)backButtonTapped:(id)sender {
    CATransition* transition = [CATransition animation];
    transition.duration = .45;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    transition.type = kCATransitionFade;
    [self.navigationController.view.layer addAnimation:transition forKey:kCATransition];
    
    
    CaseTableViewController_4 *nextVC =[self.storyboard instantiateViewControllerWithIdentifier:@"CVT4"];
    [self.navigationController pushViewController:nextVC animated:NO];
}


// NextButton and transition to the next Scene
- (IBAction)nextButtonTapped:(id)sender {
    
    CATransition* transition = [CATransition animation];
    transition.duration = .45;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    transition.type = kCATransitionFade;
    [self.navigationController.view.layer addAnimation:transition forKey:kCATransition];
    
    CaseTableViewController_6 *nextViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"CVT6"];
    [self.navigationController pushViewController:nextViewController animated:NO];
    
    
}


/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 } else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
