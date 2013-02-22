//
//  NewsContentController.h
//  iHouse
//
//  Created by HelloYou on 8/6/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewsContentController : UIViewController
@property (nonatomic, strong) NSString *contentUrl;
@property (nonatomic,strong)IBOutlet UIWebView *webView;

- (IBAction)backToMain:(id)sender;
@end
