//
//  HukusyuTableViewCell.m
//  sokusyu-eitango
//
//  Created by Teru on 2014/05/19.
//  Copyright (c) 2014年 Self. All rights reserved.
//

#import "HukusyuTableViewCell.h"

@implementation HukusyuTableViewCell

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
