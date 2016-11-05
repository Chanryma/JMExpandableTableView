//
//  DefaultTableViewSectionView.m
//  JMExpandableTableView
//
//  Created by jonathan ma on 3/11/2016.
//  Copyright © 2016 jonathan ma. All rights reserved.
//

#import "DefaultTableViewSectionView.h"

static const CGFloat HEADER_FONT_SIZE = 18;

@interface DefaultTableViewSectionView ()

@property (nonatomic, assign) BOOL isSetup;
@property (nonatomic, assign) BOOL isExpanded;
@property (nonatomic, strong) UIImageView *imgView;
@property (nonatomic, strong) UILabel *lblTitle;

@end

@implementation DefaultTableViewSectionView

-(void)setup {
    if (_isSetup) {
        return;
    }

    _isExpanded = _expandByDefault;
    [self setupImageView];
    [self setupTitleView];
    [self setToggleListener];
    _isSetup = YES;
}

-(void)setupImageView {
    UIImage *image = _expandByDefault ? _expandImage : _collapseImage;
    _imgView = [[UIImageView alloc] initWithImage:image];
    CGSize size = _imgView.frame.size;
    CGFloat originY = (self.frame.size.height - size.height) / 2;
    _imgView.frame = CGRectMake(5, originY, size.width, size.height);
    [self addSubview:_imgView];
}

-(void)setupTitleView {
    CGFloat titleWidth = [UIScreen mainScreen].bounds.size.width - _imgView.frame.size.width;
    CGFloat leftPadding = 5;
    CGFloat originX = _imgView.frame.origin.x + _imgView.frame.size.width + leftPadding;
    CGRect titleFrame = CGRectMake(originX, 0, titleWidth, self.frame.size.height);
    _lblTitle = [[UILabel alloc] initWithFrame:titleFrame];
    _lblTitle.text = _title;
    _lblTitle.font = [UIFont boldSystemFontOfSize:HEADER_FONT_SIZE];
    [self addSubview:_lblTitle];
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
