# JMExpandableTableView
A simple-to-integrate and easy-to-use expandable table view, for iOS.

# How to Use

You will find the implementation quite straigtforward.

1. Provide your own implmentation of SectionViewDelegate.
2. Your controller inherit ```BaseExpandableTableViewController```.
3. Override following 5 methods in your view controller.
```
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView;
-(BOOL)expTableView:(UITableView *)tableView expandSectionByDefault:(NSInteger)section;
-(NSInteger)expTableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
-(id<SectionViewDelegate>)expTableView:(UITableView *)tableView sectionViewInSection:(NSInteger)section;
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
```

That is it!
