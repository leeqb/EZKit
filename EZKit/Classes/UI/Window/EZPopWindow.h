//
//  EZPopWindow.h
//  EZKit
//
//  Created by leeqb on 6/5/16.
//  Copyright © 2016 powerlee. All rights reserved.
//

@interface EZPopWindow : NSObject

@property (nonatomic, strong) UIView *contentView;
@property (nonatomic, assign) CGFloat *width;
@property (nonatomic, assign) CGFloat *height;

- (instancetype)initWithView:(UIView *)contentView;
- (void)show;
- (void)dismiss;

@end
