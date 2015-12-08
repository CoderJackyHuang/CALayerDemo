//
//  HYBBaseController.m
//  CALayer精讲
//
//  Created by huangyibiao on 15/12/8.
//  Copyright © 2015年 huangyibiao. All rights reserved.
//

#import "HYBBaseController.h"

@implementation HYBBaseController

- (instancetype)initWithTitle:(NSString *)title {
  if (self = [super init]) {
    self.title = title;
  }
  
  return self;
}

- (void)viewDidLoad {
  [super viewDidLoad];
  
  self.automaticallyAdjustsScrollViewInsets = NO;
  self.edgesForExtendedLayout = UIRectEdgeNone;
  self.view.backgroundColor = [UIColor whiteColor];
}

@end
