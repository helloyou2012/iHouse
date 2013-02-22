//
//  NewsController.m
//  iHouse
//
//  Created by HelloYou on 8/1/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "NewsController.h"
#import "NewsContentController.h"

@implementation NewsController

@synthesize contentList=_contentList;

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
    NSString *path = [[NSBundle mainBundle] pathForResource:@"news_List" ofType:@"plist"];
    _contentList =[NSArray arrayWithContentsOfFile:path];
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

#pragma mark -
#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView 
{
    // Return the number of sections.
	return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section 
{
	return _contentList.count;
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath 
{
    static NSString *CellIdentifier = @"NewsCell";
    
    UITableViewCell *cell = (UITableViewCell *)[tableView 
                                              dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    }
    UILabel *titleLabel=[[UILabel alloc] initWithFrame:CGRectMake(10, 10, 280, 28)];
    NSDictionary *numberItem = [_contentList objectAtIndex:[indexPath row]];
    titleLabel.text=[numberItem valueForKey:@"titleKey"];
    [cell addSubview:titleLabel];
    return cell;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *numberItem = [_contentList objectAtIndex:[indexPath row]];
    NewsContentController *detail = [self.storyboard instantiateViewControllerWithIdentifier:@"NewsContentController"];
    detail.contentUrl=[numberItem valueForKey:@"urlKey"];
    [self.navigationController pushViewController:detail animated:YES];
}

#pragma mark -
#pragma mark Table view delegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}

- (IBAction)backToMain:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
