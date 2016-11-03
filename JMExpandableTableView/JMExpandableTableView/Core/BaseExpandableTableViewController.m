//
//  BaseExpandableTableViewController.m
//  JMExpandableTableView
//
//  Created by jonathan ma on 3/11/2016.
//  Copyright © 2016 jonathan ma. All rights reserved.
//

#import "BaseExpandableTableViewController.h"
#import "ExpandableTableViewSectionView.h"

@interface BaseExpandableTableViewController ()

@property (nonatomic, strong) NSMutableDictionary<NSString *, id<SectionViewDelegate>> *section2SectionViews;
/**
 Check if first loading is finished.
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
    return [[self tableView:tableView sectionViewInSection:section] view].frame.size.height;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    NSString *title = [self expTableView:tableView titleForHeaderInSection:section];
    return (title.length == 0) ? nil : [[self tableView:tableView sectionViewInSection:section] view];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    id<SectionViewDelegate> sectionView = [self tableView:tableView sectionViewInSection:section];
    return sectionView.isExpanded ? [self expTableView:tableView numberOfRowsInSection:section] : 0;
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    if([indexPath row] == ((NSIndexPath*)[[tableView indexPathsForVisibleRows] lastObject]).row){
        // Check if Table View has finished its first loading. Refer to http://stackoverflow.com/questions/4163579/how-to-detect-the-end-of-loading-of-uitableview
        _isFistLoadingFinished = YES;
    }
}

-(id<SectionViewDelegate>)tableView:(UITableView *)tableView sectionViewInSection:(NSInteger)section {
    if (!_section2SectionViews) {
        _section2SectionViews = [NSMutableDictionary dictionaryWithCapacity:0];
    }

    NSString *title = [self expTableView:tableView titleForHeaderInSection:section];
    NSString *key = [NSString stringWithFormat:@"%ld", (long)section];
    id<SectionViewDelegate> sectionView = [_section2SectionViews objectForKey:key];
    if (!sectionView) {
        sectionView = [self provideYourSectionView:tableView title:title section:section];;
        [_section2SectionViews setObject:sectionView forKey:key];
    }

    return sectionView;
}

-(id<SectionViewDelegate>)provideYourSectionView:(UITableView *)tableView title:(NSString *)title section:(NSInteger)section {
    CGRect frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 50);
    ExpandableTableViewSectionView *tmpView = [[ExpandableTableViewSectionView alloc] initWithFrame:frame];
    tmpView.tableView = tableView;
    tmpView.title = title;
    tmpView.expandImage = [UIImage imageNamed:@"arrow_down"];
    tmpView.collapseImage = [UIImage imageNamed:@"arrow_up"];
    tmpView.expandByDefault = (!_isFistLoadingFinished && [self expTableView:tableView expandSectionByDefault:section]);
    [tmpView setup];
    
    return tmpView;
}

@end
