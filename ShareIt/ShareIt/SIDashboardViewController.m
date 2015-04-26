//
//  SIDashboardViewController.m
//  ShareIt
//
//  Created by student on 4/25/15.
//  Copyright (c) 2015 Example. All rights reserved.
//

#import "SIDashboardViewController.h"
#import "SIMainViewController.h"

@implementation SIDashboardViewController

-(void) viewDidLoad{
    
    NSLog(@"%@",_myAccessToken);
    
    if(_myAccessToken){
        NSLog(@"Hello There");
        [self returnUserProfileData];
        // [self returnUserFriendsData];
        //  [self inviteFriends:tableData];
        
        
    }
}

-(void) returnUserProfileData {
    [[[FBSDKGraphRequest alloc] initWithGraphPath:@"me" parameters:@{@"fields": @"name, email"}]
     
     startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection, id result, NSError *error) {
         if (!error) {
             NSLog( @"%@",result);
             //NSLog(@"Email: %@",[result objectForKey:@"email"]);
             //  NSLog(@"First Name : %@",[result objectForKey:@"name"]);
             
             NSLog(@"fetched user name :%@  and Email : %@", result[@"name"],result[@"email"]);
             //                   lblUsername.text = @"hjkhkjh";
             FBSDKProfilePictureView *profilePictureview = [[FBSDKProfilePictureView alloc]init];
             [profilePictureview setProfileID:result[@"id"]];
             [self.view addSubview:profilePictureview];
             
             NSLog(@"%@",result[@"name"]);
             self.nameLabel.text=result[@"name"];
         }
         else{
             
             NSLog(@"errrrror");
         }
     }];
}



@end
