//
//  NavigationViewController.m
//  ITC Impact Stories
//
//  Created by Tarek Benoudina on 24/06/16.
//  Copyright © 2016 ITC/United Nations. All rights reserved.
//

#import "NavigationViewController.h"
#import "SWRevealViewController.h"
#import "MenuCell.h"

@interface NavigationViewController ()

@end

@implementation NavigationViewController{
    NSArray *menu;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
     menu = @[@"cell_0", @"cell_1", @"cell_2",@"cell_3",@"cell_4",@"cell_5",@"cell_6",@"settings"];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
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
    MenuCell *cell =  [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    if ([cellIdentifier isEqualToString:@"cell_0"]) {
        
    
        cell.menuTitle.text = @"Foreword";
    }else if ([cellIdentifier isEqualToString:@"cell_1"]){
        
    cell.menuTitle.text = @"Providing Trade and Market Intelligence";
    
    
    }else if ([cellIdentifier isEqualToString:@"cell_2"]){
    
        cell.menuTitle.text = @"Building a Conducive Business Environment";
        
    }else if ([cellIdentifier isEqualToString:@"cell_3"]){
    cell.menuTitle.text = @"Strengthening Trade and Investment Support Institutions";
    
    
    }else if ([cellIdentifier isEqualToString:@"cell_4"]){
    
    cell.menuTitle.text = @"Connecting to International Values Chains";
    
    }else if ([cellIdentifier isEqualToString:@"cell_5"]){
    cell.menuTitle.text = @"Promoting and Mainstreaming Inclusive and Green Trade";
    
    }else if ([cellIdentifier isEqualToString:@"cell_6"]){
    cell.menuTitle.text = @"Supporting Regional Economic Integration and South-South links";
    
    
    }else if ([cellIdentifier isEqualToString:@"setting"]){
        cell.menuTitle.text = @"Settings";
        
    }
    
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return 80;
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {

    
    if ( [segue isKindOfClass: [SWRevealViewControllerSegue class]] ) {
        SWRevealViewControllerSegue *swSegue = (SWRevealViewControllerSegue*) segue;
        
        swSegue.performBlock = ^(SWRevealViewControllerSegue* rvc_segue, UIViewController* svc, UIViewController* dvc) {
            
            UINavigationController* navController = (UINavigationController*)self.revealViewController.frontViewController;
            [navController setViewControllers: @[dvc] animated: NO ];
            [self.revealViewController setFrontViewPosition: FrontViewPositionLeft animated: YES];
        };
        
    }

    
}


@end
