//
//  MTKFormItem.h
//  MTKFormWrap
//
//  Created by intebox on 2018/9/25.
//  Copyright © 2018年 unovo. All rights reserved.
//


#import <UIKit/UIKit.h>

@interface MTKFormItem : NSObject

@property (nonatomic, strong) Class cellClass;

@property (nonatomic, assign) UITableViewCellStyle cellStyle;
@property (nonatomic, assign) NSString *reuseIdentifier;

@property (nonatomic, strong) NSString *nibName;

@property (nonatomic, assign) CGFloat rowHeight;

@property (nonatomic, assign) BOOL hidden;

// every item will bind with a cell
// and you are allowed to assign a cell youself
@property (nonatomic, strong) UITableViewCell *cell;

- (BOOL)canInitByApi;

// cellForItem will invoke before all of other init methods
// if cell returned is not nil then will be returned in the datasource method
- (UITableViewCell *)cellForItem;

//template
- (void)setupDefault;

@end

@interface MKTBaseCell : UITableViewCell
- (instancetype)initWithDefault;
@end
