//
//  Reservation.h
//  Final
//
//  Created by sleephu on 4/15/14.
//  Copyright (c) 2014 Jingyun Hu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Restaurant.h"
#import "Customer.h"
@interface Reservation : NSObject
{
   
    Customer * customer;
    NSDate * dateTime;
}
//@property(retain,nonatomic)Restaurant * restaurant;
@property(retain,nonatomic)Customer * customer;
@property(nonatomic,retain)NSDate* dateTime;
@end
