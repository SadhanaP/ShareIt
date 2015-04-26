//
//  SIImageViewController.h
//  ShareIt
//
//  Created by student on 4/25/15.
//  Copyright (c) 2015 Example. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <FBSDKShareKit/FBSDKShareKit.h>
#import <MessageUI/MessageUI.h>


@interface SIImageViewController : UIViewController <MFMailComposeViewControllerDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *displayImage;
@property (weak, nonatomic) NSString *photoImageName;
@property(nonatomic) NSData *userID;
@property(nonatomic) NSString *photoID;
@property(nonatomic) NSString *albumID;
- (IBAction)sharePic:(id)sender;

@end
