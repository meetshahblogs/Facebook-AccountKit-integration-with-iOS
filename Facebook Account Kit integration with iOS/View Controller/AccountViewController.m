//
//  AccountViewController.m
//  Facebook Account Kit integration with iOS
//
//  Created by Meet Shah on 1/20/18.
//  Copyright © 2018 Meet Shah. All rights reserved.
//

#import "AccountViewController.h"
#import <AccountKit/AccountKit.h>

@interface AccountViewController ()

@end

@implementation AccountViewController {
  AKFAccountKit *_accountKit;
}

- (void)viewDidLoad {
  [super viewDidLoad];
}

-(void) viewWillAppear:(BOOL)animated {
  [super viewWillAppear:animated];
  
  if (_accountKit == nil) {
    _accountKit = [[AKFAccountKit alloc] initWithResponseType:AKFResponseTypeAccessToken];
    [_accountKit requestAccount:^(id<AKFAccount> account, NSError *error) {
//      if (error != nil) {
//        self.accountIDLabel.text = @"N/A";
//        self.titleLabel.text = @"Error";
//        self.valueLabel.text = [error description];
//      } else {
//        self.accountIDLabel.text = account.accountID;
//        if ([account.emailAddress length] > 0) {
//          self.titleLabel.text = @"Email Address";
//          self.valueLabel.text = account.emailAddress;
//        } else if ([account phoneNumber] != nil) {
//          self.titleLabel.text = @"Phone Number";
//          self.valueLabel.text = [account.phoneNumber stringRepresentation];
//        }
//      }
    }];
  }
  
}
- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
}

#pragma mark - Helper Methods
- (void)logout:(id)sender
{
  [_accountKit logOut];
  [self.navigationController popToRootViewControllerAnimated:YES];
}

@end
