//
//  ClubTableViewCell.m
//  TkuGroup
//
//  Created by Shuo on 8/15/14.
//  Copyright (c) 2014 Shuo. All rights reserved.
//

#import "ClubTableViewCell.h"

@implementation ClubTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
