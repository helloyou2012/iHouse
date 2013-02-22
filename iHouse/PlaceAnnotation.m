//
//  PlaceAnnotation.m
//  iHouse
//
//  Created by HelloYou on 8/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "PlaceAnnotation.h"


@implementation PlaceAnnotation
@synthesize title=_title;
@synthesize coordinate=_coordinate;

- (id)initWithCoordinate:(CLLocationCoordinate2D)coordinate withTitle:(NSString*)title
{
    self = [super init];
    if (self) {
        _coordinate=coordinate;
        _title=title;
    }
    return self;
}

- (CLLocationCoordinate2D)coordinate;
{
    return _coordinate;
}

// required if you set the MKPinAnnotationView's "canShowCallout" property to YES
- (NSString *)title
{
    return _title;
}

// optional
- (NSString *)subtitle
{
    return @"售楼处热线:400-888-2200转17615";
}
@end