//
//  MapViewController.h
//  Final
//
//  Created by sleephu on 4/15/14.
//  Copyright (c) 2014 Jingyun Hu. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import <GoogleMaps/GoogleMaps.h>
#import <MapKit/MapKit.h>
#import "ASOTwoStateButton.h"
#import "ASOBounceButtonViewDelegate.h"
#import "BounceButtonView.h"
#import "ACPButton.h"
@interface MapViewController : UIViewController<MKMapViewDelegate,ASOBounceButtonViewDelegate>{
    MKMapView * mapView;
}
//@property (weak, nonatomic) IBOutlet UILabel *destinationLabel;
//@property (weak, nonatomic) IBOutlet UILabel *distanceLabel;
//@property (weak, nonatomic) IBOutlet UILabel *modeLabel;
//@property (weak, nonatomic) IBOutlet UIScrollView *routeDetailView;
@property (strong, nonatomic) IBOutlet ACPButton *directionButton;

- (IBAction)findMe:(id)sender;

@property (strong, nonatomic) IBOutlet ASOTwoStateButton *menuButton;
@property (strong, nonatomic) BounceButtonView *menuItemView;
- (IBAction)direction:(id)sender;

- (IBAction)menuButtonAction:(id)sender;
@property (strong, nonatomic) IBOutlet ACPButton *findmeButton;

@end
