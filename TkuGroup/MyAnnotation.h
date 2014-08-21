//
//  MyAnnotation.h
//  Walk in Taipei
//
//  Created by Shuo on 2/8/14.
//  Copyright (c) 2014 Shuo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface MyAnnotation : NSObject <MKAnnotation>
{
    CLLocationCoordinate2D coordinate;
    NSString *title;
    NSString *subtitle;
}

-(id)initWithCoordinate:(CLLocationCoordinate2D) pCoordinate
                  Title:(NSString*) pTitle
            Andsubtitle:(NSString*) pSubtitle;

@property (nonatomic ,readonly) CLLocationCoordinate2D coordinate;
@property (nonatomic ,readonly, copy) NSString *title;
@property (nonatomic ,readonly, copy) NSString *subtitle;
@property (nonatomic)UIImage *image;
@end
