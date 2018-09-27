//
//  MTKPickActionItem.h
//  MTKFormWrap
//
//  Created by intebox on 2018/9/25.
//  Copyright © 2018年 unovo. All rights reserved.
//

#import "MTKSideEleItem.h"

typedef NS_ENUM(NSInteger,MTKCellArrowDirection) {
    MTKCellArrowDirectionDown = 0,
    MTKCellArrowDirectionRight,
    MTKCellArrowDirectionUp,
    MTKCellArrowDirectionLeft
};

@interface MTKPickActionItem : MTKSideEleItem

@property (nonatomic, strong) NSString *content;
//defalut is NO
@property (nonatomic, assign) BOOL showArrow;

//defalut is MTKCellArrowDirectionDown
@property (nonatomic, assign) MTKCellArrowDirection cellArrowDirection;

@property (nonatomic, copy) void(^actionBlock)(MTKPickActionItem *rowItem);

@end

@interface MTKPickActionCell : MTKSideEleCell

@property (strong, nonatomic) UIButton *rightValue;
@property (strong, nonatomic) UIImageView *rightArrow;
@property (nonatomic, strong) void(^actionBlock)(UIButton *value,UIImageView *arrow);

@end
