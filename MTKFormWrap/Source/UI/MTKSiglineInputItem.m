//
//  MTKSiglineInputItem.m
//  MTKFormWrap
//
//  Created by intebox on 2018/9/26.
//  Copyright © 2018年 unovo. All rights reserved.
//

#import "MTKSiglineInputItem.h"

@implementation MTKSiglineInputItem

- (void)textFieldValueDidChanged:(UITextField *)tf{
    _content = tf.text;
    !_textChangeBlock?:_textChangeBlock(tf);
}

#pragma mark-
#pragma mark-
- (void)setPlaceHolder:(NSString *)placeHolder{
    _placeHolder = placeHolder;
    if (!self.cell) return;
    [(MTKSiglineInputCell *)self.cell textField].placeholder = _placeHolder;
}

- (void)setContent:(NSString *)content{
    if ([_content isEqualToString:content]) return;
    
    _content = content;
    if (!self.cell) return;
    [(MTKSiglineInputCell *)self.cell textField].text = _content;
}


- (UITableViewCell *)cellForItem{
    if (self.cell) return self.cell;
    self.cell = [[MTKSiglineInputCell alloc] initWithDefault];
    [self updateTitle];
    [(MTKSiglineInputCell *)self.cell textField].placeholder = _placeHolder;
    [[(MTKSiglineInputCell *)self.cell textField] addTarget:self
                                                     action:@selector(textFieldValueDidChanged:)
                                           forControlEvents:UIControlEventValueChanged];
    [(MTKSiglineInputCell *)self.cell textField].text = _content;
    return self.cell;
}
@end


@implementation MTKSiglineInputCell

#pragma mark-
#pragma mark-

- (UITextField *)textField{
    if (!_textField) {
        _textField = [[UITextField alloc] init];
        _textField.translatesAutoresizingMaskIntoConstraints = NO;
        _textField.borderStyle = UITextBorderStyleNone;
        _textField.textColor = [UIColor colorWithWhite:0x42/255.0f
                                                 alpha:1];
        _textField.textAlignment = NSTextAlignmentRight;
        _textField.font = [UIFont systemFontOfSize:15];
    }
    return _textField;
}

#pragma mark-
#pragma mark-
- (instancetype)initWithDefault{
    self = [super initWithDefault];
    if (self) {
        [self.rightContainerView addSubview:self.textField];
        [self siglineInputCell__setupConstraints__];
    }
    
    return self;
}

- (void)siglineInputCell__setupConstraints__{
    NSLayoutConstraint *valueLeading = [NSLayoutConstraint
                                        constraintWithItem:self.textField
                                        attribute:NSLayoutAttributeLeading
                                        relatedBy:NSLayoutRelationEqual
                                        toItem:self.rightContainerView
                                        attribute:NSLayoutAttributeLeading
                                        multiplier:1
                                        constant:0];
    
    NSLayoutConstraint *valueTop = [NSLayoutConstraint
                                    constraintWithItem:self.textField
                                    attribute:NSLayoutAttributeTop
                                    relatedBy:NSLayoutRelationEqual
                                    toItem:self.rightContainerView
                                    attribute:NSLayoutAttributeTop
                                    multiplier:1
                                    constant:0];
    
    NSLayoutConstraint *valueTrailing = [NSLayoutConstraint
                                         constraintWithItem:self.textField
                                         attribute:NSLayoutAttributeTrailing
                                         relatedBy:NSLayoutRelationEqual
                                         toItem:self.rightContainerView
                                         attribute:NSLayoutAttributeTrailing
                                         multiplier:1
                                         constant:0];
    
    NSLayoutConstraint *valueBottom = [NSLayoutConstraint
                                       constraintWithItem:self.textField
                                       attribute:NSLayoutAttributeBottom
                                       relatedBy:NSLayoutRelationEqual
                                       toItem:self.rightContainerView
                                       attribute:NSLayoutAttributeBottom
                                       multiplier:1
                                       constant:0];
    [self.rightContainerView addConstraints:@[valueLeading,valueTop,valueBottom,valueTrailing]];
}

@end
