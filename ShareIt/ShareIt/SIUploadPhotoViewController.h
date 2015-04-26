//
//  SIUploadPhotoViewController.h
//  ShareIt
//
//  Created by student on 4/26/15.
//  Copyright (c) 2015 Example. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SIUploadPhotoViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *imageUploadView;
@property(nonatomic) NSData *userID;
@property(nonatomic) NSString *albumID;

- (IBAction)choosePhoto:(id)sender;
- (IBAction)uploadToServer:(id)sender;

@end
