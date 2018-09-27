//
//  MTKSideEleItem.m
//  MTKFormWrap
//
//  Created by intebox on 2018/9/27.
//  Copyright © 2018年 unovo. All rights reserved.
//

#import "MTKSideEleItem.h"

@implementation MTKSideEleItem

- (Class)cellClass{
    return [MTKSideEleCell class];
}

#pragma mark-
#pragma mark- update
- (void)updateTitle{
    //说明当前item还没有被渲染,没有被渲染的item不需要更新UI
    if (!self.cell)  return;
    MTKSideEleCell *cell = (MTKSideEleCell *)self.cell;
    if (self.showStar) {
        NSMutableAttributedString *title = [[NSMutableAttributedString alloc] initWithString:_title];
        NSAttributedString *star = [[NSAttributedString alloc] initWithString:@" *" attributes:@{NSForegroundColorAttributeName:[UIColor redColor],
                                                                                                 NSFontAttributeName:[UIFont systemFontOfSize:18],
                                                                                                 NSBaselineOffsetAttributeName:@(-4)
                                                                                                 }];
        [title appendAttributedString:star];
        cell.leftLabel.attributedText = title;
    }else{
        cell.leftLabel.text = _title;
    }
}

#pragma mark-
#pragma mark-
-(void)setTitle:(NSString *)title{
    if ([title isEqualToString:_title]) return;
    _title = title;
    [self updateTitle];
}

- (void)setShowStar:(BOOL)showStar{
    _showStar = showStar;
    [self updateTitle];
}

- (UITableViewCell *)cellForItem{
    if (self.cell) return self.cell;
    self.cell = [[[self cellClass] alloc] initWithDefault];
    [self updateTitle];
    return self.cell;
}

@end



@implementation MTKSideEleCell

#pragma mark-
#pragma mark- getter

- (UILabel *)leftLabel{
    if (!_leftLabel) {
        _leftLabel = [[UILabel alloc] init];
        _leftLabel.font = [UIFont systemFontOfSize:15];
        _leftLabel.textColor = [UIColor colorWithWhite:0x42/255.0f
                                                 alpha:1];
        _leftLabel.translatesAutoresizingMaskIntoConstraints = NO;
    }
    
    return _leftLabel;
}

- (UIView *)rightContainerView{
    if (!_rightContainerView) {
        _rightContainerView = [[UIView alloc] init];
        _rightContainerView.backgroundColor = [UIColor whiteColor];
        _rightContainerView.translatesAutoresizingMaskIntoConstraints = NO;
    }
    return _rightContainerView;
}

#pragma mark-
#pragma mark- init
-(instancetype)initWithDefault{
    self = [super initWithDefault];
    if (self) {
        [self.contentView addSubview:self.leftLabel];
        [self.contentView addSubview:self.rightContainerView];
        [self sideEleItem__setupConstraints__];
        
        [self.leftLabel setContentHuggingPriority:UILayoutPriorityDefaultHigh forAxis:UILayoutConstraintAxisHorizontal];
        [self.rightContainerView setContentHuggingPriority:UILayoutPriorityDefaultLow forAxis:UILayoutConstraintAxisHorizontal];
    }
    return self;
}

- (void)sideEleItem__setupConstraints__{
    NSLayoutConstraint *labelLeading = [NSLayoutConstraint
                                        constraintWithItem:self.leftLabel
                                        attribute:NSLayoutAttributeLeading
                                        relatedBy:NSLayoutRelationEqual
                                        toItem:self.contentView
                                        attribute:NSLayoutAttributeLeading
                                        multiplier:1
                                        constant:14];
    
    NSLayoutConstraint *labelCenter = [NSLayoutConstraint
                                       constraintWithItem:self.leftLabel
                                       attribute:NSLayoutAttributeCenterY
                                       relatedBy:NSLayoutRelationEqual
                                       toItem:self.contentView
                                       attribute:NSLayoutAttributeBottom
                                       multiplier:0.5
                                       constant:0];
    [self.contentView addConstraints:@[labelLeading,labelCenter]];
    
    NSLayoutConstraint *viewLeading = [NSLayoutConstraint
                                       constraintWithItem:self.rightContainerView
                                       attribute:NSLayoutAttributeLeading
                                       relatedBy:NSLayoutRelationEqual
                                       toItem:self.leftLabel
                                       attribute:NSLayoutAttributeTrailing
                                       multiplier:1
                                       constant:14];
    
    NSLayoutConstraint *viewTrailing = [NSLayoutConstraint
                                        constraintWithItem:self.rightContainerView
                                        attribute:NSLayoutAttributeTrailing
                                        relatedBy:NSLayoutRelationEqual
                                        toItem:self.contentView
                                        attribute:NSLayoutAttributeTrailing
                                        multiplier:1
                                        constant:-14];
    
    NSLayoutConstraint *viewTop = [NSLayoutConstraint
                                   constraintWithItem:self.rightContainerView
                                   attribute:NSLayoutAttributeTop
                                   relatedBy:NSLayoutRelationEqual
                                   toItem:self.contentView
                                   attribute:NSLayoutAttributeTop
                                   multiplier:1
                                   constant:0];
    
    NSLayoutConstraint *viewBottom = [NSLayoutConstraint
                                      constraintWithItem:self.rightContainerView
                                      attribute:NSLayoutAttributeBottom
                                      relatedBy:NSLayoutRelationEqual
                                      toItem:self.contentView
                                      attribute:NSLayoutAttributeBottom
                                      multiplier:1
                                      constant:0];
    [self.contentView addConstraints:@[viewLeading,viewTrailing,viewTop,viewBottom]];
}

@end
