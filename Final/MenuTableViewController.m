//
//  MenuTableViewController.m
//  Final
//
//  Created by sleephu on 4/16/14.
//  Copyright (c) 2014 Jingyun Hu. All rights reserved.
//

#import "MenuTableViewController.h"
#import "ViewMenuController.h"
@interface MenuTableViewController (){

    NSMutableArray *_objects;
    NSXMLParser * xparser;
    
    Food * currentList;
    //    Vitamin * vitaminList;
    //    Minerals * mineralsList;
    
    NSMutableString * currentElementValue;
    NSString* currentElement;
    //    NSString * name;
    BOOL flag;

}

@end

@implementation MenuTableViewController
@synthesize listArray;
@synthesize viewMenuController;
- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    viewMenuController =[[ViewMenuController alloc]init];
    

    NSString *xmlPath = [[NSBundle mainBundle] pathForResource:@"restaurant" ofType:@"xml"];
    
    NSData *data = [[NSData alloc] initWithContentsOfFile:xmlPath];
    
    //    NSXMLParser *xmlParser
    xparser= [[NSXMLParser alloc] initWithData:data];
    
    //    xmlParser.delegate = self;
    
//    NSLog(@"path:%@",xmlPath);
    //    parser = [[NSXMLParser alloc]initWithData:[urlContents dataUsingEncoding:NSUTF8StringEncoding] ];
    //    xparser = [[NSXMLParser alloc]initWithContentsOfURL: url ];
//    NSLog(@"data:%@",data);
    [xparser setDelegate:self];
    //    [parser setShouldResolveExternalEntities:NO];
    [xparser parse];
    
    
    BOOL worked=[xparser parse];
    if (worked) {
        NSLog(@"Amount %lu",(unsigned long)listArray.count);
        
    }else{
        NSLog(@"ooooooooo");
        
        NSError *err = [xparser parserError];
        NSString *error = [err localizedDescription];
        NSLog(@"error%@",error);
    }

    
}
-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict{
    
    
    //    currentElement =elementName;
    
    if ([elementName isEqualToString:@"restaurant"]) {
        NSLog(@"FOOD element found – create a new instance of FOOD class...");
        listArray =[[NSMutableArray alloc]init];
        //      vitaminsArray =[[NSMutableArray alloc]init];
        //      mineralsArray =[[NSMutableArray alloc]init];
        
        currentElementValue =nil;
        
        flag=NO;
    }
    
    if ([elementName isEqualToString:@"food"]){
        //        NSLog(@"enter---------------%@",elementName);
        flag = YES;
        currentList =[[Food alloc]init];
        
    }
    
    
    
    
}


-(void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
    
    currentElementValue = [[NSMutableString alloc]init];
    
    [currentElementValue setString:@""];
    [currentElementValue appendString:string];
    
}


-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName{
    
    currentElement =[[NSString alloc]initWithString:currentElementValue];
    if ([elementName isEqualToString:@"restaurant"]) {
        return;
    }
    
    
    if (flag) {
        
        if ([elementName isEqualToString:@"name"]) {
            
            currentList.foodName=currentElement;
            
//            NSLog(@"~~~~~~~name~~~~%@",currentList.foodName);
        }
        if ([elementName isEqualToString:@"price"]) {
            currentList.foodPrice=currentElement;
            
//            NSLog(@"~~~~~~~Price~~~~%@",currentList.foodPrice);
        }
        if ([elementName isEqualToString:@"description"]) {
            currentList.foodDescription=currentElement;
            
//            NSLog(@"~~~~~~~Description~~~~%@",currentList.foodDescription);
       
        }
        
        if ([elementName isEqualToString:@"image"]) {
            
            currentList.imageURL=currentElement;
            NSData *imageData = [[NSData alloc]initWithContentsOfURL:[NSURL URLWithString:currentList.imageURL]];
            UIImage *img = [[UIImage alloc] initWithData:imageData];
            currentList.image=img;
            
        }
        
        if ([elementName isEqualToString:@"food"]){
            
            [listArray addObject:currentList];
            currentList=nil;
            currentElement =nil;
            currentElementValue=nil;
        }
    }
}


- (void)parserDidEndDocument:(NSXMLParser *)parser {
    
    [self.tableView reloadData];
    
}

- (void)parser:(NSXMLParser *)parser parseErrorOccurred:(NSError *)parseError{
    
    NSError *err = [parser parserError];
    NSString *error = [err localizedDescription];
    NSLog(@"error%@",error);
    NSString *errorMessage = @"Error!";
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Connection Error!" message:errorMessage
                                                       delegate:nil cancelButtonTitle:@"OK"   otherButtonTitles:nil];
    [alertView show];
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return listArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" ];
    if(cell==nil){
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    currentList = [listArray objectAtIndex:indexPath.row];
    cell.textLabel.text =currentList.foodName;
    cell.imageView.image =currentList.image;
    NSLog(@"tableCelll!!!!!!! %@",currentList.foodPrice);
    cell.detailTextLabel.text =[NSString stringWithFormat:@"Price: %@, Description:%@",currentList.foodPrice,currentList.foodDescription];
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

/*
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
 {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 [_objects removeObjectAtIndex:indexPath.row];
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 } else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
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
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
//    // Get the new view controller using [segue destinationViewController].
//    // Pass the selected object to the new view controller.
    if([segue.identifier isEqualToString:@"viewMenuFood"]) {
        NSIndexPath *indexPath = nil;
//        NSString * name=nil;
//        NSString * price =nil;
//        NSString * fDescription =nil;
        
        indexPath =[self.tableView indexPathForSelectedRow];
        currentList =[listArray objectAtIndex:indexPath.row];
        viewMenuController = segue.destinationViewController;
//        UIImageView *imageView = (UIImageView*)[viewMenuController.view viewWithTag:1];
        viewMenuController.title = currentList.foodName;
        NSLog(@"!!!!!!Selecting!~~~~~~~%@",currentList.foodName);
        
        viewMenuController.des =currentList.foodDescription;
//        viewMenuController.foodDescription.text = currentList.foodDescription;
        viewMenuController.fprice=currentList.foodPrice;
//        NSLog(@"!!!!!!Selecting!~~~~~~~%@",currentList.foodPrice);
//        viewMenuController.price.text =currentList.foodPrice;
        viewMenuController.image =currentList.image;
//        viewMenuController.imageView.image=currentList.image;
        
        
        NSLog(@"food Name %@",viewMenuController.price.text);
//        NSLog(@"theList food Description!!~~%@",viewMenuController.foodDescription.text);
//
//        if(imageView){
//            imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"p%d.jpg",self.tableView.indexPathForSelectedRow.row]];
//        }
//        viewMenuController.title = [listArray objectAtIndex:self.tableView.indexPathForSelectedRow.row];
    }
    
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //    NSDate *object = _objects[indexPath.row];
    //     self.detailViewController.detailItem = object;
//    NSLog(@"seeeecccccccccccccccccclt");
//    currentList =[listArray objectAtIndex:indexPath.row];
//   
//    //    [self.delegate masterAction:currentList];
//    //    self.detailViewController.detailItem = currentList.name;
//    viewMenuController.foodName.text = currentList.foodName;
//    NSLog(@"!!!!!!Selecting!~~~~~~~%@",currentList.foodName);
//    
//   viewMenuController.foodDescription.text = currentList.foodDescription;
//     NSLog(@"!!!!!!Selecting!~~~~~~~%@",currentList.foodPrice);
//    viewMenuController.price.text =currentList.foodPrice;
//    viewMenuController.imageView.image=currentList.image;
//   
//    
//    NSLog(@"food Name %@",viewMenuController.foodName);
//    NSLog(@"theList food Description!!~~%@",viewMenuController.foodDescription);
    
    
}
@end
