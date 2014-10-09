//
//  ViewMenuController.m
//  Final
//
//  Created by sleephu on 4/16/14.
//  Copyright (c) 2014 Jingyun Hu. All rights reserved.
//
#define LIGHT_FONT  [UIFont fontWithName:@"Avenir-Light"  size:14]
#define MEDIUM_FONT [UIFont fontWithName:@"Avenir-Medium" size:15]

#define DARK_COLOR             [UIColor colorWithRed: 68/255.0 green: 68/255.0 blue: 68/255.0 alpha:1.0]
#define KILL_LA_KILL_RED_COLOR [UIColor colorWithRed:221/255.0 green: 45/255.0 blue: 31/255.0 alpha:1.0]


#import "ViewMenuController.h"

@interface ViewMenuController ()

@end

@implementation ViewMenuController
@synthesize price,foodDescription,fprice,des,image,imageView;
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
    price.text =fprice;
    foodDescription.text=des;
    imageView.image=image;
    
    [price setFont:MEDIUM_FONT];
    [price setTintColor:KILL_LA_KILL_RED_COLOR];

    
    [foodDescription setFont:MEDIUM_FONT];
    [foodDescription setTintColor:KILL_LA_KILL_RED_COLOR];
    [foodDescription setKeyboardAppearance:UIKeyboardAppearanceDark];


    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

@end
