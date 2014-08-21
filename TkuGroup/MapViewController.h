//
//  MapViewController.h
//  TkuGroup
//
//  Created by Shuo on 7/25/14.
//  Copyright (c) 2014 Shuo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyAnnotation.h"

@interface MapViewController : UIViewController
<MKMapViewDelegate,CLLocationManagerDelegate,MKAnnotation> {
    
    IBOutlet UIButton *setMapRegionBtn;
    IBOutlet UIButton *searchBtn;
    IBOutlet MKMapView *map_view;
    }

-(void) locateMap;

@property (strong, nonatomic) IBOutlet MKMapView *map_view;
@property (nonatomic )double nLat;
@property (nonatomic )double nLng;

@end

