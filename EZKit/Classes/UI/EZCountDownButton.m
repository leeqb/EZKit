//
//  EZCountDownButton.m
//  EZKit
//
//  Created by leeqb on 11/12/15.
//  Copyright © 2015 powerlee. All rights reserved.
//

#import "EZCountDownButton.h"

@implementation EZCountDownButton
{
    NSTimer *_timer;
    UIColor *_originalBgColor;
    NSString *_originalTitle;
    
    NSInteger _totalSeconds;
    NSInteger _leftSeconds;
}

#pragma mark - Initialization
- (instancetype)init
{
    self = [super init];
    if(self) {
        [self initSelf];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if(self) {
        [self initSelf];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self) {
        [self initSelf];
    }
    return self;
}

- (void)initSelf
{
    _originalTitle = self.titleLabel.text;
    _originalBgColor = self.backgroundColor;
}

#pragma mark - Private Methods
- (void)refreshButtonTitle
{
    if (_delegate && [_delegate respondsToSelector:@selector(attributedTextForDisabledState:)]) {
        [self setAttributedTitle:[_delegate attributedTextForDisabledState:_leftSeconds] forState:UIControlStateNormal];
    } else {
        [self setTitle:[NSString stringWithFormat:@"剩余%ld秒", (long)_leftSeconds] forState:UIControlStateNormal];
    }
    
    if(_leftSeconds <= 0) {
        if (_delegate && [_delegate respondsToSelector:@selector(attributedTextForDisabledState:)]) {
            [self setAttributedTitle:[[NSMutableAttributedString alloc] initWithString:_originalTitle] forState:UIControlStateNormal];
        } else {
            [self setTitle:_originalTitle forState:UIControlStateNormal];
        }
        
        [_timer invalidate];
        _timer = nil;
        
        self.enabled = YES;
        self.backgroundColor = _originalBgColor;
    }
}

#pragma mark - Actions
- (void)startCountDown:(NSInteger)seconds
{
    _totalSeconds = seconds;
    self.enabled = NO;
    
    if (_disabledBackgroundColor) {
        self.backgroundColor = _disabledBackgroundColor;
    } else {
        self.backgroundColor = [UIColor lightGrayColor];
    }
    
    if(_totalSeconds > 0) {
        _leftSeconds = _totalSeconds;
        [self refreshButtonTitle];
        _timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timerHandle) userInfo:nil repeats:YES];
    }
}

#pragma mark - Timer
- (void)timerHandle
{
    _leftSeconds--;
    [self refreshButtonTitle];
}

@end
