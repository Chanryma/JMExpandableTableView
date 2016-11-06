//
//  ExpandableTableViewSectionView.h
//  JMExpandableTableView
//
//  Created by jonathan ma on 3/11/2016.
//  Copyright © 2016 jonathan ma. All rights reserved.
//

#import "SectionViewDelegate.h"

/**
 Default section view implementation. You can 
 */
@interface DefaultTableViewSectionView : UIView <SectionViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, assign) BOOL expandByDefault;
@property (nonatomic, strong) UIImage *expandImage;
@property (nonatomic, strong) UIImage *collapseImage;

-(void)setup;

@end
