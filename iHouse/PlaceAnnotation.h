//
//  PlaceAnnotation.h
//  iHouse
//
//  Created by HelloYou on 8/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface PlaceAnnotation : NSObject<MKAnnotation>
@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;
@property (nonatomic, readonly, copy) NSString *title;

- (id)initWithCoordinate:(CLLocationCoordinate2D)coordinate withTitle:(NSString*)title;
@end
