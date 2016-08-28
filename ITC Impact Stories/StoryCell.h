//
//  StoryCell.h
//  ITC Impact Stories
//
//  Created by Tarek Benoudina on 29/08/16.
//  Copyright © 2016 ITC/United Nations. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StoryCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *storyTitle;
@property (weak, nonatomic) IBOutlet UILabel *storyDescription;
@property (weak, nonatomic) IBOutlet UIImageView *storyThumbnail;

@end
