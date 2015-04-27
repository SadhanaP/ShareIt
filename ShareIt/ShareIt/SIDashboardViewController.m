//
//  SIDashboardViewController.m
//  ShareIt
//
//  Created by student on 4/25/15.
//  Copyright (c) 2015 Example. All rights reserved.
//

#import "SIDashboardViewController.h"
#import "SIAlbumsViewController.h"
#import "SIMainViewController.h"
#import "AFNetworking.h"


@implementation SIDashboardViewController

static NSString * const registerUserURL=@"http://52.8.15.49:8080/photoshare/api/v1/users";

- (void) tapped

{
    [self.view endEditing:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // scroll view
    self.scrollView.contentSize = CGSizeMake(320, 700);
    
    UITapGestureRecognizer *tapScroll = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapped)];
    tapScroll.cancelsTouchesInView = NO;
    [_scrollView addGestureRecognizer:tapScroll];
    
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
             
             NSLog(@"%@",result[@"id"]);
             _uid=result[@"id"];
             NSLog(@"%@",result[@"name"]);
             self.nameLabel.text=result[@"name"];
             
             
             
             NSLog(@"%@",@"Trying to post now");
             
             //step one generate url to post
             
             
             //NSURL *url1 = [NSURL URLWithString:registerUserURL];
             
             //NSURLRequest *request1 = [NSURLRequest requestWithURL:url1];
             
             // step two generate manager
             
             
             
             AFHTTPRequestOperationManager *newManager = [AFHTTPRequestOperationManager manager];
             
             newManager.requestSerializer=[AFJSONRequestSerializer serializer];
             
             
//             
//             NSDictionary *paramerters = @{@"name": @"Mehta",
//                                           
//                                           @"userid": @"123123123"};
             
             NSString *userId=result[@"id"];
             NSString *name=result[@"name"];
             NSString *email=@"zeemailed@gmail.com";//result[@"email"];
             NSString *profilepicUrl=@"https://scontent-sjc.xx.fbcdn.net/hphotos-xpa1/v/t1.0-9/11175039_10204183846379980_8504874013859376394_n.jpg?oh=3994c47505e1844d05f4add7c6ff201b&oe=55D6EB38";
             
             NSDictionary *jsonSignUpDictionary = @{@"userId":userId, @"name":name, @"email":email, @"profilepicUrl":profilepicUrl};
             
             
             
             NSLog(@"Dictionary: %@", [jsonSignUpDictionary description]);
             
             [newManager POST:registerUserURL parameters:jsonSignUpDictionary success:^(AFHTTPRequestOperation *operation, id responseObject) {
                 
                 NSLog(@"JSON: %@", responseObject);
                 
             } failure:^(AFHTTPRequestOperation *operation, NSError *errorr) {
                 
                 NSLog(@"Error: %@", errorr);
                 
             }];
             
             
             
             
             
             
         }
         else{
             
             NSLog(@"errrrror");
         }
     }];
}



- (IBAction)displayAlbums:(id)sender {
    SIAlbumsViewController *albumsController = [[self storyboard] instantiateViewControllerWithIdentifier:@"SIAlbumsViewController"];
    albumsController.userID = _uid;
    [self.navigationController pushViewController:albumsController animated:YES];
}
@end
