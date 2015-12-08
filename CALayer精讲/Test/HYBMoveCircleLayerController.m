//
//  HYBMoveCircleLayerController.m
//  CALayer精讲
//
//  Created by huangyibiao on 15/12/8.
//  Copyright © 2015年 huangyibiao. All rights reserved.
//

#import "HYBMoveCircleLayerController.h"

#define kLayerWidth 50

@interface HYBMoveCircleLayerController ()

@property (nonatomic, strong) CALayer *movableCircleLayer;

@end

@implementation HYBMoveCircleLayerController

- (void)viewDidLoad {
  [super viewDidLoad];
  
  self.movableCircleLayer = [CALayer layer];
  // 指定大小
  self.movableCircleLayer.bounds = CGRectMake(0, 0, kLayerWidth, kLayerWidth);
  // 指定中心点
  self.movableCircleLayer.position = self.view.center;
  // 变成圆形
  self.movableCircleLayer.cornerRadius = kLayerWidth / 2;
  // 指定背景色
  self.movableCircleLayer.backgroundColor = [UIColor blueColor].CGColor;
  // 设置阴影
  self.movableCircleLayer.shadowColor = [UIColor grayColor].CGColor;
  self.movableCircleLayer.shadowOffset = CGSizeMake(3, 3);
  self.movableCircleLayer.shadowOpacity = 0.8;
  
  [self.view.layer addSublayer:self.movableCircleLayer];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
  CGFloat width = kLayerWidth;
  if (self.movableCircleLayer.bounds.size.width <= kLayerWidth) {
    width = kLayerWidth * 2.5;
  }
  
  // 修改大小
  self.movableCircleLayer.bounds = CGRectMake(0, 0, width, width);
  // 将中心位置放到点击位置
  self.movableCircleLayer.position = [[touches anyObject] locationInView:self.view];
  // 再修改成圆形
  self.movableCircleLayer.cornerRadius = width / 2;
}

@end
