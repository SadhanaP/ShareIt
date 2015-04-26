//
//  SIImageViewController.m
//  ShareIt
//
//  Created by student on 4/25/15.
//  Copyright (c) 2015 Example. All rights reserved.
//

#import "SIImageViewController.h"

@implementation SIImageViewController
-(void) viewDidLoad{
//    _displayImage.image=[UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:@"http://www.appcoda.com/wp-content/uploads/2013/04/Camera-App-Main-Screen.jpg"]]];
    [super viewDidLoad];
    self.displayImage.image = [UIImage imageNamed:self.photoImageName];
    
}


@end
