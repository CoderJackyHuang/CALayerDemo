//
//  ViewController.m
//  CALayer精讲
//
//  Created by huangyibiao on 15/12/8.
//  Copyright © 2015年 huangyibiao. All rights reserved.
//

#import "ViewController.h"
#import "HYBImageCropController.h"
#import "HYBMoveCircleLayerController.h"
#import "HYBCABasicAnimationController.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSArray *datSource;

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  
 self.title = @"CALayer实战";
  UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
  [self.view addSubview:tableView];
  tableView.delegate = self;
  tableView.dataSource = self;
  
  self.datSource = @[[[HYBMoveCircleLayerController alloc] initWithTitle:@"移动圆形图层"],
                     [[HYBImageCropController alloc] initWithTitle:@"图片裁剪图层"],
                     [[HYBCABasicAnimationController alloc] initWithTitle:@"CABasicAnimation动画学习"],
                     ];
}

#pragma mark - UITableViewDataSource
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  static NSString *cellIdentifier = @"UITableViewCell";
  
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
  if (cell == nil) {
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
  }
  
  UIViewController *controller = self.datSource[indexPath.row];
  cell.textLabel.text = controller.title;
  
  return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return self.datSource.count;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
 UIViewController *controller = self.datSource[indexPath.row];
  
  [self.navigationController pushViewController:controller animated:YES];
}

@end
