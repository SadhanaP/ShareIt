//
//  SISearchPhotosController.h
//  ShareIt
//
//  Created by Saikrishna on 4/29/15.
//  Copyright (c) 2015 Example. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SISearchPhotosController : UITableViewController <UISearchResultsUpdating, UISearchControllerDelegate>


@property (strong, nonatomic) UISearchController *searchController;
@property (strong, nonatomic) UITableViewController *searchResultsTableViewController;
@property (weak, nonatomic) IBOutlet UITableView *myTable;
@property (strong, nonatomic) NSArray *results;

@end
