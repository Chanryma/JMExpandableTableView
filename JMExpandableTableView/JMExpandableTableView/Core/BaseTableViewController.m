//
//  BaseTableViewController.m
//  JMExpandableTableView
//
//  Created by jonathan ma on 3/11/2016.
//  Copyright © 2016 jonathan ma. All rights reserved.
//

#import "BaseTableViewController.h"

@interface BaseTableViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tvRecord;

@end

@implementation BaseTableViewController

-(void)viewDidLoad {
    [super viewDidLoad];
    [self initTableView];
}

-(void)initTableView {
    CGRect frame = CGRectMake(0, 20, self.view.frame.size.width, self.view.frame.size.height - 20);
    _tvRecord = [[UITableView alloc] initWithFrame:frame style:UITableViewStylePlain];
    _tvRecord.delegate = self;
    _tvRecord.dataSource = self;
    [self.view addSubview:_tvRecord];
}

#pragma mark- TableView Delegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return nil;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [self tableView:tableView cellForRowAtIndexPath:indexPath].frame.size.height;
}

@end
