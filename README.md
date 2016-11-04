# JMExpandableTableView
A simple-to-integrate expandable table view, for iOS.

# How to Use

You will find the implementation quite straigtforward.

1. Copy the ```Core``` folder into your project.
2. Provide your own section view by implmenting ```SectionViewDelegate```.
3. Make your controller inherit ```BaseExpandableTableViewController```.
4. Make your controller override following 5 methods in your view controller.

```
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView;
-(BOOL)expTableView:(UITableView *)tableView expandSectionByDefault:(NSInteger)section;
-(NSInteger)expTableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
-(id<SectionViewDelegate>)expTableView:(UITableView *)tableView sectionViewInSection:(NSInteger)section;
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
```

That's it!
