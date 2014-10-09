//
//  LocationViewController.m
//  Final
//
//  Created by sleephu on 4/16/14.
//  Copyright (c) 2014 Jingyun Hu. All rights reserved.
//

#import "LocationViewController.h"
#import "Annotation.h"
@interface LocationViewController ()

@property(weak,nonatomic)IBOutlet MKMapView * mapView;
@end

#define ISLAND_LATITUDE 41.310311;
#define ISLAND_LONGTITUDE -71.853485;
#define  THE_SPAN 0.8f;

#define NORTHEASTERN_LATITUDE 42.3390262
#define NORTHEASTERN_LONGTITUDE -71.0904783
@implementation LocationViewController
@synthesize mapView;
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
    //region
    MKCoordinateRegion region;
    // Center
    CLLocationCoordinate2D center;
    center.latitude =ISLAND_LATITUDE;
    center.longitude =ISLAND_LONGTITUDE;
    // Span
    MKCoordinateSpan span;
    span.latitudeDelta=THE_SPAN;
    span.longitudeDelta=THE_SPAN;
    
    region.center =center;
    region.span=span;
    
    //set mapView
    [mapView setRegion:region animated:YES];
    
    //Annotation
    
    NSMutableArray * locations =[[NSMutableArray alloc]init];
    CLLocationCoordinate2D location;
    Annotation * annotation;
    
    //island
    annotation=[[Annotation alloc]init];
    location.latitude=ISLAND_LATITUDE;
    location.longitude=ISLAND_LONGTITUDE;
    annotation.coordinate=location;
    annotation.title=@"Island";
    annotation.subtitle=@"Westerly,RI- USA";
    [locations addObject:annotation];
    
    //current location
    annotation=[[Annotation alloc]init];
    location.latitude=NORTHEASTERN_LATITUDE;
    location.longitude=NORTHEASTERN_LONGTITUDE;
    annotation.coordinate=location;
    annotation.title=@"You're here!";
    annotation.subtitle=@"Northeastern University,MA- USA";
    [locations addObject:annotation];
    [self.mapView addAnnotations:locations];
    
    //1. Create a coordinate for use with the annotation
   /* CLLocationCoordinate2D islandLocation;
    islandLocation.latitude =ISLAND_LATITUDE;
    islandLocation.longitude=ISLAND_LONGTITUDE;
    
    
    
    Annotation * annotation =[Annotation alloc];
    annotation.coordinate=islandLocation;
    annotation.title=@"Island";
    annotation.subtitle=@"Westerly,RI- USA";
    [self.mapView addAnnotation:annotation];*/
    
   
    
    
}

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

@end
