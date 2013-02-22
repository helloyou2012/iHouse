//
//  PreviewController.h
//  iHouse
//
//  Created by HelloYou on 7/31/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PreviewController : UIViewController<UIScrollViewDelegate>
{
    // To be used when scrolls originate from the UIPageControl
    BOOL pageControlUsed;
}

@property (nonatomic, strong) IBOutlet UIScrollView *scrollView;
@property (nonatomic, strong) IBOutlet UIPageControl *pageControl;
@property (nonatomic, strong) NSMutableArray *imageViews;
@property (nonatomic, strong) NSArray *contentList;

- (void)loadScrollViewWithPage:(int)page;
@end
