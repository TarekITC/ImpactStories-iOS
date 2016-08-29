//
//  CaseTableViewController_2.m
//  ITC Impact Stories
//
//  Created by Tarek Benoudina on 29/08/16.
//  Copyright © 2016 ITC/United Nations. All rights reserved.
//

#import "CaseTableViewController_2.h"
#import "SWRevealViewController.h"
#import "CaseTableViewController_1.h"
#import "CaseTableViewController_3.h"
#import "StoryCell.h"

@interface CaseTableViewController_2 ()

    
    {
        NSArray *menu;
    }

@end

@implementation CaseTableViewController_2

@synthesize headerLabel,headerView;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    menu = @[@"cell", @"cell_2"];
    
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
    
    self.headerLabel.text = @"Supporting regional economic integration and South-South trade";
    
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
        
        NSLog(@"Cell 1 / case 2 ");
        
        cell.storyTitle.text = @"Egypt";
        cell.storyDescription.text = @"Say cheese: Halal certification helps Egyptian dairy quadruple sales to Malaysia, find new markets";
        cell.storyThumbnail.image = [UIImage imageNamed:@"Egypt/Egypt1.png"];
        
    } else if ([cellIdentifier isEqualToString:@"cell_2"]) {
        
        NSLog(@"Cell 2 / case 2");
        
        cell.storyTitle.text = @"Mekong region";
        cell.storyDescription.text = @"Linking Central and Western Africa to the Mekong's francophone countries";
        cell.storyThumbnail.image = [UIImage imageNamed:@"Mekong_region/Mekong_region1.jpeg"];
        
        
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
    
    
    CaseTableViewController_1 *nextVC =[self.storyboard instantiateViewControllerWithIdentifier:@"CVT1"];
    [self.navigationController pushViewController:nextVC animated:NO];
}


// NextButton and transition to the next Scene
- (IBAction)nextButtonTapped:(id)sender {
    
    CATransition* transition = [CATransition animation];
    transition.duration = .45;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    transition.type = kCATransitionFade;
    [self.navigationController.view.layer addAnimation:transition forKey:kCATransition];
    
    CaseTableViewController_3 *nextViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"CVT3"];
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
