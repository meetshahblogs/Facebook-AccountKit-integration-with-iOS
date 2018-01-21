//
//  AppDelegate.h
//  Facebook Account Kit integration with iOS
//
//  Created by Meet Shah on 1/20/18.
//  Copyright © 2018 Meet Shah. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AccountKit/AKFAccountKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate, AKFViewControllerDelegate>

@property (strong, nonatomic) UIWindow *window;
@property AKFAccountKit *accountKit;


@end

