//
//  ViewController.m
//  MERNoticeBar
//
//  Created by mervin on 2017/5/11.
//  Copyright © 2017年 mervin. All rights reserved.
//

#import "ViewController.h"
#import "MERNoticeBar.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) NSArray *barStyleArray;
@property (nonatomic, strong) NSArray *animationTypeArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
    
    _barStyleArray = @[@"OnNavigationBar",@"BelowStatusBar",@"OnStatusBar",@"OnTabbar"];
    _animationTypeArray = @[@"Top",@"Bottom",@"Left",@"Right"];
}

#pragma mark - TableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return _barStyleArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _animationTypeArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"tableViewCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    NSString *title = _animationTypeArray[indexPath.row];
    cell.textLabel.text = title;
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    static NSString *identifier = @"tableViewHeader";
    UITableViewHeaderFooterView *view = [tableView dequeueReusableHeaderFooterViewWithIdentifier:identifier];
    if (!view) {
        view = [[UITableViewHeaderFooterView alloc] initWithReuseIdentifier:identifier];
    }
    NSString *title = _barStyleArray[section];
    view.textLabel.text = title;
    return view;
}

#pragma mark - TableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    MERNoticeBarConfig *config = [[MERNoticeBarConfig alloc] initWithDefaultType:indexPath.row];
    config.barStyle = indexPath.section;
    config.animationType = indexPath.row;
    config.title = @"测试";
    [MERNoticeBar showAnimationWithConfig:config completed:nil];
}

@end
