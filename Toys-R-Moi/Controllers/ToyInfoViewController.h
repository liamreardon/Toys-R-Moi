//
//  ToyInfoViewController.h
//  Toys-R-Moi
//
//  Created by Liam  on 2018-10-27.
//  Copyright © 2018 Liam Reardon. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ToyInfoViewController : UIViewController {
    
    __weak IBOutlet UIImageView *toyImageView;
    __weak IBOutlet UILabel *toyNameLabel;
    __weak IBOutlet UILabel *toyBrandLabel;
    __weak IBOutlet UILabel *toyPriceLabel;
    __weak IBOutlet UILabel *additionalInfoLabel;
}

@property (nonatomic, retain) UIImage *toyImage;
@property (nonatomic, retain) NSString *toyName;
@property (nonatomic, retain) NSString *toyBrand;
@property (nonatomic, retain) NSString *toyPrice;
@property (nonatomic, retain) NSString *additionalInfo;




@end

NS_ASSUME_NONNULL_END
