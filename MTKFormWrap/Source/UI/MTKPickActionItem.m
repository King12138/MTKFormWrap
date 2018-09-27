//
//  MTKPickActionItem.m
//  MTKFormWrap
//
//  Created by intebox on 2018/9/25.
//  Copyright © 2018年 unovo. All rights reserved.
//

#import "MTKPickActionItem.h"

@implementation MTKPickActionItem

- (void)dealloc{
    self.actionBlock = nil;
}

- (Class)cellClass{
    return [MTKPickActionCell class];
}

#pragma mark-
#pragma mark- update
- (void)updateArrow{
    //说明当前item还没有被渲染,没有被渲染的item不需要更新UI
    if (!self.cell)  return;
    MTKPickActionCell *cell = (MTKPickActionCell *)self.cell;
    cell.rightArrow.hidden = !self.showArrow;
    if (self.showArrow) {
        cell.rightArrow.transform = CGAffineTransformRotate(CGAffineTransformIdentity, M_PI_2 * self.cellArrowDirection * -1);
        cell.rightValue.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, cell.rightArrow.image.size.width + 5);
    }else{
        cell.rightArrow.transform = CGAffineTransformMakeScale(0.01, 0.01);
        cell.rightValue.titleEdgeInsets = UIEdgeInsetsZero;
    }
}

#pragma mark-
#pragma mark-
- (void)setupDefault{
    [super setupDefault];
    
    self.showStar = NO;
    self.showArrow = NO;
    self.cellArrowDirection = MTKCellArrowDirectionRight;
}


- (void)setContent:(NSString *)content{
    if ([content isEqualToString:_content]) return;
    
    _content = content;
    if (!self.cell) return;
    MTKPickActionCell *cell = (MTKPickActionCell *)self.cell;
    [cell.rightValue setTitle:_content forState:UIControlStateNormal];
}

- (void)setShowArrow:(BOOL)showArrow{
    if (_showArrow == showArrow) return;
    _showArrow = showArrow;
    [self updateArrow];
}

- (void)setCellArrowDirection:(MTKCellArrowDirection)cellArrowDirection{
    if (_cellArrowDirection == cellArrowDirection) return;
    _cellArrowDirection = cellArrowDirection;
    [self updateArrow];
}

- (UITableViewCell *)cellForItem{
    if (self.cell) return self.cell;
    self.cell = [[MTKPickActionCell alloc] initWithDefault];
    [self updateTitle];
    [self updateArrow];
    [[(MTKPickActionCell *)self.cell rightValue] setTitle:_content forState:UIControlStateNormal];
    __weak typeof(self) weakSelf = self;
    [(MTKPickActionCell *)self.cell setActionBlock:^(UIButton *value, UIImageView *arrow) {
        __strong typeof(weakSelf) strongSelf = weakSelf;
        !strongSelf.actionBlock?:strongSelf.actionBlock(strongSelf);
    }];
    return self.cell;
}

@end

@implementation MTKPickActionCell

#pragma mark-
#pragma mark- getter

- (UIButton *)rightValue{
    if (!_rightValue) {
        _rightValue = [UIButton buttonWithType:UIButtonTypeCustom];
        _rightValue.translatesAutoresizingMaskIntoConstraints = NO;
        _rightValue.titleLabel.font = [UIFont systemFontOfSize:15];
        [_rightValue setTitleColor:[UIColor colorWithWhite:0x42/255.0f
                                                     alpha:1]
                          forState:UIControlStateNormal];
        [_rightValue addTarget:self
                        action:@selector(buttonDidClicked:)
              forControlEvents:UIControlEventTouchDown];
        _rightValue.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    }
    
    return _rightValue;
}

- (UIImageView *)rightArrow{
    if (!_rightArrow) {
        _rightArrow = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"__mtk_form_arrow_down@3x"]];
        _rightArrow.contentMode = UIViewContentModeCenter;
        _rightArrow.translatesAutoresizingMaskIntoConstraints = NO;
    }
    
    return _rightArrow;
}

#pragma mark-
#pragma mark-

- (void)buttonDidClicked:(UIButton *)button{
    !_actionBlock?:_actionBlock(self.rightValue,self.rightArrow);
}

#pragma mark-
#pragma mark-
-(instancetype)initWithDefault{
    self = [super initWithDefault];
    if (self) {
        [self.rightContainerView addSubview:self.rightArrow];
        [self.rightContainerView addSubview:self.rightValue];
        [self pickActionItem__setupConstraints__];
    }
    return self;
}

- (void)pickActionItem__setupConstraints__{
    NSLayoutConstraint *valueLeading = [NSLayoutConstraint
                                       constraintWithItem:self.rightValue
                                       attribute:NSLayoutAttributeLeading
                                       relatedBy:NSLayoutRelationEqual
                                       toItem:self.rightContainerView
                                       attribute:NSLayoutAttributeLeading
                                       multiplier:1
                                       constant:0];

    NSLayoutConstraint *valueTop = [NSLayoutConstraint
                                   constraintWithItem:self.rightValue
                                   attribute:NSLayoutAttributeTop
                                   relatedBy:NSLayoutRelationEqual
                                   toItem:self.rightContainerView
                                   attribute:NSLayoutAttributeTop
                                   multiplier:1
                                   constant:0];

    NSLayoutConstraint *valueTrailing = [NSLayoutConstraint
                                         constraintWithItem:self.rightValue
                                         attribute:NSLayoutAttributeTrailing
                                         relatedBy:NSLayoutRelationEqual
                                         toItem:self.rightContainerView
                                         attribute:NSLayoutAttributeTrailing
                                         multiplier:1
                                         constant:0];

    NSLayoutConstraint *valueBottom = [NSLayoutConstraint
                                      constraintWithItem:self.rightValue
                                      attribute:NSLayoutAttributeBottom
                                      relatedBy:NSLayoutRelationEqual
                                      toItem:self.rightContainerView
                                      attribute:NSLayoutAttributeBottom
                                      multiplier:1
                                      constant:0];
    [self.rightContainerView addConstraints:@[valueLeading,valueTop,valueBottom,valueTrailing]];
    
    NSLayoutConstraint *arrowTrailing = [NSLayoutConstraint
                                         constraintWithItem:self.rightArrow
                                         attribute:NSLayoutAttributeTrailing
                                         relatedBy:NSLayoutRelationEqual
                                         toItem:self.rightContainerView
                                         attribute:NSLayoutAttributeTrailing
                                         multiplier:1
                                         constant:0];
    
    NSLayoutConstraint *arrowCenterX= [NSLayoutConstraint
                                       constraintWithItem:self.rightArrow
                                       attribute:NSLayoutAttributeCenterY
                                       relatedBy:NSLayoutRelationEqual
                                       toItem:self.rightContainerView
                                       attribute:NSLayoutAttributeBottom
                                       multiplier:0.5
                                       constant:0];
    
    [self.rightContainerView addConstraints:@[arrowTrailing,arrowCenterX]];
}

@end

