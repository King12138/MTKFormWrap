//
//  MTKFormSection.m
//  MTKFormWrap
//
//  Created by intebox on 2018/9/25.
//  Copyright © 2018年 unovo. All rights reserved.
//

#import "MTKFormSection.h"

@implementation MTKFormSection


#pragma mark-
#pragma mark- api

- (void)addItem:(MTKFormItem *)item{
    if (!item) return;
    
    [self addItems:@[item]];
}
- (void)addItems:(NSArray <MTKFormItem *>*)items{
    if (!items ||
        ![items isKindOfClass:[NSArray class]]) return;
    
    NSMutableArray *array = [NSMutableArray arrayWithArray:_items?_items:@[]];
    [array addObjectsFromArray:items];
    _items = [array copy];
}

- (void)rmItem:(MTKFormItem *)item{
    if (!item) return;
    [self rmItems:@[item]];
}
- (void)rmItems:(NSArray <MTKFormItem *>*)items{
    if (!items ||
        items.count == 0 ||
        !items ||
        ![items isKindOfClass:[NSArray class]]) return;
    
    NSMutableArray *array = [NSMutableArray arrayWithArray:_items?_items:@[]];
    [array addObjectsFromArray:items];
    _items = [array copy];
}

@end
