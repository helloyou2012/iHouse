//
//  TransportController.h
//  iHouse
//
//  Created by HelloYou on 8/1/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface TransportController : UIViewController<MKMapViewDelegate>
@property (nonatomic,strong) IBOutlet UIWebView *backView;
@property (nonatomic,strong) IBOutlet UIView *frontView;
@property (nonatomic,strong)IBOutlet MKMapView *mapView;
@property (nonatomic,strong)IBOutlet UITextView *textView;

- (void)gotoLocation;
- (IBAction)backToMain:(id)sender;
- (IBAction)flipSegment:(id)sender;
- (void)performTransition:(UIViewAnimationOptions)options;
@end
