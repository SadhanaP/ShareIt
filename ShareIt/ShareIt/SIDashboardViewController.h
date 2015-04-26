//
//  SIDashboardViewController.h
//  ShareIt
//
//  Created by student on 4/25/15.
//  Copyright (c) 2015 Example. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import <FBSDKCoreKit/FBSDKCoreKit.h>

#import <FBSDKShareKit/FBSDKShareKit.h>

@interface SIDashboardViewController : UIViewController


@property (nonatomic, weak) IBOutlet UILabel *nameLabel;
@property(nonatomic) NSString *_temp;

@property(nonatomic) NSData *uid;

@property(nonatomic) FBSDKAccessToken *myAccessToken;

- (IBAction)displayAlbums:(id)sender;

@property (weak, nonatomic) IBOutlet FBSDKProfilePictureView *profilePicture;

@end
