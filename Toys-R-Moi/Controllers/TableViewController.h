//
//  ViewController.h
//  Toys-R-Moi
//
//  Created by Liam  on 2018-10-23.
//  Copyright © 2018 Liam Reardon. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewController : UITableViewController {
    
    NSMutableArray *toyArray;
    NSString *filePath;
    NSString *imagePath;
    NSString *bundlePath;
    NSString *documentsDirectory;
    NSMutableArray *plistArray;
    NSData *pngData;
    
};

- (IBAction)newToyPressed:(id)sender;


@end

