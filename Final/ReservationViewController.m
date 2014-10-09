//
//  ReservationViewController.m
//  Final
//
//  Created by sleephu on 4/16/14.
//  Copyright (c) 2014 Jingyun Hu. All rights reserved.
//
#define LIGHT_FONT  [UIFont fontWithName:@"Avenir-Light"  size:14]
#define MEDIUM_FONT [UIFont fontWithName:@"Avenir-Medium" size:15]

#define DARK_COLOR             [UIColor colorWithRed: 68/255.0 green: 68/255.0 blue: 68/255.0 alpha:1.0]
#define KILL_LA_KILL_RED_COLOR [UIColor colorWithRed:221/255.0 green: 45/255.0 blue: 31/255.0 alpha:1.0]

#import "ReservationViewController.h"
//#import "OCMaskedTextFieldView.h"

@interface ReservationViewController ()

@end

@implementation ReservationViewController
@synthesize name,phone,dateTime,nameL,phoneL,reservations,nameLabel,dateLable,phoneLabel,datePicker
,submitButton
;
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
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg.png"]];
    nameLabel.textColor=[UIColor whiteColor];
    nameLabel.font=LIGHT_FONT;
    [nameL setFont:MEDIUM_FONT];
    [nameL setTintColor:KILL_LA_KILL_RED_COLOR];
    [nameL setKeyboardAppearance:UIKeyboardAppearanceDark];
    
    phoneLabel.textColor=[UIColor whiteColor];
    phoneLabel.font=LIGHT_FONT;
//    
//    OCMaskedTextFieldView * phoneTextfiedl = [[OCMaskedTextFieldView alloc]initWithFrame:CGRectMake(20,100,280,33) andMask:@"+1(###) ### ####" showMask:YES];
//    [[phoneTextfiedl maskedTextField]setBorderStyle:UITextBorderStyleNone];
//    [[phoneTextfiedl maskedTextField] setFont:MEDIUM_FONT];
//    [[phoneTextfiedl maskedTextField]setKeyboardAppearance:UIKeyboardAppearanceDark];
//    [self.view addSubview:phoneTextfiedl];
    [phoneL setFont:MEDIUM_FONT];
    [phoneL setKeyboardAppearance:UIKeyboardAppearanceDark];
    [phoneL setTintColor:KILL_LA_KILL_RED_COLOR];

    dateLable.textColor=[UIColor whiteColor];
    dateLable.font=LIGHT_FONT;
    [datePicker setBackgroundColor:[UIColor whiteColor]];
    
    [submitButton setFlatStyleType:ACPButtonGrey];
    [submitButton setFlatStyleType:ACPButtonDarkGrey];
    [submitButton setBorderStyle:[UIColor blackColor] andInnerColor:[UIColor darkGrayColor]];
    [submitButton setLabelFont:[UIFont fontWithName:@"Trebuchet MS" size:20]];
   
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)submitReservation:(NSString *)nameD withPhone:(NSString *) phoneN withTime:(NSDate *)time{
    NSLog(@"post method!~~~~~~");
    if(nameD!=nil && phoneN!= nil &&time !=nil){
        NSMutableString * postString =[NSMutableString stringWithString:kPostURL];
        [postString appendString:[NSString stringWithFormat:@"?%@ = %@",kName,nameD]];
        [postString appendString:[NSString stringWithFormat:@"&%@ = %@",kPhone,phoneN]];
        [postString appendString:[NSString stringWithFormat:@"&%@ = %@",kTime,time]];
        [postString setString:[postString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
        NSMutableURLRequest  * request =[[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:postString]];
        [request setHTTPMethod:@"GET"];
//        NSData *urlData = [NSURLConnection sendSynchronousRequest:request
//                                                returningResponse:nil error:nil];
//        NSString *response = [NSString stringWithData:urlData encoding:NSUTF8StringEncoding];
        postConnection=[[NSURLConnection alloc]initWithRequest:request delegate:self startImmediately:YES];
//        NSLog("response: %@", response);
    
        NSLog(@"postString %@",postString);
    }
    
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
- (IBAction)datePicker:(UIDatePicker *)sender {
    dateTime = sender.date;
}
- (IBAction)setNotification:(UIButton *)sender {
    UILocalNotification *localNotification = [[UILocalNotification alloc] init];
    //Format the date
    NSDateFormatter *dateFormatter= [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"MM-dd-yyyy HH:mm"];
    
    localNotification.fireDate = dateTime;
    localNotification.alertBody = [NSString stringWithFormat:@"Your meeting at %@ is now", [dateFormatter stringFromDate:dateTime]];
    localNotification.soundName = UILocalNotificationDefaultSoundName;
    localNotification.applicationIconBadgeNumber = [UIApplication sharedApplication].applicationIconBadgeNumber+1;
    [[UIApplication sharedApplication] scheduleLocalNotification:localNotification];
    
    //[[UIApplication sharedApplication] presentLocalNotificationNow:localNotification];
}
//-(IBAction)submitButton:(id)sender
//{
//    
//    name =[nameL text];
//    phone =[phoneL text];
//  
//    if ([name isEqualToString:@""]){
//        NSString *msg = [NSString stringWithFormat:@"name cannot be null! Please enter again"];
//        UIAlertView * nAlert =[[UIAlertView alloc] initWithTitle:nil message:msg delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
//        [nAlert show];
//    }
//    else if ([phone isEqualToString:@""]){
//        NSString *msg = [NSString stringWithFormat:@"phone cannot be null! Please enter again"];
//        UIAlertView * nAlert =[[UIAlertView alloc] initWithTitle:nil message:msg delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
//        [nAlert show];
//    }
//       else{
//        Reservation *r = [[Reservation alloc] init];
//        r.customer.name = name;
//        r.customer.phone =phone;
//           r.dateTime=dateTime;
//        [reservations addObject:r];
//        NSString *msg = [NSString stringWithFormat:@" %@,Your Reservation has been submited! Your phone is %@, and your reservation time is %@",name,phone,dateTime];
//        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Success!" message:msg
//                                                       delegate:self
//                                              cancelButtonTitle:@"OK" otherButtonTitles: nil];
//        
////        [alert setTag:200];
//        [alert show];
//           
//           [self submitReservation:name withPhone: phone withTime:dateTime];
//               nameL.text=nil;
//               phoneL.text=nil;
////              dateTime=nil;
//
//        //        self.items =items;
//        //        [deleteView setItems:items];
//    }
//}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    //print text
    
    if ([textField tag ]==0) {
        NSString * input = [textField text];
        if ([input isEqualToString:@""]) {
            NSString *msg = [NSString stringWithFormat:@"name cannot be %@. Please enter again",[textField text]];
            UIAlertView * nAlert =[[UIAlertView alloc] initWithTitle:nil message:msg delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
            [nAlert show];
            
        }
        else{
            [phoneL resignFirstResponder];
            
        }
        
    }
    else if ([textField tag ]==1) {
        NSString * input = [textField text];
        if ([input isEqualToString:@""]) {
            NSString *msg = [NSString stringWithFormat:@"phone cannot be %@. Please enter again",[textField text]];
            UIAlertView * nAlert =[[UIAlertView alloc] initWithTitle:nil message:msg delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
            [nAlert show];
            
        }
        
    }


    // the user pressed the "Done" button, so dismiss the keyboard
    [textField resignFirstResponder];
    return YES;
}



- (IBAction)submit:(id)sender {
    
    
    NSLog(@"submit!!!!!!!!!");
    
    name =[nameL text];
    phone =[phoneL text];
    NSLog(@" name !!!!!!!!!%@",name);
      NSLog(@" phone !!!!!!!!!%@",phone);
    if ([name isEqualToString:@""]){
        NSString *msg = [NSString stringWithFormat:@"name cannot be null! Please enter again"];
        UIAlertView * nAlert =[[UIAlertView alloc] initWithTitle:nil message:msg delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [nAlert show];
    }
    else if ([phone isEqualToString:@""]){
        NSString *msg = [NSString stringWithFormat:@"phone cannot be null! Please enter again"];
        UIAlertView * nAlert =[[UIAlertView alloc] initWithTitle:nil message:msg delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [nAlert show];
    }
    else{
        Reservation *r = [[Reservation alloc] init];
        r.customer.name = name;
        r.customer.phone =phone;
        r.dateTime=dateTime;
        [reservations addObject:r];
        NSString *msg = [NSString stringWithFormat:@" %@,Your Reservation has been submited! Your phone is %@, and your reservation time is %@",name,phone,dateTime];
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Success!" message:msg
                                                       delegate:self
                                              cancelButtonTitle:@"OK" otherButtonTitles: nil];
        
        //        [alert setTag:200];
        [alert show];
        
        [self submitReservation:name withPhone: phone withTime:dateTime];
        
        NSLog(@"submit %@!!!!!!!!!",dateTime);
        nameL.text=nil;
        phoneL.text=nil;
        //              dateTime=nil;
        
        //        self.items =items;
        //        [deleteView setItems:items];
    }

}
@end
