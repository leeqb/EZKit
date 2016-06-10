//
//  EZSearchBar.m
//  EZKit
//
//  Created by leeqb on 6/10/16.
//  Copyright © 2016 powerlee. All rights reserved.
//

#import "EZSearchBar.h"

@interface EZSearchBar()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *inputWidth;
@property (weak, nonatomic) IBOutlet UITextField *textField;

@end

@implementation EZSearchBar

#pragma mark - Initialization
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self initSelf];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initSelf];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self initSelf];
    }
    return self;
}

- (void)initSelf
{
    CGRect rect = self.frame;
    rect.origin.x = 0;
    rect.origin.y = 0;
    
    NSBundle *bundle = [NSBundle bundleForClass:self.class];
    UINib *nib = [UINib nibWithNibName:NSStringFromClass(self.class) bundle:bundle];
    UIView *contentView = [[nib instantiateWithOwner:self options:nil] firstObject];
    contentView.frame = rect;
    [self addSubview:contentView];
    
    // 隔0.01秒再执行，否则宽度还未自适应
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.01 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        _inputWidth.constant = self.frame.size.width / 2;
    });
}

#pragma mark - Actions
- (IBAction)selfTapped:(id)sender {
    [_textField becomeFirstResponder];
    [UIView animateWithDuration:0.3 animations:^{
        _inputWidth.constant = self.frame.size.width - 36;
        [self layoutIfNeeded];
    }];
}

#pragma mark - UITextFieldDelegate
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    [_textField becomeFirstResponder];
    [UIView animateWithDuration:0.3 animations:^{
        _inputWidth.constant = self.frame.size.width - 36;
        [self layoutIfNeeded];
    }];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    [UIView animateWithDuration:0.3 animations:^{
        _inputWidth.constant = self.frame.size.width / 2;
        [self layoutIfNeeded];
    }];
    
    return YES;
}

@end
