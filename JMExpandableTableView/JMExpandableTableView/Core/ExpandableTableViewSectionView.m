//
//  ExpandableTableViewSectionView.m
//  JMExpandableTableView
//
//  Created by jonathan ma on 3/11/2016.
//  Copyright © 2016 jonathan ma. All rights reserved.
//

#import "ExpandableTableViewSectionView.h"

static const CGFloat HEADER_HEIGHT = 50;
static const CGFloat HEADER_FONT_SIZE = 18;

@interface ExpandableTableViewSectionView ()

@property (nonatomic, assign) BOOL isSetup;
@property (nonatomic, assign) BOOL isExpanded;
@property (nonatomic, strong) UIImageView *imgView;
@property (nonatomic, strong) UITextView *tvTitle;

@end

@implementation ExpandableTableViewSectionView

-(void)setup {
    if (_isSetup) {
        return;
    }

    _isExpanded = _expandByDefault;
    [self setupImageView];
    [self setupTextView];
    [self setToggleListener];
    _isSetup = YES;
}

-(void)setupImageView {
    UIImage *image = _expandByDefault ? _expandImage : _collapseImage;
    _imgView = [[UIImageView alloc] initWithImage:image];
    CGSize size = _imgView.frame.size;
    CGPoint origin = _imgView.frame.origin;
    CGFloat originY = (HEADER_HEIGHT - size.height) / 2;
    _imgView.frame = CGRectMake(origin.x, originY, size.width, size.height);
    [self addSubview:_imgView];
}

-(void)setupTextView {
    CGFloat titleWidth = [UIScreen mainScreen].bounds.size.width - _imgView.frame.size.width;
    CGRect titleFrame = CGRectMake(_imgView.frame.size.width, 0, titleWidth, HEADER_HEIGHT);
    _tvTitle = [[UITextView alloc] initWithFrame:titleFrame];
    _tvTitle.text = _title;
    _tvTitle.editable = NO;
    _tvTitle.font = [UIFont boldSystemFontOfSize:HEADER_FONT_SIZE];
    [self addSubview:_tvTitle];
}

-(void)setToggleListener {
    UITapGestureRecognizer *listener = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(toggle)];
    listener.numberOfTapsRequired = 1;
    [self addGestureRecognizer:listener];
}

-(void)toggle {
    _isExpanded = !_isExpanded;
    _imgView.image = _isExpanded ? _expandImage : _collapseImage;
    [_tableView reloadData];
}

#pragma mark- SectionViewDelegate
-(BOOL)isExpanded {
    return _isExpanded;
}

-(UIView *)view {
    return self;
}

@end
