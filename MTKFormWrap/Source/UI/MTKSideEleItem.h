//
//  MTKSideEleItem.h
//  MTKFormWrap
//
//  Created by intebox on 2018/9/27.
//  Copyright © 2018年 unovo. All rights reserved.
//

#import "MTKFormItem.h"

@interface MTKSideEleItem : MTKFormItem

@property (nonatomic, strong) NSString *title;
@property (nonatomic, assign) BOOL showStar;

- (void)updateTitle;
@end


@interface MTKSideEleCell : MKTBaseCell

@property (nonatomic, strong) UILabel *leftLabel;
@property (nonatomic, strong) UIView *rightContainerView;

@end
