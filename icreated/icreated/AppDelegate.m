//
//  AppDelegate.m
//  icreated
//
//  Created by Artem Lobanov on 17/10/14.
//  Copyright (c) 2014 pispbsu. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
//     Override point for customization after application launch.
    [self setUIOptions];    
    
    [EventUpdater setManagedObjectContext:self.managedObjectContext];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

#pragma mark - UI Options method

- (void)setUIOptions {
    [[UINavigationBar appearance] setBarTintColor:[UIColor colorWithRed:192.0f / 255.0f
                                                                  green:57.0f / 255.0f
                                                                   blue:43.0f / 255.0f
                                                                  alpha:1]];

    [[UISegmentedControl appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}
                                                   forState:UIControlStateSelected];

    [[UISegmentedControl appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor whiteColor],
                                                              NSFontAttributeName:[UIFont boldSystemFontOfSize:12.0f]}
                                                   forState:UIControlStateNormal];

    [[UISegmentedControl appearance] setTintColor:[UIColor colorWithRed:192.0f / 255.0f
                                                                  green:57.0f / 255.0f
                                                                   blue:43.0f / 255.0f
                                                                  alpha:1]];

    NSDictionary *barButtonAttributes = @{NSForegroundColorAttributeName:[UIColor whiteColor],
                                          NSFontAttributeName:[UIFont fontWithName:@"FontAwesome" size:26.0]};
    [[UIBarButtonItem appearanceWhenContainedIn:[UINavigationBar class], nil] setTitleTextAttributes:barButtonAttributes
                                                                                            forState:UIControlStateNormal];

    // For vertical alignment of SegmentControl and UITabBarItems (buttons)
//    [[UINavigationBar appearance] setTitleVerticalPositionAdjustment:0 forBarMetrics:UIBarMetricsDefault];

}

#pragma mark - Core Data methods

- (NSManagedObjectContext *)managedObjectContext {
    if (_managedObjectContext) {
        return _managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (coordinator) {
        _managedObjectContext = [[NSManagedObjectContext alloc] init];
        [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    }
    
    return _managedObjectContext;
}

- (NSManagedObjectModel *)managedObjectModel {
    if (_managedObjectModel) {
        return _managedObjectModel;
    }
    
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"Model" withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}


- (NSPersistentStoreCoordinator *)persistentStoreCoordinator
{
    if (_persistentStoreCoordinator != nil) {
        return _persistentStoreCoordinator;
    }
    
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"icreatedDB.sqlite"];
    
    NSError *error = nil;
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
        /*
         Replace this implementation with code to handle the error appropriately.
         
         abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
         
         If you encounter schema incompatibility errors during development, you can reduce their frequency by:
         * Simply deleting the existing store:
         [[NSFileManager defaultManager] removeItemAtURL:storeURL error:nil];
         
         */
        
//        [[NSFileManager defaultManager] removeItemAtURL:storeURL error:nil];
        
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    
    return _persistentStoreCoordinator;
}

- (NSURL *)applicationDocumentsDirectory
{
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}





@end
