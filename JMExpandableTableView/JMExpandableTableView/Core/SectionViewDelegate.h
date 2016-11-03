//
//  SectionViewDelegate.h
//  JMExpandableTableView
//
//  Created by jonathan ma on 3/11/2016.
//  Copyright © 2016 jonathan ma. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SectionViewDelegate <NSObject>

@required
/**
 If current section is expanded.

 @return YES if current section is expanded, NO if collapsed.
 */
-(BOOL)isExpanded;
/**
 Provide view of the section.

 @return View of the section.
 */
-(UIView *)view;

@end
