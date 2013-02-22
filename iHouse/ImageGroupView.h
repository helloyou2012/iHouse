//
//  ImageGroupView.h
//  iHouse
//
//  Created by HelloYou on 8/1/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ImageGroupDelegate.h"

@interface ImageGroupView : UIView
@property (nonatomic,strong) id<ImageGroupDelegate> delegate;
@property (nonatomic,assign) NSInteger index;
@property (nonatomic,strong) UIButton *button;

- (IBAction)viewClicked:(id)sender;
- (id)initWithObject:(NSDictionary*)dict atIndex:(NSInteger)index;
@end
