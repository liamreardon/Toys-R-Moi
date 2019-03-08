//
//  AppDelegate.h
//  Toys-R-Moi
//
//  Created by Liam  on 2018-10-23.
//  Copyright © 2018 Liam Reardon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

