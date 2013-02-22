//
//  ImageController.h
//  iHouse
//
//  Created by HelloYou on 7/31/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ImageGroupCell.h"
#import "ImageGroupDelegate.h"
#import "MWPhotoBrowser.h"

@interface ImageController : UIViewController<UITableViewDelegate,UITableViewDataSource,ImageGroupDelegate,MWPhotoBrowserDelegate>
@property (nonatomic, strong) NSArray *contentList;
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray *curPhotosList;


- (IBAction)backToMain:(id)sender;
@end
