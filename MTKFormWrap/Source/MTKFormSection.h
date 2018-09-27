//
//  MTKFormSection.h
//  MTKFormWrap
//
//  Created by intebox on 2018/9/25.
//  Copyright © 2018年 unovo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MTKFormItem.h"

@interface MTKFormSection : NSObject

@property (nonatomic, assign) CGFloat  headHeight;
@property (nonatomic, strong) NSString *headTitle;
@property (nonatomic, strong) UIView *headView;

@property (nonatomic, assign) CGFloat  footHeight;
@property (nonatomic, strong) NSString *footTitle;
@property (nonatomic, strong) UIView *footView;

@property (nonatomic, strong) NSMutableArray <MTKFormItem *> *items;



- (void)addItem:(MTKFormItem *)item;
- (void)addItems:(NSArray <MTKFormItem *>*)items;

- (void)rmItem:(MTKFormItem *)item;
- (void)rmItems:(NSArray <MTKFormItem *>*)items;

@end
