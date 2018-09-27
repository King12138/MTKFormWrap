//
//  ViewController.m
//  MTKFormWrap
//
//  Created by intebox on 2018/9/20.
//  Copyright © 2018年 unovo. All rights reserved.
//

#import "ViewController.h"
#import "MTKFormer.h"

@interface ViewController ()

@property (nonatomic, strong) MTKPickActionItem *item;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self buildSections];
}

- (void)buildSections{
    [self.form addSection:[self sectionForInformation]];
    [self.form addSection:[self sectionForInformation]];

}

- (MTKFormSection *)sectionForInformation{
    MTKFormSection *informationSection = [[MTKFormSection alloc] init];
    MTKPickActionItem *item = [[MTKPickActionItem alloc] init];
    item.title = @"客房详情";
    item.content = @"客房详情";
    item.showStar = YES;
    item.showArrow = YES;
    item.cellArrowDirection = MTKCellArrowDirectionRight;
    [item setActionBlock:^(MTKPickActionItem *rowItem) {
        rowItem.content = @"1010";
    }];

    MTKSiglineInputItem *inputItem = [MTKSiglineInputItem new];
    inputItem.title = @"退款金额";
    inputItem.showStar = YES;
    inputItem.placeHolder = @"请输入退款金额";

    [informationSection addItem:item];
    [informationSection addItem:inputItem];
    return informationSection;
}

- (void)sectionForCommitButton{
}

@end
