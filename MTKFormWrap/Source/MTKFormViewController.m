//
//  MTKFormViewController.m
//  MTKFormWrap
//
//  Created by intebox on 2018/9/20.
//  Copyright © 2018年 unovo. All rights reserved.
//

#import "MTKFormViewController.h"
#import "MTKForm.h"

@interface MTKFormViewController ()
<UITableViewDataSource,
UITableViewDelegate>
@property (nonatomic, strong) MTKBaseForm *form;
@property (nonatomic, strong, readwrite) UITableView *tableView;

@end

@implementation MTKFormViewController

#pragma mark-
#pragma mark- class
- (Class)formClass{
    return [MTKForm class];
}

#pragma mark-
#pragma mark- life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupTableView];
}

- (void)setupTableView{
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [self.view addSubview:self.tableView];
    self.tableView.frame = self.view.bounds;
}

#pragma mark-
#pragma mark- UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.form.formSections.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    MTKFormSection *formSection = self.form.formSections[section];
    return formSection.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MTKFormSection *formSection = self.form.formSections[indexPath.section];
    MTKFormItem *item = formSection.items[indexPath.row];
    return [item cellForItem];
}

#pragma mark-
#pragma mark- UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    MTKFormSection *formSection = self.form.formSections[indexPath.section];
    MTKFormItem *item = formSection.items[indexPath.row];
    return item.rowHeight;
}

#pragma mark-
#pragma mark- footer

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{
    MTKFormSection *formSection = self.form.formSections[section];
    return formSection.footTitle;
}

#pragma mark-
#pragma mark- header
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    MTKFormSection *formSection = self.form.formSections[section];
    return formSection.headTitle;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    MTKFormSection *formSection = self.form.formSections[section];
    return formSection.headHeight;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    MTKFormSection *formSection = self.form.formSections[section];
    return formSection.headView;
}

#pragma mark-
#pragma mark- template
- (void)formDidLoad:(MTKBaseForm *)form{}

#pragma mark-
#pragma mark- getter

- (MTKBaseForm *)form{
    if (!_form) {
        Class formClass = [self formClass];
        if (!formClass) {
#ifdef DEBUG
            [NSException raise:@"MTKFormViewController"
                        format:@"<must return a valid formClass> %s,%d",__FILE__,__LINE__];
#endif
            return nil;
        }
        _form = [[formClass alloc] init];
        [self formDidLoad:_form];
    }
    return _form;
}

- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:self.form.tableViewStyle];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = [UIColor groupTableViewBackgroundColor];
        _tableView.tableFooterView = [[UIView alloc] init];
        _tableView.rowHeight = self.form.rowHeight;
        _tableView.estimatedRowHeight = 88.f;
    }
    
    return _tableView;
}

@end
