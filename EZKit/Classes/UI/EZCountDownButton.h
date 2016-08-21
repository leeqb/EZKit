//
//  EZCountDownButton.h
//  EZKit
//
//  Created by leeqb on 11/12/15.
//  Copyright © 2015 powerlee. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol EZCountDownButtonDelegate <NSObject>

- (NSAttributedString *)attributedTextForDisabledState:(NSInteger)leftSeconds;

@end

@interface EZCountDownButton : UIButton

@property (nonatomic, assign) id<EZCountDownButtonDelegate> delegate;

@property (nonatomic, weak) UIColor *disabledBackgroundColor;

- (void)startCountDown:(NSInteger)seconds;

@end
