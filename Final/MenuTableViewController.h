//
//  MenuTableViewController.h
//  Final
//
//  Created by sleephu on 4/16/14.
//  Copyright (c) 2014 Jingyun Hu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Food.h"
@class ViewMenuController;
@interface MenuTableViewController : UITableViewController<NSXMLParserDelegate>
@property(strong,nonatomic)NSMutableArray *listArray;
@property(strong,nonatomic)ViewMenuController * viewMenuController;
@end
