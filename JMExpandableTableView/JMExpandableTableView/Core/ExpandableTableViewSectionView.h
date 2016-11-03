//
//  ExpandableTableViewSectionView.h
//  JMExpandableTableView
//
//  Created by jonathan ma on 3/11/2016.
//  Copyright © 2016 jonathan ma. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ExpandableTableViewSectionView : UIView

@property (nonatomic, strong) NSString *title;
@property (nonatomic, assign) BOOL expandByDefault;
@property (nonatomic, strong) UIImage *expandImage;
@property (nonatomic, strong) UIImage *collapseImage;

-(void)setup;
-(void)expand:(BOOL)expand;

@end
