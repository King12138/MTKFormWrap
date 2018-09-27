//
//  MTKFormViewController.h
//  MTKFormWrap
//
//  Created by intebox on 2018/9/20.
//  Copyright © 2018年 unovo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MTKBaseForm.h"

@interface MTKFormViewController : UIViewController

@property (nonatomic, strong, readonly) MTKBaseForm *form;
@property (nonatomic, strong, readonly) UITableView *tableView;

//override by subclass
//default is MTKForm
- (Class)formClass;
- (void)formDidLoad:(MTKBaseForm *)form;

@end
