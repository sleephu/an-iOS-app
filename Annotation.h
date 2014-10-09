//
//  Annotation.h
//  Final
//
//  Created by sleephu on 4/19/14.
//  Copyright (c) 2014 Jingyun Hu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
@interface Annotation : NSObject<MKAnnotation>

@property(nonatomic,assign)CLLocationCoordinate2D coordinate;
@property(nonatomic,copy)NSString * title;
@property(nonatomic,copy)NSString * subtitle;

@end
