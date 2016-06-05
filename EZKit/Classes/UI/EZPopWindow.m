//
//  EZPopWindow.m
//  EZKit
//
//  Created by leeqb on 6/5/16.
//  Copyright © 2016 powerlee. All rights reserved.
//

#import "EZPopWindow.h"

UIWindow *ezPopWindow;

@implementation EZPopWindow
{
    UIView *_translucentView;
}

- (instancetype)initWithView:(UIView *)contentView
{
    self = [super init];
    if (self) {
        _contentView = contentView;
        
        ezPopWindow = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
        ezPopWindow.windowLevel = UIWindowLevelNormal;
        [ezPopWindow makeKeyAndVisible];
        
        _translucentView = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
        _translucentView.backgroundColor = [UIColor blackColor];
        _translucentView.alpha = 0;
        [ezPopWindow addSubview:_translucentView];
        
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismiss)];
        [_translucentView addGestureRecognizer:tapGesture];
    }
    return self;
}

- (void)show
{
    if (_contentView) {
        CAKeyframeAnimation *keyAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
        keyAnimation.duration = 0.3;
        keyAnimation.removedOnCompletion = NO;
        keyAnimation.fillMode = kCAFillModeForwards;
        NSMutableArray *values = [NSMutableArray array];
        [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.1, 0.1, 1.0)]];
        [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.2, 1.2, 1.0)]];
        [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.9, 0.9, 0.9)]];
        [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.0, 1.0, 1.0)]];
        keyAnimation.values = values;
        keyAnimation.timingFunction = [CAMediaTimingFunction functionWithName: @"easeInEaseOut"];
        [_contentView.layer addAnimation:keyAnimation forKey:nil];
        
        CABasicAnimation *basicAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
        basicAnimation.toValue = @0.3;
        basicAnimation.duration = 0.3;
        basicAnimation.removedOnCompletion = NO;
        basicAnimation.fillMode = kCAFillModeForwards;
        [_translucentView.layer addAnimation:basicAnimation forKey:nil];
    }
}

- (void)dismiss
{
    if (_contentView) {
        CABasicAnimation *basicAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
        basicAnimation.toValue = @0;
        basicAnimation.duration = 0.3;
        basicAnimation.removedOnCompletion = NO;
        basicAnimation.fillMode = kCAFillModeForwards;
        [_translucentView.layer addAnimation:basicAnimation forKey:nil];
    }
}

@end
