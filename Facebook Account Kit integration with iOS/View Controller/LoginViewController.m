//
//  LoginViewController.m
//  Facebook Account Kit integration with iOS
//
//  Created by Meet Shah on 1/20/18.
//  Copyright © 2018 Meet Shah. All rights reserved.
//

#import "LoginViewController.h"
#import "AccountViewController.h"
#import <AccountKit/AKFViewController.h>
#import <AccountKit/AccountKit.h>

@interface LoginViewController ()<AKFViewControllerDelegate>
@end

@implementation LoginViewController
{
  AKFAccountKit *_accountKit;
  NSString *_authorizationCode;
  UIViewController<AKFViewController> *_pendingLoginViewController;
}

#pragma mark - View Management
- (void)viewDidLoad {
  [super viewDidLoad];
  
  _accountKit = [[AKFAccountKit alloc] initWithResponseType:AKFResponseTypeAccessToken];
  //  NSLog(@"%@", _accountKit.currentAccessToken.accountID);
  
  _pendingLoginViewController = [_accountKit viewControllerForLoginResume];
}

-(void) viewWillAppear:(BOOL)animated {
  [super viewWillAppear: animated];
  if (_accountKit.currentAccessToken) {
    AccountViewController *accountViewController = [[AccountViewController alloc] initWithNibName:@"AccountViewController" bundle:nil];
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:accountViewController];
    accountViewController.navigationItem.title = @"My Account";
    [self presentViewController:navController animated:YES completion:nil];
  } else if (_pendingLoginViewController != nil) {
    [self _prepareLoginViewController:_pendingLoginViewController];
    [self presentViewController:_pendingLoginViewController animated:animated completion:NULL];
    _pendingLoginViewController = nil;
  }
}
- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
}


#pragma mark - Actions

- (IBAction)loginWithPhone:(id)sender {
  UIViewController<AKFViewController> *viewController = [_accountKit viewControllerForPhoneLoginWithPhoneNumber:nil
                                                                                                          state:nil];
  [self _prepareLoginViewController:viewController];
  [self presentViewController:viewController animated:YES completion:NULL];
}

#pragma mark - AKFViewControllerDelegate;

- (void)viewController:(UIViewController<AKFViewController> *)viewController didCompleteLoginWithAccessToken:(id<AKFAccessToken>)accessToken state:(NSString *)state
{
  NSLog(@"%@", accessToken.accountID);
  //Take user to next view.
}

- (void)viewController:(UIViewController<AKFViewController> *)viewController didFailWithError:(NSError *)error
{
  NSLog(@"%@ did fail with error: %@", viewController, error);
}

#pragma mark - Helper Methods

- (void)_prepareLoginViewController:(UIViewController<AKFViewController> *)loginViewController
{
  loginViewController.delegate = self;
  loginViewController.uiManager = [[AKFSkinManager alloc] initWithSkinType:AKFSkinTypeClassic primaryColor:[UIColor blueColor]];
}



- (IBAction)loginWithEmail:(id)sender {
  NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
  NSString *email = [prefs stringForKey:@"email"];
  NSString *inputState = [[NSUUID UUID] UUIDString];
  UIViewController<AKFViewController> *viewController = [_accountKit viewControllerForEmailLoginWithEmail:email state:inputState];
  [self _prepareLoginViewController:viewController];
  [self presentViewController:viewController animated:YES completion:NULL];
}
@end
