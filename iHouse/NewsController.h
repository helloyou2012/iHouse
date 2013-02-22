//
//  NewsController.h
//  iHouse
//
//  Created by HelloYou on 8/1/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewsController : UIViewController<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) NSArray *contentList;

- (IBAction)backToMain:(id)sender;
@end
