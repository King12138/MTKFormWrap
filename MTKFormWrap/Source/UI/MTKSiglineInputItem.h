//
//  MTKSiglineInputItem.h
//  MTKFormWrap
//
//  Created by intebox on 2018/9/26.
//  Copyright © 2018年 unovo. All rights reserved.
//

#import "MTKSideEleItem.h"

@interface MTKSiglineInputItem : MTKSideEleItem

@property (nonatomic, strong) NSString *content;
@property (nonatomic, strong) NSString *placeHolder;

@property (nonatomic, copy) void(^textChangeBlock)(UITextField *textField);

@end


@interface MTKSiglineInputCell : MTKSideEleCell

@property (strong, nonatomic)  UITextField *textField;

@end
