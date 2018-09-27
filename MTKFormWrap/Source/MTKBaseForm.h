//
//  MTKBaseForm.h
//  MTKFormWrap
//
//  Created by intebox on 2018/9/20.
//  Copyright © 2018年 unovo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MTKFormSection.h"

@interface MTKBaseForm : NSObject

@property (nonatomic, assign) UITableViewStyle tableViewStyle;
@property (nonatomic, strong, readonly) NSArray <MTKFormSection *>* formSections;

@property (nonatomic, assign) CGFloat rowHeight;

- (void)addSection:(MTKFormSection *)section;
- (void)addSections:(NSArray <MTKFormSection *>*)sections;

- (void)rmSection:(MTKFormSection *)section;
- (void)rmSections:(NSArray <MTKFormSection *>*)sections;

@end
