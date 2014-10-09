//
//  ViewController.h
//  Final
//
//  Created by sleephu on 4/15/14.
//  Copyright (c) 2014 Jingyun Hu. All rights reserved.
//

#import <UIKit/UIKit.h>
//#define kGETUrl @"http://sleephu.local/getNum.php"
@interface ViewController : UIViewController<NSURLConnectionDataDelegate,NSURLConnectionDelegate,UITextFieldDelegate>
{
    NSMutableArray * json;
    NSData * responseData;
}
//- (IBAction)getCurrentNum:(id)sender;
//@property (strong, nonatomic) IBOutlet UITextField *currentNum;

@property (nonatomic, strong) IBOutlet UILabel *greetingId;
@property (nonatomic, strong) IBOutlet UILabel *greetingContent;
//@property(nonatomic,strong)NSData * responseData;
- (IBAction)fetchGreeting;
- (IBAction)question:(id)sender;
@property (strong, nonatomic) IBOutlet UITextField *phoneL;
@property (strong, nonatomic) IBOutlet UILabel *phoneLabel;
@property (strong, nonatomic) IBOutlet UIButton *fetchButton;

@end
