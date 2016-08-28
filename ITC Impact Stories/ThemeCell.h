//
//  ThemeCell.h
//  ITC Impact Stories
//
//  Created by Tarek Benoudina on 23/08/16.
//  Copyright © 2016 ITC/United Nations. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ThemeCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *themeCellImage;

@property (weak, nonatomic) IBOutlet UILabel *themeCellTitle;
@property (weak, nonatomic) IBOutlet UILabel *themeCellSubTitle;

@end
