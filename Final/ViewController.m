//
//  ViewController.m
//  Final
//
//  Created by sleephu on 4/15/14.
//  Copyright (c) 2014 Jingyun Hu. All rights reserved.
//
#define LIGHT_FONT  [UIFont fontWithName:@"Avenir-Light"  size:14]
#define MEDIUM_FONT [UIFont fontWithName:@"Avenir-Medium" size:15]

#define DARK_COLOR             [UIColor colorWithRed: 68/255.0 green: 68/255.0 blue: 68/255.0 alpha:1.0]
#define KILL_LA_KILL_RED_COLOR [UIColor colorWithRed:221/255.0 green: 45/255.0 blue: 31/255.0 alpha:1.0]

#import "ViewController.h"

@interface ViewController ()
 
@end

@implementation ViewController
//@synthesize responseData;
@synthesize phoneL,phoneLabel,fetchButton;
@synthesize greetingContent,greetingId;
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view
    [fetchButton setHidden:true];
    [phoneLabel setHidden:true];
    [phoneL setHidden:true];

    phoneLabel.textColor=[UIColor redColor];
    phoneLabel.font=LIGHT_FONT;

    [phoneL setFont:MEDIUM_FONT];
    [phoneL setKeyboardAppearance:UIKeyboardAppearanceDark];
    [phoneL setTintColor:KILL_LA_KILL_RED_COLOR];
    
    [greetingId setFont:MEDIUM_FONT];
    [greetingId setTintColor:KILL_LA_KILL_RED_COLOR];
    
    [greetingContent setFont:MEDIUM_FONT];
    [greetingContent setTintColor:KILL_LA_KILL_RED_COLOR];
    NSURL *url = [NSURL URLWithString:@"http://localhost:8080/greeting"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:^(NSURLResponse *response,
                                               NSData *data, NSError *connectionError)
     {
         if (data.length > 0 && connectionError == nil)
         {
             NSDictionary *greeting = [NSJSONSerialization JSONObjectWithData:data
                                                                      options:0
                                                                        error:NULL];
       
             self.greetingContent.text = [greeting objectForKey:@"currentNum"];
         }
     }];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    [self fetchGreeting];
}
- (IBAction)fetchGreeting;
{
    if (phoneL.text==nil) {
        NSString *msg = @"Input Phone First Please";
        UIAlertView * nAlert =[[UIAlertView alloc] initWithTitle:nil message:msg delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [nAlert show];
        return;
    }else{
    NSURL *url = [NSURL URLWithString:@"http://localhost:8080/greeting"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:^(NSURLResponse *response,
                                               NSData *data, NSError *connectionError)
     {
         if (data.length > 0 && connectionError == nil)
         {
             NSDictionary *greeting = [NSJSONSerialization JSONObjectWithData:data
                                                                      options:0
                                                                        error:NULL];
             self.greetingId.text = [[greeting objectForKey:@"id"] stringValue];
//             self.greetingContent.text = [greeting objectForKey:@"currentNum"];
         }
     }];
    }
}

- (IBAction)question:(id)sender {
       [fetchButton setHidden:false];
    [phoneLabel setHidden:false];
    [phoneL setHidden:false];
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    //print text
    
 if ([textField tag ]==1) {
        NSString * input = [textField text];
        if ([input isEqualToString:@""]) {
            NSString *msg = [NSString stringWithFormat:@"phone cannot be %@. Please enter again",[textField text]];
            UIAlertView * nAlert =[[UIAlertView alloc] initWithTitle:nil message:msg delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
            [nAlert show];
            
        }
        
    }
    

    [textField resignFirstResponder];
    return YES;
}
@end
