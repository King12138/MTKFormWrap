//
//  MTKFormItem.m
//  MTKFormWrap
//
//  Created by intebox on 2018/9/25.
//  Copyright © 2018年 unovo. All rights reserved.
//

#import "MTKFormItem.h"

@implementation MTKFormItem

-(void)dealloc{
    self.cell = nil;
}

#pragma mark-
#pragma mark-
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setupDefault];
    }
    return self;
}

- (void)setupDefault{
    self.cellStyle = UITableViewCellStyleValue1;
    self.rowHeight = 44;
    self.cellClass = [UITableViewCell class];
}

#pragma mark-
#pragma mark- api
- (BOOL)canInitByApi{
    return self.class &&
    ([self.class isKindOfClass:[UITableViewCell class]]||
     [self.class isSubclassOfClass:[UITableViewCell class]]) &&
    self.reuseIdentifier &&
    self.reuseIdentifier.length>0;
}


- (UITableViewCell *)cellForItem{
    if (self.cell) return self.cell;
    
    @try{
        if ([self canInitByApi]) {
            self.cell = [[self.cellClass alloc]
                         initWithStyle:self.cellStyle
                         reuseIdentifier:self.reuseIdentifier];
        }else{
            
            self.cell = [[[NSBundle mainBundle] loadNibNamed:self.nibName owner:nil options:nil] lastObject];
        }
    }@catch(NSException *e){
        if (! self.cell) {
            //only return but not record
            return [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"MTKEXCEPTCELL"];
        }
    }
    
    return  self.cell;
}

@end

@implementation MKTBaseCell
- (instancetype)initWithDefault{
    self = [super initWithStyle:0
                reuseIdentifier:[NSStringFromClass([self class]) stringByAppendingString:@"__MTK_KEY"]];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    return self;
}
@end
