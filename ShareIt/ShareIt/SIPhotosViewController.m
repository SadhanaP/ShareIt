//
//  SIPhotosViewController.m
//  ShareIt
//
//  Created by student on 4/25/15.
//  Copyright (c) 2015 Example. All rights reserved.
//

#import "SIPhotosViewController.h"
#import "SIImageViewController.h"

@implementation SIPhotosViewController{
    NSArray *myPhotos;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Initialize recipe image array
    myPhotos = [NSArray arrayWithObjects:@"Goofy.png", @"Liking.png", @"Viking.png", nil];
    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return myPhotos.count;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"Cell";
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    
    UIImageView *photoImageView = (UIImageView *)[cell viewWithTag:100];
    photoImageView.image = [UIImage imageNamed:[myPhotos objectAtIndex:indexPath.row]];
    
    return cell;
}
//
//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//    if ([segue.identifier isEqualToString:@"showImage"]) {
//        NSArray *indexPaths = [self.collectionView indexPathsForSelectedItems];
//        SIImageViewController *imageViewController = segue.destinationViewController;
//        NSIndexPath *indexPath = [indexPaths objectAtIndex:0];
//        imageViewController.photoImageName = myPhotos[indexPath.row];
//        [self.collectionView deselectItemAtIndexPath:indexPath animated:NO];
//    }
//}


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
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
    SIImageViewController *imageViewController = [[self storyboard] instantiateViewControllerWithIdentifier:@"SIImageViewController"];
//  //
    imageViewController.userID = self.userID;
    imageViewController.albumID = self.albumID;
    imageViewController.photoID = [@(indexPath.row)description];
    imageViewController.photoImageName = myPhotos[indexPath.row];
    [self.navigationController pushViewController:imageViewController animated:YES];
    
}



@end
