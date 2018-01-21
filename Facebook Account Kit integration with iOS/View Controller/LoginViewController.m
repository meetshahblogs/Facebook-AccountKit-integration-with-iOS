//
//  LoginViewController.m
//  Facebook Account Kit integration with iOS
//
//  Created by Meet Shah on 1/20/18.
//  Copyright © 2018 Meet Shah. All rights reserved.
//

#import "LoginViewController.h"
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
  
  if (_accountKit == nil) {
    _accountKit = [[AKFAccountKit alloc] initWithResponseType:AKFResponseTypeAccessToken];
  }
  
  _pendingLoginViewController = [_accountKit viewControllerForEmailLogin];
}

-(void) viewWillAppear:(BOOL)animated {
  [super viewWillAppear: animated];

  if (_pendingLoginViewController != nil) {
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
  loginViewController.uiManager = [[AKFSkinManager alloc] initWithSkinType:AKFSkinTypeClassic];
}



- (IBAction)loginWithEmail:(id)sender {
  UIViewController<AKFViewController> *viewController = [_accountKit viewControllerForEmailLoginWithEmail:nil
                                                                                                    state:nil];
  [self _prepareLoginViewController:viewController];
  [self presentViewController:viewController animated:YES completion:NULL];
}
@end
