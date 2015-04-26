//
//  SIPhotosViewController.m
//  ShareIt
//
//  Created by student on 4/25/15.
//  Copyright (c) 2015 Example. All rights reserved.
//

#import "SIPhotosViewController.h"
#import "SIImageViewController.h"
#import "SIUploadPhotoViewController.h"

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

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{

    SIImageViewController *imageViewController = [[self storyboard] instantiateViewControllerWithIdentifier:@"SIImageViewController"];
    imageViewController.userID = self.userID;
    imageViewController.albumID = self.albumID;
    imageViewController.photoID = [@(indexPath.row)description];
    imageViewController.photoImageName = myPhotos[indexPath.row];
    [self.navigationController pushViewController:imageViewController animated:YES];
    
}

- (IBAction)addMoreButton:(id)sender {
    
    SIUploadPhotoViewController *uploadController = [[self storyboard] instantiateViewControllerWithIdentifier:@"SIUploadPhotoViewController"];
    uploadController.userID = self.userID;
    uploadController.albumID = self.albumID;
    [self.navigationController pushViewController:uploadController animated:YES];
}

@end
