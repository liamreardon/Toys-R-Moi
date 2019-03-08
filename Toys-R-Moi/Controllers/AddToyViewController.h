//
//  AddToyViewController.h
//  Toys-R-Moi
//
//  Created by Liam  on 2018-10-23.
//  Copyright © 2018 Liam Reardon. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface AddToyViewController : UIViewController<UIImagePickerControllerDelegate, UINavigationControllerDelegate>
{
    __weak IBOutlet UIImageView *imageView;
    __weak IBOutlet UITextField *itemText;
    __weak IBOutlet UITextField *brandText;
    __weak IBOutlet UITextField *priceText;
    __weak IBOutlet UITextView *additionalText;
    
    UIImagePickerController *imagePicker;
    NSMutableArray *plistArray;
    NSData *pngData;

}
- (IBAction)addToyPhotoPressed:(id)sender;
- (IBAction)addToy:(id)sender;
- (void)saveData;


@end

NS_ASSUME_NONNULL_END
