//
//  ImageController.m
//  iHouse
//
//  Created by HelloYou on 7/31/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ImageController.h"
#import "ImageGroupView.h"

@implementation ImageController

@synthesize contentList=_contentList;
@synthesize tableView=_tableView;
@synthesize curPhotosList=_curPhotosList;

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
    NSString *path = [[NSBundle mainBundle] pathForResource:@"image_Groups" ofType:@"plist"];
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

- (IBAction)backToMain:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)groupClicked:(NSInteger)index
{
    NSDictionary *curItem = [_contentList objectAtIndex:index];
    NSString *path = [[NSBundle mainBundle] pathForResource:[curItem valueForKey:@"fileKey"] ofType:@"plist"];
    _curPhotosList =[NSArray arrayWithContentsOfFile:path];
    MWPhotoBrowser *browser = [[MWPhotoBrowser alloc] initWithDelegate:self];
    
    UINavigationController *nc = [[UINavigationController alloc] initWithRootViewController:browser];
    nc.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentModalViewController:nc animated:YES];
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
	return ceil(_contentList.count/2.0f);
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath 
{
    static NSString *CellIdentifier = @"ImageGroupCell";
    
    ImageGroupCell *cell = (ImageGroupCell *)[tableView 
                                        dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) 
    {
        cell = [[ImageGroupCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    }
    
    NSInteger numberOfLine = [ImageGroupCell numberOfPlaceHolders];
    
    // we can only add max numberOfLine
    // at a time in each cell
    // e.g. numberOfLine = 3
    // thumbnail index in the scribble manager is (row index *3) +0, +1, +2
    NSUInteger rowIndex = [indexPath row];
    NSInteger thumbnailIndex = rowIndex *numberOfLine;
    NSInteger numberOfGroups = _contentList.count;
    for (NSInteger i = 0; i < numberOfLine && (thumbnailIndex + i) < numberOfGroups; ++i)
    {
        NSDictionary *numberItem = [_contentList objectAtIndex:thumbnailIndex+i];
        ImageGroupView *groupView=[[ImageGroupView alloc] initWithObject:numberItem atIndex:thumbnailIndex+i];
        groupView.delegate=self;
        [cell addGroupView:groupView atIndex:i];
    }
    return cell;
}

#pragma mark -
#pragma mark Table view delegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 110;
}

#pragma mark - MWPhotoBrowserDelegate

- (NSUInteger)numberOfPhotosInPhotoBrowser:(MWPhotoBrowser *)photoBrowser {
    return _curPhotosList.count;
}

- (MWPhoto *)photoBrowser:(MWPhotoBrowser *)photoBrowser photoAtIndex:(NSUInteger)index {
    if (index < _curPhotosList.count)
    {
        NSDictionary *numberItem = [_curPhotosList objectAtIndex:index];
        MWPhoto *photo = [MWPhoto photoWithFilePath:[numberItem valueForKey:@"imageKey"]];
        photo.caption = [numberItem valueForKey:@"nameKey"];
        return photo;
    }
    return nil;
}

@end
