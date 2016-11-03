//
//  BaseExpandableTableViewController.m
//  JMExpandableTableView
//
//  Created by jonathan ma on 3/11/2016.
//  Copyright © 2016 jonathan ma. All rights reserved.
//

#import "BaseExpandableTableViewController.h"
#import "ExpandableTableViewSectionViewHolder.h"

@interface BaseExpandableTableViewController ()

@property (nonatomic, strong) NSMutableDictionary<NSString *, ExpandableTableViewSectionViewHolder *> *section2SectionViews;
/**
 第一次加载是否已完成。用于控制部分section默认展开。
 */
@property (nonatomic, assign) BOOL isFistLoadingFinished;

@end

@implementation BaseExpandableTableViewController

#pragma mark- TableView Delegate
-(NSString *)expTableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return nil;
}

-(NSInteger)expTableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}

-(BOOL)expTableView:(UITableView *)tableView expandSectionByDefault:(NSInteger)section {
    return NO;
}

#pragma mark- TableView
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    ExpandableTableViewSectionViewHolder *holder = [self tableView:tableView sectionViewHolderInSection:section];
    return (holder.title.length == 0) ? 0 : holder.view.frame.size.height;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    NSString *title = [self expTableView:tableView titleForHeaderInSection:section];
    if (title.length == 0) {
        return nil;
    }
    
    ExpandableTableViewSectionViewHolder *holder = [self tableView:tableView sectionViewHolderInSection:section];
    return holder.view;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    ExpandableTableViewSectionViewHolder *holder = [self tableView:tableView sectionViewHolderInSection:section];
    UIView *sectionView = [self tableView:tableView viewForHeaderInSection:section];
    if (!sectionView || holder.isExpanded) {
        return [self expTableView:tableView numberOfRowsInSection:section];
    } else {
        return 0;
    }
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    if([indexPath row] == ((NSIndexPath*)[[tableView indexPathsForVisibleRows] lastObject]).row){
        // Check if Table View has finished its first loading. Refer to http://stackoverflow.com/questions/4163579/how-to-detect-the-end-of-loading-of-uitableview
        _isFistLoadingFinished = YES;
    }
}

-(ExpandableTableViewSectionViewHolder *)tableView:(UITableView *)tableView sectionViewHolderInSection:(NSInteger)section {
    if (!_section2SectionViews) {
        _section2SectionViews = [NSMutableDictionary dictionaryWithCapacity:0];
    }
    
    BOOL expandByDefault = [self expTableView:tableView expandSectionByDefault:section];
    expandByDefault = (!_isFistLoadingFinished && expandByDefault);
    NSString *title = [self expTableView:tableView titleForHeaderInSection:section];
    NSString *key = [NSString stringWithFormat:@"%ld", (long)section];
    ExpandableTableViewSectionViewHolder *holder = [_section2SectionViews objectForKey:key];
    if (!holder) {
        holder = [ExpandableTableViewSectionViewHolder instanceWithTableView:tableView title:title expand:expandByDefault];
        [_section2SectionViews setObject:holder forKey:key];
    } else {
        holder.title = title;
    }

    return holder;
}


@end
