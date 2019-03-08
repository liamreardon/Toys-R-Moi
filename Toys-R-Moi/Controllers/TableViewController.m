//
//  ViewController.m
//  Toys-R-Moi
//
//  Created by Liam  on 2018-10-23.
//  Copyright © 2018 Liam Reardon. All rights reserved.
//

#import "TableViewController.h"
#import "TableViewCell.h"
#import "ToyInfoViewController.h"


@interface TableViewController ()

@end

@implementation TableViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Get Document directory path
    NSArray *sysPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory ,NSUserDomainMask, YES);
    documentsDirectory = [sysPaths objectAtIndex:0];
    filePath = [documentsDirectory stringByAppendingPathComponent:@"Toy.plist"];
    toyArray = [[NSMutableArray alloc]initWithContentsOfFile:filePath];
    bundlePath = [[NSBundle mainBundle] pathForResource: @"Toy" ofType: @"plist"];
    NSLog(@"%@", documentsDirectory);

    if ([toyArray count] == 0)
    {
        // Store contents of bundle path to array
        NSMutableArray *mainBundle = [[NSMutableArray alloc]initWithContentsOfFile:bundlePath];
        
        // Get paths for initial images
        NSString *nintendoPath = [[NSBundle mainBundle] pathForResource: @"nintendo" ofType: @"jpg"];
        NSString *dronePath = [[NSBundle mainBundle] pathForResource: @"drone" ofType: @"jpg"];
        NSString *legoPath = [[NSBundle mainBundle] pathForResource: @"lego" ofType: @"jpg"];
        NSString *hoverPath = [[NSBundle mainBundle] pathForResource: @"hoverboard" ofType: @"jpg"];

        // Convert paths to images
        UIImage *nintendoImage = [UIImage imageWithContentsOfFile:nintendoPath];
        UIImage *droneImage = [UIImage imageWithContentsOfFile:dronePath];
        UIImage *legoImage = [UIImage imageWithContentsOfFile:legoPath];
        UIImage *hoverImage = [UIImage imageWithContentsOfFile:hoverPath];
        
        
        // Convert images to NSData objects for storage in document directory
        NSData *nintendoData = UIImagePNGRepresentation(nintendoImage);
        NSData *droneData = UIImagePNGRepresentation(droneImage);
        NSData *legoData = UIImagePNGRepresentation(legoImage);
        NSData *hoverData = UIImagePNGRepresentation(hoverImage);
        
        NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
        
        // Write initial image data to document directory
        
        toyArray = mainBundle;
        
        // Could probably be shortened into 1 for loop
        for (int i = 0; i < 1; i++)
        {
            dict = toyArray[0];
            NSString *uuid = [NSUUID UUID].UUIDString;
            NSString * combined = [uuid stringByAppendingString:@".png"];
            NSString *imagePath = [documentsDirectory stringByAppendingPathComponent:combined];
            [dict setObject:combined forKey:@"toyImage"];
            [nintendoData writeToFile:imagePath atomically:YES];
        }
        for (int i = 0; i < 1; i++)
        {
            dict = toyArray[1];
            NSString *uuid = [NSUUID UUID].UUIDString;
            NSString * combined = [uuid stringByAppendingString:@".png"];
            NSString *imagePath = [documentsDirectory stringByAppendingPathComponent:combined];
            [dict setObject:combined forKey:@"toyImage"];
            [droneData writeToFile:imagePath atomically:YES];
        }
        for (int i = 0; i < 1; i++)
        {
            dict = toyArray[2];
            NSString *uuid = [NSUUID UUID].UUIDString;
            NSString * combined = [uuid stringByAppendingString:@".png"];
            NSString *imagePath = [documentsDirectory stringByAppendingPathComponent:combined];
            [dict setObject:combined forKey:@"toyImage"];
            [legoData writeToFile:imagePath atomically:YES];
        }
        for (int i = 0; i < 1; i++)
        {
            dict = toyArray[3];
            NSString *uuid = [NSUUID UUID].UUIDString;
            NSString * combined = [uuid stringByAppendingString:@".png"];
            NSString *imagePath = [documentsDirectory stringByAppendingPathComponent:combined];
            [dict setObject:combined forKey:@"toyImage"];
            [hoverData writeToFile:imagePath atomically:YES];
        }
        
//        NSString *magePath = [documentsDirectory stringByAppendingPathComponent:dict[@"toyImage"]];
//        NSData *pngData = [NSData dataWithContentsOfFile:imagePath];
//        UIImage *image = [UIImage imageWithData:pngData];
        

        // Write main bundle array to document path
        [toyArray writeToFile:filePath atomically:YES];
        
    }
    
  
}

-(void) viewDidAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    // Document Path
    NSLog(@"%@", filePath);
    
    toyArray = [[NSMutableArray alloc]initWithContentsOfFile:filePath];
    
    // Slow but needs to be called to reload plist data
    [self.tableView reloadData];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return toyArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    NSDictionary *dict = toyArray[indexPath.row];

    // Get Toy Date String
    NSString *toyName = dict[@"toyName"];
    
    // Format Date object, convert to string
    NSDate *dateCreated = dict[@"dateCreated"];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"dd-MM-YYYY"];
    NSString *dateString = [dateFormatter stringFromDate:dateCreated];
    
    // Format Double to String
    NSNumber *toyPrice = dict[@"toyPrice"];
    NSString *toyPriceString = [NSString stringWithFormat:@"%@",toyPrice];
    
    
    //Toy Image
    imagePath = [documentsDirectory stringByAppendingPathComponent:dict[@"toyImage"]];
    NSData *pngData = [NSData dataWithContentsOfFile:imagePath];
    UIImage *image = [UIImage imageWithData:pngData];
    
    cell.toyNameLabel.text = toyName;
    cell.dateCreatedLabel.text = dateString;
    cell.toyPriceLabel.text = toyPriceString;
    cell.toyImageView.image = image;
    
    return cell;
    
}


// MARK - Tableview delegate methods

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:true];
   
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"ToyInfoSegue"])
    {
        NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
        // Get reference to the destination view controller
        ToyInfoViewController *vc = segue.destinationViewController;
        
        NSDictionary *dict = toyArray[indexPath.row];
        
        // Get Toy Date String
        NSString *toyName = dict[@"toyName"];
        
        // Get toy brand
        NSString *toyBrand = dict[@"toyBrand"];
        
        // Format Double to String
        NSNumber *toyPrice = dict[@"toyPrice"];
        NSString *toyPriceString = [NSString stringWithFormat:@"%@",toyPrice];
        
        //Toy Image
        imagePath = [documentsDirectory stringByAppendingPathComponent:dict[@"toyImage"]];
        NSData *pngData = [NSData dataWithContentsOfFile:imagePath];
        UIImage *image = [UIImage imageWithData:pngData];
        
        // Get additional toy info
        NSString *additionalInfo = dict[@"additionalInfo"];

        
        // Pass any objects to the view controller here
        vc.toyImage = image;
        vc.toyName = toyName;
        vc.toyBrand = toyBrand;
        vc.toyPrice = toyPriceString;
        vc.additionalInfo = additionalInfo;
        
        
    }
    
}
// MARK - Add new toys

- (IBAction)newToyPressed:(id)sender {
    
    [self performSegueWithIdentifier:@"AddToySegue" sender:self];
    
}
@end
