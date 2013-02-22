//
//  MainViewController.m
//  iHouse
//
//  Created by HelloYou on 7/31/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "MainViewController.h"

@implementation MainViewController


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

- (IBAction)handleSwipeFrom:(UISwipeGestureRecognizer *)recognizer
{
    [self performSegueWithIdentifier:@"goToPreview" sender:self];
}

-(IBAction)showActionSheet:(id)sender
{
	UIActionSheet *popupQuery = [[UIActionSheet alloc] initWithTitle:@"联系方式" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"售楼热线:0411-87906666",@"售楼热线:0411-87906688",@"访问官方网站", nil];
	[popupQuery showInView:self.view];
}

-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    switch (buttonIndex) {
        case 0:
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"tel://041187906666"]];
            //[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"telprompt://4008882200"]];
            break;
        case 1:
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"tel://041187906688"]];
            //[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"telprompt://4008882200"]];
            break;
        case 2:
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.dlln.sdln.sgcc.com.cn/main.htm"]];
            break;
        default:
            break;
    }
}

@end
