//
//  Customer.h
//  Final
//
//  Created by sleephu on 4/15/14.
//  Copyright (c) 2014 Jingyun Hu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Customer : NSObject
{
    NSString * name;
    NSString * phone;
    NSString * code;
  
}
@property(nonatomic,retain)NSString*name;
@property(nonatomic,retain)NSString *phone;
@property(nonatomic,retain)NSString *code;
@end
