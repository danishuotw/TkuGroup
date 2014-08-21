//
//  ClubSubTableViewCell.h
//  TkuGroup
//
//  Created by Shuo on 8/15/14.
//  Copyright (c) 2014 Shuo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ClubSubTableViewCell : UITableViewCell

@property(nonatomic, weak)IBOutlet UILabel *Title;
@property(nonatomic, weak)IBOutlet UILabel *SubTitle;
@property(nonatomic, weak)IBOutlet UIImageView *ClubImage;

@end
