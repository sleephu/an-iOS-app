//
//  ViewMenuController.h
//  Final
//
//  Created by sleephu on 4/16/14.
//  Copyright (c) 2014 Jingyun Hu. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ViewMenuController : UIViewController{
    NSString * name;
    NSString* fprice;
    NSString * des;
    UIImage * image;
    
   
}
//@property (strong, nonatomic) IBOutlet UILabel *foodName;
@property (strong, nonatomic) IBOutlet UIImageView *imageView;
//@property (strong, nonatomic) IBOutlet UILabel *foodDescription;
@property (strong, nonatomic) IBOutlet UITextView *foodDescription;

@property (strong, nonatomic) IBOutlet UILabel *price;
//@property(nonatomic,strong)NSString *name;
@property(nonatomic,strong)NSString *fprice;
@property(nonatomic,strong)NSString * des;
@property(nonatomic,strong)UIImage * image;

@end
