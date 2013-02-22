//
//  PreviewController.m
//  iHouse
//
//  Created by HelloYou on 7/31/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "PreviewController.h"

static NSString *ImageKey = @"imageKey";

@implementation PreviewController

@synthesize scrollView=_scrollView;
@synthesize pageControl=_pageControl;
@synthesize contentList=_contentList;
@synthesize imageViews=_imageViews;

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    // load our data from a plist file inside our app bundle
    NSString *path = [[NSBundle mainBundle] pathForResource:@"preview_Images" ofType:@"plist"];
    _contentList =[NSArray arrayWithContentsOfFile:path];
    
    
    // imageViews are created lazily
    // in the meantime, load the array with placeholders which will be replaced on demand
    _imageViews=[[NSMutableArray alloc] init];
    for (unsigned i = 0; i < _contentList.count; i++)
    {
		[_imageViews addObject:[NSNull null]];
    }
    
    // a page is the width of the scroll view
    _scrollView.pagingEnabled = YES;
    _scrollView.contentSize = CGSizeMake(_scrollView.frame.size.width * _contentList.count, _scrollView.frame.size.height);
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.showsVerticalScrollIndicator = NO;
    _scrollView.scrollsToTop = NO;
    _scrollView.delegate = self;
    
    _pageControl.numberOfPages = _contentList.count;
    _pageControl.currentPage = 0;
    // pages are created on demand
    // load the visible page
    // load the page on either side to avoid flashes when the user starts scrolling
    [self loadScrollViewWithPage:0];
    [self loadScrollViewWithPage:1];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - ImagePageController method

- (void)loadScrollViewWithPage:(int)page
{
    if (page < 0)
        return;
    if (page >= _contentList.count)
        return;
    
    // replace the placeholder if necessary
    UIImageView *imageView = [_imageViews objectAtIndex:page];
    if ((NSNull *)imageView == [NSNull null])
    {
        CGRect frame = _scrollView.frame;
        frame.origin.x = frame.size.width * page;
        frame.origin.y = 0;
        imageView=[[UIImageView alloc] initWithFrame:frame];
        NSDictionary *numberItem = [_contentList objectAtIndex:page];
        [imageView setImage:[UIImage imageNamed:[numberItem valueForKey:ImageKey]]];
        [_imageViews replaceObjectAtIndex:page withObject:imageView];
    }
    
    // add the controller's view to the scroll view
    if (imageView.superview==nil) {
        [_scrollView addSubview:imageView];
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)sender
{
    if (pageControlUsed)
    {
        // do nothing - the scroll was initiated from the page control, not the user dragging
        return;
    }
	
    // Switch the indicator when more than 50% of the previous/next page is visible
    CGFloat pageWidth = _scrollView.frame.size.width;
    int page = floor((_scrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
    if (_scrollView.contentOffset.x+pageWidth>_scrollView.contentSize.width+20) {
        [self performSegueWithIdentifier:@"goToMainView" sender:self];
    }
    _pageControl.currentPage = page;
    
    // load the visible page and the page on either side of it (to avoid flashes when the user starts scrolling)
    [self loadScrollViewWithPage:page - 1];
    [self loadScrollViewWithPage:page];
    [self loadScrollViewWithPage:page + 1];
    
    // A possible optimization would be to unload the views+controllers which are no longer visible
}

// At the begin of scroll dragging, reset the boolean used when scrolls originate from the UIPageControl
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    pageControlUsed = NO;
}

// At the end of scroll animation, reset the boolean used when scrolls originate from the UIPageControl
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    pageControlUsed = NO;
}

- (IBAction)changePage:(id)sender
{
    int page = _pageControl.currentPage;
	
    // load the visible page and the page on either side of it (to avoid flashes when the user starts scrolling)
    [self loadScrollViewWithPage:page - 1];
    [self loadScrollViewWithPage:page];
    [self loadScrollViewWithPage:page + 1];
    
	// update the scroll view to the appropriate page
    CGRect frame = _scrollView.frame;
    frame.origin.x = frame.size.width * page;
    frame.origin.y = 0;
    [_scrollView scrollRectToVisible:frame animated:YES];
    pageControlUsed = YES;
}

@end
