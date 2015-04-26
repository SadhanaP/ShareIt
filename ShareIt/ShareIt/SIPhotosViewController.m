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

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"showImage"]) {
        NSArray *indexPaths = [self.collectionView indexPathsForSelectedItems];
        SIImageViewController *imageViewController = segue.destinationViewController;
        NSIndexPath *indexPath = [indexPaths objectAtIndex:0];
        imageViewController.photoImageName = myPhotos[indexPath.row];
        [self.collectionView deselectItemAtIndexPath:indexPath animated:NO];
    }
}


@end
