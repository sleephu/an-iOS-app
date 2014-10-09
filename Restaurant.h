//
//  Restaurant.h
//  Final
//
//  Created by sleephu on 4/15/14.
//  Copyright (c) 2014 Jingyun Hu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Menu.h"
#import "Customer.h"
@interface Restaurant : NSObject{
    NSString * name;
    NSString * phone;
    Menu * menu;
    NSString * address;
    NSString * hour;
    NSString* detail;
    
}
@property(nonatomic,retain)NSString *name;
@property(nonatomic,retain)  NSString * phone;
@property(nonatomic,retain)  NSString * hour;
@property(nonatomic,retain)  NSString * detail;
@property(nonatomic,retain) Menu * menu;
@property(nonatomic,retain)NSString * address;
@property(nonatomic,retain) Customer * customer;
@end
