//
//  HYBImageCropController.m
//  CALayer精讲
//
//  Created by huangyibiao on 15/12/8.
//  Copyright © 2015年 huangyibiao. All rights reserved.
//

#import "HYBImageCropController.h"

#define kPhotoWidth 100

@implementation HYBImageCropController

- (void)viewDidLoad {
  [super viewDidLoad];
  
//  [self drawImageWithContent];
  [self drawImage];
}

- (void)drawImageWithContent {
  CALayer *layer = [CALayer layer];
  layer.bounds = CGRectMake(0, 0, kPhotoWidth, kPhotoWidth);
  layer.position = self.view.center;
  layer.cornerRadius = kPhotoWidth / 2;
  // 要设置此属性才能裁剪成圆形，但是添加此属性后，下面设置的阴影就没有了。
  layer.masksToBounds = YES;
  layer.borderColor = [UIColor whiteColor].CGColor;
  layer.borderWidth = 1;
  
  // 如果只是显示图片，不做其它处理，直接设置contents就可以了，也就不会出现
  // 绘图和图像倒立的问题了
  layer.contents = (__bridge id _Nullable)([UIImage imageNamed:@"bb"].CGImage);
  
  [self.view.layer addSublayer:layer];
}

- (void)drawImage {
  CALayer *layer = [CALayer layer];
  layer.bounds = CGRectMake(0, 0, kPhotoWidth, kPhotoWidth);
  layer.position = self.view.center;
  layer.cornerRadius = kPhotoWidth / 2;
  // 要设置此属性才能裁剪成圆形，但是添加此属性后，下面设置的阴影就没有了。
  layer.masksToBounds = YES;
  layer.borderColor = [UIColor whiteColor].CGColor;
  layer.borderWidth = 1;
  
//  // 阴影
//  layer.shadowColor = [UIColor blueColor].CGColor;
//  layer.shadowOffset = CGSizeMake(4, 4);
//  layer.shadowOpacity = 0.9;
  
  // 指定代理
  layer.delegate = self;
  
  // 添加到父图层上
  [self.view.layer addSublayer:layer];
  
  // 当设置masksToBounds为YES后，要想要阴影效果，就需要额外添加一个图层作为阴影图层了
  CALayer *shadowLayer = [CALayer layer];
  shadowLayer.position = layer.position;
  shadowLayer.bounds = layer.bounds;
  shadowLayer.cornerRadius = layer.cornerRadius;
  shadowLayer.shadowOpacity = 1.0;
  shadowLayer.shadowColor = [UIColor redColor].CGColor;
  shadowLayer.shadowOffset = CGSizeMake(2, 1);
  shadowLayer.borderWidth = layer.borderWidth;
  shadowLayer.borderColor = [UIColor whiteColor].CGColor;
  [self.view.layer insertSublayer:shadowLayer below:layer];
  
  // 调用此方法，否则代理不会调用
  [layer setNeedsDisplay];
}

#pragma mark - CALayerDelegate
- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx {
  // 将当前上下文入栈
  CGContextSaveGState(ctx);
  
  // 注意：坐标系统与UIView的不同，这里使用的是笛卡尔积坐标系，也就是左下角为(0,0)
  // 所以，我们只要记住这点就可以很容易地变换了。
  
  // 处理图片倒立的问题
  // 默认呈现是倒立的，因此需要将形变矩阵的sy设置为-1就成了正立的了
  // 先缩放后平移也可以
// CGContextScaleCTM(ctx, 1, -1);
// CGContextTranslateCTM(ctx, 0, -kPhotoWidth);
  
  // 先向平移后旋转也可以解决倒立的问题
  CGContextTranslateCTM(ctx, kPhotoWidth, kPhotoWidth);
  CGContextRotateCTM(ctx, 3.1415926 / 180 * 180);
  
  UIImage *image = [UIImage imageNamed:@"bb"];
  CGContextDrawImage(ctx, CGRectMake(0, 0, kPhotoWidth, kPhotoWidth), image.CGImage);
  
  // 任务完成后，将当前上下文退栈
  CGContextRestoreGState(ctx);
}

@end
