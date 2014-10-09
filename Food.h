//
//  Food.h
//  Final
//
//  Created by sleephu on 4/15/14.
//  Copyright (c) 2014 Jingyun Hu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Food : NSObject{
    NSInteger * foodId;
    NSString * foodName;
    NSString * foodPrice;
    NSString * foodDescription;
    UIImage * image;
    NSString * imageURL;
}

@property(nonatomic)NSInteger *foodId;
@property(nonatomic,retain)NSString * foodName;
@property(nonatomic)NSString *foodPrice;
@property(nonatomic,retain)NSString * foodDescription;
@property(nonatomic,retain)UIImage * image;
@property(nonatomic,retain)NSString * imageURL;
@end
