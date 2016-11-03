//
//  BaseExpandableTableViewController.h
//  JMExpandableTableView
//
//  Created by jonathan ma on 3/11/2016.
//  Copyright © 2016 jonathan ma. All rights reserved.
//

#import "BaseTableViewController.h"

@interface BaseExpandableTableViewController : BaseTableViewController

/**
 *  View controllers inheriting BaseExpandableTableViewController override this method to return the count of rows in a section. Do not implement the 'numberOfRowsInSection' method in conrete view controllers.
 *
 *  @param tableView table view
 *  @param section   section
 *
 *  @return number of rows in section
 */
-(NSInteger)expTableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
/**
 Override this method and return YES if a section should be expanded by default.
 @param tableView table view
 @param section section
 @return YES if a section should be expadned by default.
 */
-(BOOL)expTableView:(UITableView *)tableView expandSectionByDefault:(NSInteger)section;
/**
 Override this method to provide section title.

 @param tableView table view
 @param section section
 @return section title
 */
-(NSString *)expTableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section;

@end
