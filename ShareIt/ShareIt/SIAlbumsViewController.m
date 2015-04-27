//
//  SIAlbumsViewController.m
//  ShareIt
//
//  Created by student on 4/25/15.
//  Copyright (c) 2015 Example. All rights reserved.
//

#import "SIAlbumsViewController.h"
#import "SIPhotosViewController.h"

#import "SIUploadPhotoViewController.h"

@implementation SIAlbumsViewController
{
    NSArray *tableData;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    _myTable.dataSource=self;
    
    NSLog(@"%@",_userID);
    tableData = [NSArray arrayWithObjects:@"Default", @"Profile Pics", @"Uploads", nil];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [tableData count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"SimpleTableItem";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    cell.textLabel.text = [tableData objectAtIndex:indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
        
//        NSString *selectedRowInfo = @"You've selected a row : ";
//        
//        selectedRowInfo = [selectedRowInfo stringByAppendingString:[@(indexPath.row)description]];
//        
//        UIAlertView *messageAlert = [[UIAlertView alloc]
//         
//        initWithTitle:@"Row Selected" message:selectedRowInfo delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
//    
//    // Display Alert Message
//    
//    [messageAlert show];
//    
//}
//
//    UIAlertView *messageAlert = [[UIAlertView alloc]
//                                 initWithTitle:@"Row Selected" message:@"You've selected a row" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
//    UITableViewCell *cell = [tableData objectAtIndex:indexPath.row];
//    NSString *str = cell.textLabel.text;
//    NSLog(@"%@",str);
//     Display Alert Message
//    [messageAlert show];
    SIPhotosViewController *photoController = [[self storyboard] instantiateViewControllerWithIdentifier:@"SIPhotosViewController"];
    photoController.userID = self.userID;
    photoController.albumID = [@(indexPath.row)description];
    [self.navigationController pushViewController:photoController animated:YES];

    }

- (IBAction)addAlbum:(id)sender {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Enter Album Name"
                                                    message:@"  "
                                                   delegate:self
                                          cancelButtonTitle:@"Cancel"
                                          otherButtonTitles:@"OK", nil];
    alert.alertViewStyle = UIAlertViewStylePlainTextInput;
    [alert show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 1) {
        NSString *name = [alertView textFieldAtIndex:0].text;
        NSLog(@"%@",name);
        [self didFinishLoadingwithData:[NSArray arrayWithObjects:@"Default", @"Profile Pics", @"Uploads", @"New", nil]];
    }
}

-(void) didFinishLoadingwithData:(NSArray*) data {
    tableData = data;
    [self.tableView reloadData];
}


@end

