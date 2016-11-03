//
//  ExpandableTableViewSectionViewHolder.h
//  XinAo
//
//  Created by jonathan ma on 21/3/2016.
//  Copyright © 2016 ECity. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface ExpandableTableViewSectionViewHolder : NSObject

+(ExpandableTableViewSectionViewHolder *)instanceWithTableView:(UITableView *)tableView title:(NSString *)title expand:(BOOL)expand;

@property (nonatomic, strong) NSString *title;

-(UIView *)view;
-(BOOL)isExpanded;

@end
