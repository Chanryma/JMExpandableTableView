//
//  ViewController.m
//  JMExpandableTableView
//
//  Created by jonathan ma on 3/11/2016.
//  Copyright © 2016 jonathan ma. All rights reserved.
//

#import "ViewController.h"
#import "ExpandableTableViewSectionView.h"

@interface ViewController ()

@property (nonatomic, strong) NSArray<NSArray<NSString *> *> *dataSource;

@end

@implementation ViewController

-(void)viewDidLoad {
    [super viewDidLoad];
    [self initDataSource];
}

-(void)initDataSource {
    NSInteger sectionCount = 4;
    NSInteger rowCount = 10;

    NSMutableArray *sections = [NSMutableArray arrayWithCapacity:0];
    for (int section = 0; section < sectionCount; section ++) {
        NSMutableArray *rows = [NSMutableArray arrayWithCapacity:0];
        for (int i = 0; i < rowCount; i ++) {
            [rows addObject:[NSString stringWithFormat:@"This is row %d in section %d", i, section]];
        }
        [sections addObject:rows];
    }

    _dataSource = [NSArray arrayWithArray:sections];
}

#pragma mark- TableView Delegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return _dataSource.count;
}

-(BOOL)expTableView:(UITableView *)tableView expandSectionByDefault:(NSInteger)section {
    return section == 2; // expand the section 2 by default
}

-(NSInteger)expTableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_dataSource objectAtIndex:section].count;
}

-(id<SectionViewDelegate>)expTableView:(UITableView *)tableView sectionViewInSection:(NSInteger)section {
    CGRect frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 50);
    ExpandableTableViewSectionView *tmpView = [[ExpandableTableViewSectionView alloc] initWithFrame:frame];
    tmpView.tableView = tableView;
    tmpView.title = [NSString stringWithFormat:@"Section->%ld", section];
    tmpView.expandImage = [UIImage imageNamed:@"arrow_down"];
    tmpView.collapseImage = [UIImage imageNamed:@"arrow_up"];
    tmpView.expandByDefault = [self expTableView:tableView expandSectionByDefault:section];
    [tmpView setup];
    
    return tmpView;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellId = @"cellId";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    cell.textLabel.text = [[_dataSource objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];

    return cell;
}

@end
