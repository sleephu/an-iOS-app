//
//  DetailsTableViewController.m
//  Final
//
//  Created by sleephu on 4/18/14.
//  Copyright (c) 2014 Jingyun Hu. All rights reserved.
//

#import "DetailsTableViewController.h"

@interface DetailsTableViewController ()
@property (strong, nonatomic) OCBorghettiView *accordion;
@end

@implementation DetailsTableViewController

//- (id)initWithStyle:(UITableViewStyle)style
//{
//    self = [super initWithStyle:style];
//    if (self) {
//        // Custom initialization
//    }
//    return self;
//}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:0.0f
                                                green:0.447f
                                                 blue:0.255f
                                                alpha:1.0f];
    
    [self setupAccordion];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}
- (void)setupAccordion
{
    self.accordion = [[OCBorghettiView alloc] initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, self.view.frame.size.height - 20)];
    self.accordion.headerHeight = 40;
    
    self.accordion.headerFont = [UIFont fontWithName:@"Avenir" size:16];
    
    self.accordion.headerBorderColor = [UIColor colorWithRed:0.129f
                                                       green:0.514f
                                                        blue:0.349f
                                                       alpha:1.0f];
    self.accordion.headerColor = [UIColor colorWithRed:0.0f
                                                 green:0.447f
                                                  blue:0.255f
                                                 alpha:1.0f];
    [self.view addSubview:self.accordion];
    
    // Section One
    UITableView *sectionOne = [[UITableView alloc] init];
    [sectionOne setTag:1];
    [sectionOne setDelegate:self];
    [sectionOne setDataSource:self];
    [self.accordion addSectionWithTitle:@"Open Hour&Room Type"
                                andView:sectionOne];
    
    // Section Two
//    UITableView *sectionTwo = [[UITableView alloc] init];
//    [sectionTwo setTag:2];
//    [sectionTwo setDelegate:self];
//    [sectionTwo setDataSource:self];
//    [self.accordion addSectionWithTitle:@"Room Type"
//                                andView:sectionTwo];
    
//    // Section Three
//    UITableView *sectionThree = [[UITableView alloc] init];
//    [sectionThree setTag:3];
//    [sectionThree setDelegate:self];
//    [sectionThree setDataSource:self];
//    [self.accordion addSectionWithTitle:@"Section Three"
//                                andView:sectionThree];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    // Return the number of sections.
    return 2;
}

//- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
////    UIView* customView = [[UIView alloc] initWithFrame:CGRectMake(10,0,300,60)] ;
//    
//    // create image object
//    if (section==0) {
//        self.accordion = [[OCBorghettiView alloc] initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, self.view.frame.size.height - 20)];
//        self.accordion.headerHeight = 40;
//        
//        self.accordion.headerFont = [UIFont fontWithName:@"Avenir" size:16];
//        
//        self.accordion.headerBorderColor = [UIColor colorWithRed:0.129f
//                                                           green:0.514f
//                                                            blue:0.349f
//                                                           alpha:1.0f];
//        self.accordion.headerColor = [UIColor colorWithRed:0.0f
//                                                     green:0.447f
//                                                      blue:0.255f
//                                                     alpha:1.0f];
//        [self.view addSubview:self.accordion];
//    }
//    if (section==1) {
//        self.accordion = [[OCBorghettiView alloc] initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, self.view.frame.size.height - 20)];
//        self.accordion.headerHeight = 40;
//        
//        self.accordion.headerFont = [UIFont fontWithName:@"Avenir" size:16];
//        
//        self.accordion.headerBorderColor = [UIColor colorWithRed:0.129f
//                                                           green:0.514f
//                                                            blue:0.349f
//                                                           alpha:1.0f];
//        self.accordion.headerColor = [UIColor colorWithRed:0.0f
//                                                     green:0.447f
//                                                      blue:0.255f
//                                                     alpha:1.0f];
//        [self.view addSubview:self.accordion];
//    }
//    
//    
//    return self.accordion;
//
//    
//}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    // Return the number of rows in the section.
    return 4;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"borghetti_cell"];
    
    // Configure the cell...
    if (cell == nil)
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"borghetti_cell"];
//     cell.textLabel.text = [NSString stringWithFormat:@"Table %d - Cell %d", tableView.tag, indexPath.row];
    cell.textLabel.font = [UIFont fontWithName:@"Avenir" size:16];
//    cell.textLabel.text = [NSString stringWithFormat:@"Table %d - Cell %d", tableView.tag, indexPath.row];
//        if (self.tableView.tag==1) {
//            if (indexPath.row==0) {
//                cell.textLabel.text= @"Breakfast: 7:00am - 10:30am";
//            }
//            if (indexPath.row==1) {
//                cell.textLabel.text= @" Sunday Brunch: 8:00am - 2:30pm";
//                
//            }
//    }
    if (indexPath.section==0) {
        if (indexPath.row==0) {
           cell.textLabel.text= @"Breakfast: 7:00am - 10:30am";
        }
        if (indexPath.row==1) {
            cell.textLabel.text= @" Sunday Brunch: 8:00am - 2:30pm";
        }
        if (indexPath.row==2) {
            cell.textLabel.text= @"Lunch: 11:30am - 2:30pm";
        }
        if (indexPath.row==3) {
            cell.textLabel.text= @"Dinner: 6:00pm - 9:00pm";
        }
    }
    
    if (indexPath.section==1) {
        if (indexPath.row==0) {
            cell.textLabel.text= @"Banquet/Private Rooms";
        }
        if (indexPath.row==1) {
            cell.textLabel.text= @"Bar Dining, Bar/Lounge";
            
        }
        if (indexPath.row==2) {
            cell.textLabel.text= @"Patio/Outdoor Dining";
            
        }
        if (indexPath.row==3) {
            cell.textLabel.text= @"Beer, Chef's Table";
            
        }

    }
    cell.textLabel.textColor = [UIColor colorWithRed:0.46f green:0.46f blue:0.46f alpha:1.0f];
    cell.accessoryType = UITableViewCellAccessoryNone;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;

    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

- (BOOL)shouldAutorotate
{
    return YES;
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

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
