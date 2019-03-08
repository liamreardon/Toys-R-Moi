//
//  AddToyViewController.m
//  Toys-R-Moi
//
//  Created by Liam  on 2018-10-23.
//  Copyright © 2018 Liam Reardon. All rights reserved.
//

#import "AddToyViewController.h"

@interface AddToyViewController ()

@end

@implementation AddToyViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}

// Dismiss keyboard
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    [[self view] endEditing:TRUE];
    
}

// Pick Image
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<UIImagePickerControllerInfoKey,id> *)info {
    
    UIImage *userPickedImage = [info objectForKey:UIImagePickerControllerOriginalImage];
    imageView.image = userPickedImage;
    pngData = UIImagePNGRepresentation(userPickedImage);
    
    [imagePicker dismissViewControllerAnimated:true completion:nil];
}

// Add photo button pressed
- (IBAction)addToyPhotoPressed:(id)sender {
    
    imagePicker = [[UIImagePickerController alloc] init];
    imagePicker.delegate = self;
    imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    imagePicker.mediaTypes = [UIImagePickerController availableMediaTypesForSourceType:imagePicker.sourceType];
    imagePicker.allowsEditing = NO;
    
    
    [self presentViewController:imagePicker animated:YES completion:nil];
}

// Add toy button pressed
- (IBAction)addToy:(id)sender {
    
    [self saveData];
    
    UIAlertController * alert = [UIAlertController
                                 alertControllerWithTitle:@"Success!"
                                 message:@"Toy was added"
                                 preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction * okButton = [UIAlertAction
                                actionWithTitle:@"Ok"
                                style:UIAlertActionStyleDefault
                                handler:nil];
    [alert addAction:okButton];
    [self.navigationController popToRootViewControllerAnimated:YES];
    [self presentViewController:alert animated:YES completion:nil];
    
}


// Save data to plist
-(void)saveData {
    
    // Get document path
    NSArray *sysPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory ,NSUserDomainMask, YES);
    
    NSString *documentsDirectory = [sysPaths objectAtIndex:0];
    NSString *filePath = [documentsDirectory stringByAppendingPathComponent:@"Toy.plist"];

    // Create array with contents of filepath
    plistArray = [[NSMutableArray alloc] initWithContentsOfFile:filePath];
    if (plistArray == NULL) {
        plistArray = [[NSMutableArray alloc] init];
    }
    
    NSMutableDictionary *newDict = [[NSMutableDictionary alloc]init];
    
    // Get current date
    NSDate * now = [NSDate date];

    // Generate Random String
    NSString *uuid = [NSUUID UUID].UUIDString;
    NSString * combined = [uuid stringByAppendingString:@".png"];
    //NSLog(@"Random%@", combined);
    
    NSString *imagePath = [documentsDirectory stringByAppendingPathComponent:combined];
    
    // Create new dictionary of user input toy info
    [newDict setObject:itemText.text forKey:@"toyName"];
    [newDict setObject:combined forKey:@"toyImage"];
    [newDict setObject:brandText.text forKey:@"toyBrand"];
    [newDict setObject:priceText.text forKey:@"toyPrice"];
    [newDict setObject:now forKey:@"dateCreated"];
    [newDict setObject:additionalText.text forKey:@"additionalInfo"];
    
    // Add newDict to plistArray and write to Toy.plist file
    [plistArray addObject:newDict];
    [plistArray writeToFile:filePath atomically:YES];
    [pngData writeToFile:imagePath atomically:YES];
    //NSLog(@"image: %@", imagePath);
    
}

@end
