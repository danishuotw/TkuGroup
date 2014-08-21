//
//  MapViewController.m
//  TkuGroup
//
//  Created by Shuo on 7/25/14.
//  Copyright (c) 2014 Shuo. All rights reserved.
//

#import "MapViewController.h"
@interface MapViewController ()

@end

@implementation MapViewController

@synthesize map_view ;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setAnnotations];
    [self locateMap];
    // Do any additional setup after loading the view.
    
    //Create back Button
    UIImage* image= [UIImage imageNamed:@"map_header_back_fb.png"];
    CGRect frame= CGRectMake(0, 0, image.size.width, image.size.height);
    UIButton* backButton= [[UIButton alloc] initWithFrame:frame];
    [backButton setBackgroundImage:image forState:UIControlStateNormal];
    [backButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    backButton.titleLabel.font=[UIFont systemFontOfSize:16];
    [backButton addTarget:self
                   action:@selector(goback)
         forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem* someBarButtonItem=
    [[UIBarButtonItem alloc] initWithCustomView:backButton];
    [self.navigationItem setLeftBarButtonItem:someBarButtonItem];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//返回地圖
- (void)goback
{
    [UIView
     transitionWithView:self.navigationController.view
     duration:0.5
     options:UIViewAnimationOptionTransitionCrossDissolve
     animations:^{[self.navigationController popViewControllerAnimated:NO];}
     completion:NULL];
}

//取得使用者目前位址
- (IBAction)setMapRegion
{
	map_view.showsUserLocation = YES;
	
	double X = map_view.userLocation.location.coordinate.latitude;
    double Y = map_view.userLocation.location.coordinate.longitude;
	
	MKCoordinateRegion adcube;
    
	if (X)
	{
		adcube.center.latitude = X;
		adcube.center.longitude = Y;
		
	}else {
		adcube.center.latitude = self.nLat;
		adcube.center.longitude = self.nLng;
	}
    
    adcube.span.latitudeDelta = 0.01;
    adcube.span.longitudeDelta = 0.01;
	
    
    [map_view regionThatFits:adcube];
	[map_view setRegion:adcube animated:YES];
}

//設定地圖的區域與範圍大小
-(void) locateMap {
    
    CLLocationManager *locationManager = [[CLLocationManager alloc] init];
    locationManager.distanceFilter = kCLDistanceFilterNone;
    locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters;
    [locationManager startUpdatingLocation];
    
    float curlatitude = locationManager.location.coordinate.latitude;
    float curlongitude = locationManager.location.coordinate.longitude;
    
    //初始化地理中心(淡江大學)
    CLLocationCoordinate2D currentLocation =
    CLLocationCoordinate2DMake(25.175475, 121.449992);
    CLLocationCoordinate2DMake(curlatitude, curlongitude);
    
    //初始化地圖擴張的區域
    MKCoordinateSpan currentSpan = MKCoordinateSpanMake(0.01, 0.01);
    
    //設置地圖中心
    map_view.centerCoordinate = currentLocation;
    
    //設定地圖擴張區域
    map_view.region = MKCoordinateRegionMake(currentLocation, currentSpan);
    
}

//MKMapView顯示Annotaion時呼叫
- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation
{
    // 判斷這個annotation是不是屬於目前所在的位置
    if ([annotation isKindOfClass:[MKUserLocation class]])
    {
        return nil;
    }
    
    MKAnnotationView *annView = (MKAnnotationView * )
    [mapView dequeueReusableAnnotationViewWithIdentifier:@"CustomAnnotation"];
    
    if (annView) {
        return annView;
    }
    
    annView = [[MKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"CustomAnnotation"];
    
    annView.image = ((MyAnnotation *)annotation).image;
    
    //點擊是否出現註解
    [annView setCanShowCallout:YES];
    return annView;
}

//設定大頭針
- (void)setAnnotations {
    
    //設定map_view的代理為View Controller
    self.map_view.delegate = self;
    
    //設定大頭針
    MyAnnotation *annotation;
    annotation = [[MyAnnotation alloc]initWithCoordinate:
                  CLLocationCoordinate2DMake (25.177534, 121.448504)
                                                   Title:@"吉野烤肉飯"
                                             Andsubtitle:@"地址：淡水區北新路一段182巷41弄"];
    
    MyAnnotation *annotation1 = [[MyAnnotation alloc]initWithCoordinate:
                  CLLocationCoordinate2DMake (25.176862, 121.451453)
                                                   Title:@"Hey Burger 黑漢堡"
                                             Andsubtitle:@"地址：北新路184巷204號"];

    annotation.image = [UIImage imageNamed:@"mid_map_food.png"];
    annotation1.image = [UIImage imageNamed:@"mid_map_food.png"];

    [self.map_view addAnnotation:annotation];
    [self.map_view addAnnotation:annotation1];

}

//搜尋商圈
- (IBAction)search:(id)sender {
    
    int offset = 40;
    //Create Button
    UIButton *btn_1 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn_1.frame = CGRectMake(20, 20 + offset, 35, 35);
    [btn_1 addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    [btn_1 setImage:[UIImage imageNamed:@"mid_map_ball.png"] forState:UIControlStateNormal];
    btn_1.userInteractionEnabled = YES;
    [self.view addSubview:btn_1];
    
    UIButton *btn_2 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn_2.frame = CGRectMake(20, 20 + 2*offset, 35, 35);
    [btn_2 addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    [btn_2 setImage:[UIImage imageNamed:@"mid_map_car.png"] forState:UIControlStateNormal];
    btn_2.userInteractionEnabled = YES;
    [self.view addSubview:btn_2];
    
    UIButton *btn_3 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn_3.frame = CGRectMake(20, 20 + 3*offset, 35, 35);
    [btn_3 addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    [btn_3 setImage:[UIImage imageNamed:@"mid_map_house.png"] forState:UIControlStateNormal];
    btn_3.userInteractionEnabled = YES;
    [self.view addSubview:btn_3];
    
    UIButton *btn_4= [UIButton buttonWithType:UIButtonTypeCustom];
    btn_4.frame = CGRectMake(20, 20 + 4*offset, 35, 35);
    [btn_4 addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    [btn_4 setImage:[UIImage imageNamed:@"mid_map_movie.png"] forState:UIControlStateNormal];
    btn_4.userInteractionEnabled = YES;
    [self.view addSubview:btn_4];
    
}

- (void) btnClick{
    
    CLLocationManager *locationManager = [[CLLocationManager alloc] init];
    locationManager.distanceFilter = kCLDistanceFilterNone;
    locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters;
    [locationManager startUpdatingLocation];
    
    float curlatitude = locationManager.location.coordinate.latitude;
    float curlongitude = locationManager.location.coordinate.longitude;
    
    //初始化地理中心(吉野烤肉飯)
    CLLocationCoordinate2D currentLocation =
    CLLocationCoordinate2DMake(25.177369, 121.451551);
    CLLocationCoordinate2DMake(curlatitude, curlongitude);
    
    //初始化地圖擴張的區域(放大比例)
    MKCoordinateSpan currentSpan = MKCoordinateSpanMake(0.002401f, 0.003433f);
    
    //設置地圖中心
    map_view.centerCoordinate = currentLocation;
    
    //設定地圖擴張區域
    map_view.region = MKCoordinateRegionMake(currentLocation, currentSpan);
}

@end
