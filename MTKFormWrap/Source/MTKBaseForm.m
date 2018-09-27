//
//  MTKBaseForm.m
//  MTKFormWrap
//
//  Created by intebox on 2018/9/20.
//  Copyright © 2018年 unovo. All rights reserved.
//

#import "MTKBaseForm.h"

@implementation MTKBaseForm
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setupDefault];
    }
    return self;
}

- (void)setupDefault{
    self.tableViewStyle = UITableViewStyleGrouped;
    self.rowHeight = UITableViewAutomaticDimension;
}

#pragma mark-
#pragma mark- api
- (void)addSection:(MTKFormSection *)section{
    if (!section) return;
    [self addSections:@[section]];
}
- (void)addSections:(NSArray <MTKFormSection *>*)sections{
    if (!sections ||
        ![sections isKindOfClass:[NSArray class]]) return;
    
    NSMutableArray *array = [NSMutableArray arrayWithArray:_formSections?_formSections:@[]];
    [array addObjectsFromArray:sections];
    _formSections = [array copy];
}

- (void)rmSection:(MTKFormSection *)section{
    if (!section) return;
    [self rmSections:@[section]];
}
- (void)rmSections:(NSArray <MTKFormSection *>*)sections{
    if (!_formSections ||
        _formSections.count == 0 ||
        !sections ||
        ![sections isKindOfClass:[NSArray class]]) return;
    
    NSMutableArray *array = [NSMutableArray arrayWithArray:_formSections?_formSections:@[]];
    [array addObjectsFromArray:sections];
    _formSections = [array copy];
}

@end
