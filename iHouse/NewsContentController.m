//
//  NewsContentController.m
//  iHouse
//
//  Created by HelloYou on 8/6/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "NewsContentController.h"

@implementation NewsContentController

@synthesize contentUrl=_contentUrl;
@synthesize webView=_webView;

#pragma mark - View lifecycle

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    // load up the info text
    NSString *infoSouceFile = [[NSBundle mainBundle] pathForResource:_contentUrl ofType:@"html"];
	NSString *infoText = [NSString stringWithContentsOfFile:infoSouceFile encoding:NSUTF8StringEncoding error:nil];
    [_webView loadHTMLString:infoText baseURL:nil];
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

- (IBAction)backToMain:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
