//
//  AppDelegate.h
//  showButton
//
//  Created by 张超 on 2020/4/20.
//  Copyright © 2020 张超. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

