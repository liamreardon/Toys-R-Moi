//
//  TableViewCell.h
//  Toys-R-Moi
//
//  Created by Liam  on 2018-10-24.
//  Copyright © 2018 Liam Reardon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TableViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface TableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *toyImageView;

@property (strong, nonatomic) IBOutlet UILabel *toyNameLabel;

@property (strong, nonatomic) IBOutlet UILabel *dateCreatedLabel;

@property (strong, nonatomic) IBOutlet UILabel *toyPriceLabel;


@end

NS_ASSUME_NONNULL_END
