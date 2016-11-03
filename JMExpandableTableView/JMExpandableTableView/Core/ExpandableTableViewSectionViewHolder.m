//
//  ExpandableTableViewSectionViewHolder.m
//  XinAo
//
//  Created by jonathan ma on 21/3/2016.
//  Copyright © 2016 ECity. All rights reserved.
//

#import "ExpandableTableViewSectionViewHolder.h"
#import "ExpandableTableViewSectionView.h"

@interface ExpandableTableViewSectionViewHolder ()

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) ExpandableTableViewSectionView *sectionView;
@property (nonatomic, assign) BOOL isExpanded;

@end

@implementation ExpandableTableViewSectionViewHolder

+(ExpandableTableViewSectionViewHolder *)instanceWithTableView:(UITableView *)tableView title:(NSString *)title expand:(BOOL)expand {
    ExpandableTableViewSectionViewHolder *instance = [[ExpandableTableViewSectionViewHolder alloc] init];

    CGRect frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 50);
    ExpandableTableViewSectionView *sectionView = [[ExpandableTableViewSectionView alloc] initWithFrame:frame];
    instance.tableView = tableView;
    instance.title = title;
    sectionView.title = title;
    sectionView.expandImage = [UIImage imageNamed:@"arrow_down"];
    sectionView.collapseImage = [UIImage imageNamed:@"arrow_up"];
    sectionView.expandByDefault = expand;
    [sectionView setup];
    instance.isExpanded = expand;
    instance.sectionView = sectionView;
    [instance setToggleListener];

    return instance;
}

-(void)setToggleListener {
    UITapGestureRecognizer *listener = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(toggleVisiblitity)];
    listener.numberOfTapsRequired = 1;
    [_sectionView addGestureRecognizer:listener];
}

-(void)toggleVisiblitity {
    _isExpanded = !_isExpanded;
    [_sectionView expand:_isExpanded];
    [_tableView reloadData];
}

-(UIView *)view {
    return _sectionView;
}

-(BOOL)isExpanded {
    return _isExpanded;
}

@end
