//
//  MapViewController.m
//  Final
//
//  Created by sleephu on 4/15/14.
//  Copyright (c) 2014 Jingyun Hu. All rights reserved.
//

#import "MapViewController.h"
//#import <GoogleMaps/GoogleMaps.h>
#import "Annotation.h"
@interface MapViewController (){
    CLPlacemark * thePlacemark;
    MKRoute * routeDetails;
}
@property(retain,nonatomic)IBOutlet MKMapView * mapView;
//@property(weak,nonatomic)NSString *allSteps;
@end

@implementation MapViewController
@synthesize menuItemView,menuButton,mapView,findmeButton,directionButton
//,destinationLabel,distanceLabel,mapView,modeLabel,routeDetailView
;
//{
////    GMSMapView * mapView;
//}
//@synthesize destinationLabel,distanceLabel,modeLabel,routeDetailView;
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
    
    [findmeButton setFlatStyleType:ACPButtonGrey];
    [findmeButton setFlatStyleType:ACPButtonDarkGrey];
    [findmeButton setBorderStyle:[UIColor blackColor] andInnerColor:[UIColor darkGrayColor]];
    [findmeButton setLabelFont:[UIFont fontWithName:@"Trebuchet MS" size:20]];

    [directionButton setFlatStyleType:ACPButtonGrey];
    [directionButton setFlatStyleType:ACPButtonDarkGrey];
    [directionButton setBorderStyle:[UIColor blackColor] andInnerColor:[UIColor darkGrayColor]];
    [directionButton setLabelFont:[UIFont fontWithName:@"Trebuchet MS" size:20]];
    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController *menuItemsVC = (UIViewController *)[mainStoryboard instantiateViewControllerWithIdentifier:@"ExpandMenu"];
    menuItemView = (BounceButtonView *)menuItemsVC.view;
    
    NSArray *arrMenuItemButtons = [[NSArray alloc] initWithObjects:menuItemView.currentLocation,
                                   menuItemView.island,
//                                   menuItemView.route,
                                   nil]; // Add all of the defined 'menu item button' to 'menu item view'
    [menuItemView addBounceButtons:arrMenuItemButtons];
    
    // Set the bouncing distance, speed and fade-out effect duration here. Refer to the ASOBounceButtonView public properties
    [self.menuItemView setBouncingDistance:[NSNumber numberWithFloat:0.7f]];
    
    // Set as delegate of 'menu item view'
    [self.menuItemView setDelegate:self];
//    GMSCameraPosition * camera = [GMSCameraPosition cameraWithLatitude:41.310311 longitude:-71.853485 zoom:6];
//    mapView = [GMSMapView mapWithFrame:CGRectZero camera:camera];
//    mapView.myLocationEnabled =YES;
//    self.view = mapView;
    
//    GMSMarker * marker =[[GMSMarker alloc]init];
//    marker.position =CLLocationCoordinate2DMake(-33.86, 151.20);
//    marker.title =@"Island";
//    marker.snippet=@"United States";
//    marker.map =mapView;
//    CLLocationCoordinate2D coord = CLLocationCoordinate2DMake	(41.310311  ,-71.853485);
//    self.mapView.region = MKCoordinateRegionMake(coord , MKCoordinateSpanMake(0.00725f, 0.00725f));
//    self.mapView.showsUserLocation = YES;
//    self.mapView.zoomEnabled = YES;
//    [self.mapView setCenterCoordinate:coord animated:YES];
//    
    float spanX = 0.10f;
    float spanY = 0.10f;
    MKCoordinateRegion region={{0.0,0.0},{0.0,0.0}};
    region.center.latitude = 41.310311;
    region.center.longitude = -71.853485;
    region.span.latitudeDelta = spanX;
    region.span.longitudeDelta = spanY;
    region.span = MKCoordinateSpanMake(spanX, spanY);
    
    [self.mapView setRegion:region animated:YES];
    
    Annotation * ann=[[Annotation alloc]init];
    ann.title=@"Island";
    ann.subtitle=@"One Bluff Avenue Westerly,RI 02809";
    ann.coordinate=region.center;
   [mapView addAnnotation:ann];
    
//    MKPointAnnotation *annotation = [[MKPointAnnotation alloc]init];
//    annotation.coordinate = region.center;
//    annotation.title=@"Island";
//    annotation.subtitle =@"Westerly,RI- USA";
//    [self.mapView addAnnotation:annotation];
//    
//    self.routeDetailView.hidden=YES;
//    [self addressSearch:@"Island"];

    self.mapView.mapType = MKMapTypeStandard;
    self.mapView.delegate = self;
//    self.routeDetailView.hidden=YES;
    
    [self.menuButton initAnimationWithFadeEffectEnabled:YES];
}

- (void)viewDidAppear:(BOOL)animated
{
    // Tell 'menu button' position to 'menu item view'
    [self.menuItemView setAnimationStartFromHere:self.menuButton.frame];
}
- (IBAction)direction:(id)sender {
    NSLog(@"!!!!!!DIRECTION!!!!");
    NSString * urlString =@"http://maps.apple.com/maps?daddr=41.310311,-71.853485";
    [[UIApplication sharedApplication]openURL:[NSURL URLWithString:urlString]];
}

- (IBAction)menuButtonAction:(id)sender
{
    if ([sender isOn]) {
        // Show 'menu item view' and expand its 'menu item button'
        [self.menuButton addCustomView:self.menuItemView];
        [self.menuItemView expandWithAnimationStyle:ASOAnimationStyleExpand];
    }
    else {
        // Collapse all 'menu item button' and remove 'menu item view'
        [self.menuItemView collapseWithAnimationStyle:ASOAnimationStyleExpand];
        [self.menuButton removeCustomView:self.menuItemView interval:[self.menuItemView.collapsedViewDuration doubleValue]];
    }
}

#pragma mark - Menu item view delegate method

- (void)didSelectBounceButtonAtIndex:(NSUInteger)index
{
    // Collapse all 'menu item button' and remove 'menu item view' once a menu item is selected
    [self.menuButton sendActionsForControlEvents:UIControlEventTouchUpInside];
    
    // Set your custom action for each selected 'menu item button' here
//    NSString *alertViewTitle = [NSString stringWithFormat:@"Menu Item %x is selected", (short)index];
//    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:alertViewTitle message:nil delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
//    [alertView show];
    if((short)index==0){
        mapView.showsUserLocation=YES;
       
    }else{
        NSLog(@"!!!!!!DIRECTION!!!!");
        NSString * urlString =@"http://maps.apple.com/maps?daddr=41.310311,-71.853485";
        [[UIApplication sharedApplication]openURL:[NSURL URLWithString:urlString]];
    }


}

- (void)willAnimateRotationToInterfaceOrientation:
(UIInterfaceOrientation)toInterfaceOrientation
                                         duration:(NSTimeInterval)duration
{
    // Update 'menu button' position to 'menu item view' everytime there is a change in device orientation
    [self.menuItemView setAnimationStartFromHere:self.menuButton.frame];
}


- (IBAction)setType:(UISegmentedControl *)sender {
//    self.routeDetailView.hidden=YES;
    switch (sender.selectedSegmentIndex) {
        case 0:
            self.mapView.mapType = MKMapTypeStandard;
            break;
        case 1:
            self.mapView.mapType = MKMapTypeSatellite;
            break;
        case 2:
            self.mapView.mapType = MKMapTypeHybrid;
            break;

        default:
            break;
    }
}
//- (IBAction)showCurrentLocation:(UIBarButtonItem *)sender {
//    self.routeDetailView.hidden=YES;
//    NSLog(@"%@", self.mapView.userLocation.title);
//    NSLog(@"%f", self.mapView.userLocation.location.coordinate.latitude);
//    NSLog(@"%f", self.mapView.userLocation.location.coordinate.longitude);
//    //1 degree is equal to 69 mile. If we have a span of half a mile we can use this equation: (1/69)*0.5 which equals 0.00725.
//    float spanX = 0.00725;
//    float spanY = 0.00725;
//    MKCoordinateRegion region;
//    region.center.latitude = self.mapView.userLocation.coordinate.latitude;
//    region.center.longitude = self.mapView.userLocation.coordinate.longitude;
//    region.span.latitudeDelta = spanX;
//    region.span.longitudeDelta = spanY;
//    //region.span = MKCoordinateSpanMake(spanX, spanY);
//    
//    [self.mapView setRegion:region animated:YES];
//    
//    //setCenterCoordinate:animated:  To set location to a different place
//    //setVisibleMapRect:animated:    to set the visible portion
//    //setVisibleMapRect:edgePadding:animated:  same as above but it adds padding around the edges
//}
//
//- (IBAction)setMapToIsland:(id)sender {
//   
//    
//     //42.376181000000000000 Latitude and -71.115757000000030000 Longitude
////   CLLocationCoordinate2D coord = CLLocationCoordinate2DMake	(41.310311  ,-71.853485);
////    self.mapView.region = MKCoordinateRegionMake(coord , MKCoordinateSpanMake(0.00725f, 0.00725f));
////     self.mapView.showsUserLocation = YES;
////     self.mapView.zoomEnabled = YES;
////     [self.mapView setCenterCoordinate:coord animated:YES];
////     
////     MKPointAnnotation *annotation = [[MKPointAnnotation alloc]init];
////     annotation.coordinate = coord;
////     annotation.title=@"Island ";
////     annotation.subtitle =@"Westerly,RI- USA";
////     [self.mapView addAnnotation:annotation];

//    self.routeDetailView.hidden=YES;
//  
//    
//}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
-(void)mapView:(MKMapView *)mapView regionDidChangeAnimated:(BOOL)animated {
    NSLog(@"Moved away");
}






- (IBAction)findMe:(id)sender {
     NSLog(@"!!!!!!FINDME!!!!");
    mapView.showsUserLocation=YES;
}
@end
