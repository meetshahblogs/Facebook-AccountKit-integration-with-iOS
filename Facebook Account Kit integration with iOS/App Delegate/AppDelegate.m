//
//  AppDelegate.m
//  Facebook Account Kit integration with iOS
//
//  Created by Meet Shah on 1/20/18.
//  Copyright © 2018 Meet Shah. All rights reserved.
//

#import "AppDelegate.h"
#import "LoginViewController.h"
#import "AccountViewController.h"
#import <AccountKit/AKFSkinManager.h>
#import <AccountKit/AKFViewController.h>

@interface AppDelegate ()

@end

@implementation AppDelegate
@synthesize accountKit;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  
  //Refer to this documentation
  //https://developers.facebook.com/products/account-creation
  //https://developers.facebook.com/docs/accountkit/ios
  
  self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];

  accountKit = [[AKFAccountKit alloc] initWithResponseType: AKFResponseTypeAccessToken];
  if (accountKit.currentAccessToken) {
    AccountViewController *accountViewController = [[AccountViewController alloc] initWithNibName:@"AccountViewController" bundle:nil];
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:accountViewController];
    self.window.rootViewController = navController;
  } else {
    LoginViewController *loginViewController = [[LoginViewController alloc] initWithNibName:@"LoginViewController" bundle:nil];
    self.window.rootViewController = loginViewController;
  }
  [self.window makeKeyAndVisible];
  return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
  // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
  // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
  // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
  // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
  // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
  // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
  // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
