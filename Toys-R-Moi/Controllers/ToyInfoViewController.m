//
//  ToyInfoViewController.m
//  Toys-R-Moi
//
//  Created by Liam  on 2018-10-27.
//  Copyright © 2018 Liam Reardon. All rights reserved.
//

#import "ToyInfoViewController.h"

@interface ToyInfoViewController ()

@end

@implementation ToyInfoViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    toyImageView.image = _toyImage;
    toyNameLabel.text = _toyName;
    toyBrandLabel.text = _toyBrand;
    toyPriceLabel.text = _toyPrice;
    additionalInfoLabel.text = _additionalInfo;
    

}



@end
