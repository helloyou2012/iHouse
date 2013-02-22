//
//  TransportController.m
//  iHouse
//
//  Created by HelloYou on 8/1/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "TransportController.h"
#import "PlaceAnnotation.h"

@implementation TransportController

@synthesize frontView=_frontView;
@synthesize backView=_backView;
@synthesize mapView=_mapView;
@synthesize textView=_textView;

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
    _textView.text=[NSString stringWithString:@"1、周边公交线路有：轻轨3号线，从火车站乘坐轻轨3号线在金石滩车站下车-55分钟\n\n2、周边驾车线路有：从中山区驾车经跨海大桥至金石滩-20分钟\n"];
    [self gotoLocation];
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

- (void)gotoLocation
{
    double latitude=39.078657;
    double longitude=121.986522;
    
    PlaceAnnotation *annotation=[[PlaceAnnotation alloc] initWithCoordinate:CLLocationCoordinate2DMake(latitude, longitude) withTitle:@"东方·优山美地"];
    [_mapView removeAnnotations:_mapView.annotations];
    [_mapView addAnnotation:annotation];
    // start off by default
    MKCoordinateRegion newRegion;
    newRegion.center.latitude = latitude;
    newRegion.center.longitude = longitude;
    newRegion.span.latitudeDelta = .005;
    newRegion.span.longitudeDelta = .005;
    
    [self.mapView setRegion:newRegion animated:YES];
}

- (IBAction)flipSegment:(id)sender
{
    UISegmentedControl* control = (UISegmentedControl*)sender;
    switch (control.selectedSegmentIndex) {
        case 0:
            [self performTransition:UIViewAnimationOptionTransitionFlipFromRight];
            break;  
        case 1:
            [self performTransition:UIViewAnimationOptionTransitionFlipFromLeft];
            break;
        default:  
            break;
    }
}

- (void)performTransition:(UIViewAnimationOptions)options
{
    UIView *fromView, *toView;
    
    if ([self.frontView superview] != nil)
    {
        fromView = self.frontView;
        toView = self.backView;
        // load up the info text
        NSString *infoSouceFile = [[NSBundle mainBundle] pathForResource:@"trans" ofType:@"html"];
        NSString *infoText = [NSString stringWithContentsOfFile:infoSouceFile encoding:NSUTF8StringEncoding error:nil];
        [_backView loadHTMLString:infoText baseURL:nil];
    }
    else
    {
        fromView = self.backView;
        toView = self.frontView;
    }
    
    [UIView transitionFromView:fromView
                        toView:toView
                      duration:1.0
                       options:options
                    completion:^(BOOL finished) {
                        // animation completed
                    }];
}

- (IBAction)backToMain:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation
{
    MKPinAnnotationView *pinView = nil;
    
    NSString *defaultPinID = [NSString stringWithString:@"Annotation"];
    pinView = (MKPinAnnotationView *)[_mapView dequeueReusableAnnotationViewWithIdentifier:defaultPinID];
    if ( pinView == nil ){
        pinView = [[MKPinAnnotationView alloc]
                   initWithAnnotation:annotation reuseIdentifier:defaultPinID];
    }
    pinView.pinColor = MKPinAnnotationColorGreen;
    pinView.canShowCallout = YES;
    pinView.animatesDrop = NO;
    
    return pinView;
}

@end
