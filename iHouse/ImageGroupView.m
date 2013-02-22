//
//  ImageGroupView.m
//  iHouse
//
//  Created by HelloYou on 8/1/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ImageGroupView.h"

@implementation ImageGroupView

@synthesize delegate=_delegate;
@synthesize button=_button;
@synthesize index=_index;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (id)initWithObject:(NSDictionary*)dict atIndex:(NSInteger)index
{
    self = [super init];
    if (self) {
        _index=index;
        [self setBackgroundColor:[UIColor clearColor]];
        
        CGRect rect=CGRectMake(0, 0, 133, 100);
        _button=[[UIButton alloc] initWithFrame:rect];
        [_button setImage:[UIImage imageNamed:[dict valueForKey:@"imageKey"]] forState:UIControlStateNormal];
        [_button addTarget:self action:@selector(viewClicked:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_button];
        
        UILabel *label=[[UILabel alloc] initWithFrame:CGRectMake(10, 6, 113, 20)];
        [label setBackgroundColor:[UIColor colorWithRed:1.0 green:0.5 blue:0 alpha:0.7]];
        [label setTextColor:[UIColor whiteColor]];
        [label setFont:[UIFont systemFontOfSize:14]];
        [label setText:[dict valueForKey:@"nameKey"]];
        [label setTextAlignment:UITextAlignmentCenter];
        [self addSubview:label];
    }
    return self;
}

- (IBAction)viewClicked:(id)sender
{
    [_delegate groupClicked:_index];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
