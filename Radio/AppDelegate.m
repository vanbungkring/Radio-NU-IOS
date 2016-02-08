//
//  AppDelegate.m
//  Radio
//
//  Created by Arie on 12/5/15.
//  Copyright © 2015 Dalvk Studio. All rights reserved.
//

#import "AppDelegate.h"
#import "HomeViewController.h"
#import "VanNavigationController.h"
#import "ScheduleDataModels.h"
#import <Fabric/Fabric.h>
#import <AVFoundation/AVFoundation.h>
#import <Crashlytics/Crashlytics.h>
#import <DKNightVersion.h>
#import <AFNetworkActivityLogger/AFNetworkActivityLogger.h>
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [Fabric with:@[[Crashlytics class]]];

   [DKNightVersionManager nightFalling];
    
    [[AFNetworkActivityLogger sharedLogger] startLogging];
    [AFNetworkActivityLogger sharedLogger].level = AFLoggerLevelDebug;
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    HomeViewController *homeViewControllers = [[HomeViewController alloc]initWithNibName:@"HomeViewController" bundle:nil];
    VanNavigationController *navigationController = [[VanNavigationController alloc]initWithRootViewController:homeViewControllers];
    self.window.rootViewController  = navigationController;
    [self.window makeKeyAndVisible];
    
    NSError* error;
    
    [[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategoryPlayback error:&error];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    [[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategoryPlayback error:nil];
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    [[UIApplication sharedApplication] beginReceivingRemoteControlEvents];
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
