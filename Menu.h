//
//  Menu.h
//  Final
//
//  Created by sleephu on 4/15/14.
//  Copyright (c) 2014 Jingyun Hu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Food.h"
@interface Menu : NSObject{
    Food * food;
}
@property(nonatomic,retain)Food *food;
@end
