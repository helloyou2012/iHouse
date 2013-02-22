//
//  ImageGroupCell.m
//  iHouse
//
//  Created by HelloYou on 8/1/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ImageGroupCell.h"

@implementation ImageGroupCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        [self setBackgroundColor:[UIColor clearColor]];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+ (NSInteger) numberOfPlaceHolders
{
    return 2;
}

- (void) addGroupView:(UIView *)groupView atIndex:(NSInteger)index;
{
    if (index == 0)
    {
        for (UIView *view in [[self contentView] subviews])
        {
            [view removeFromSuperview];
        }
    }
    
    if (index < [ImageGroupCell numberOfPlaceHolders])
    {
        CGFloat x = index *133 + (index + 1) *18;
        CGFloat y = 10;
        CGFloat width = 133;
        CGFloat height = 100;
        
        [groupView setFrame:CGRectMake(x, y, width, height)];
        
        [self.contentView addSubview:groupView];
    }
}

@end
