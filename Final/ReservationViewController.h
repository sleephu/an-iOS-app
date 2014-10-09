//
//  ReservationViewController.h
//  Final
//
//  Created by sleephu on 4/16/14.
//  Copyright (c) 2014 Jingyun Hu. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "Reservation.h"
#import "ACPButton.h"
#define kPostURL @"http://localhost/reservation.php "
#define kName @"name"
#define kPhone @"phone"
#define kTime @"time"


@interface ReservationViewController : UIViewController<UITextFieldDelegate>{
    NSString * name;
    NSString * phone;
    NSDate * datetTime;
    NSMutableArray * reservations;
    NSURLConnection * postConnection;
    IBOutlet UITextField *nameL;

    IBOutlet UITextField *phoneL;
}
@property (weak, nonatomic) IBOutlet ACPButton *submitButton;
@property (strong, nonatomic) IBOutlet UITextField *nameL;
@property(strong,nonatomic)NSString *name;
@property(strong,nonatomic)NSString * phone;
@property (strong, nonatomic) IBOutlet UITextField *phoneL;
@property(strong,nonatomic)NSDate *dateTime;
@property(strong,nonatomic)NSMutableArray * reservations;
@property (strong, nonatomic) IBOutlet UILabel *nameLabel;
@property (strong, nonatomic) IBOutlet UILabel *phoneLabel;
@property (strong, nonatomic) IBOutlet UILabel *dateLable;
@property (strong, nonatomic) IBOutlet UIDatePicker *datePicker;
- (IBAction)submit:(id)sender;


@end
