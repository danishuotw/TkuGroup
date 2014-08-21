//
//  MyAnnotation.m
//  Walk in Taipei
//
//  Created by Shuo on 2/8/14.
//  Copyright (c) 2014 Shuo. All rights reserved.
//

#import "MyAnnotation.h"

@implementation MyAnnotation
@synthesize coordinate;
@synthesize title;
@synthesize subtitle;

-(id)initWithCoordinate:(CLLocationCoordinate2D)pCoordinate
                  Title:(NSString *)pTitle
            Andsubtitle:(NSString *)pSubtitle{

    self = [super init];
    
    if (self) {
        coordinate = pCoordinate;
        title = pTitle;
        subtitle = pSubtitle;
    }
    return self;
}
@end
