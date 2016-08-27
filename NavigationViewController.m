//
//  NavigationViewController.m
//  ITC Impact Stories
//
//  Created by Tarek Benoudina on 24/06/16.
//  Copyright © 2016 ITC/United Nations. All rights reserved.
//

#import "NavigationViewController.h"
#import "SWRevealViewController.h"

@interface NavigationViewController ()

@end

@implementation NavigationViewController{
    NSArray *menu;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
     menu = @[@"first", @"second", @"third",@"four",@"five",@"six",@"seven",@"eight",@"story9",@"story10",@"story11",@"story12",@"story13",@"story14",@"story15",@"story16",@"story17",@"story18",@"story19",@"story20",@"story21",@"story22",@"story23",@"story24",@"story25",@"story26"];
    
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
     UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    
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
