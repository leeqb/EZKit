//
//  EZSearchBar.m
//  EZKit
//
//  Created by leeqb on 6/10/16.
//  Copyright © 2016 powerlee. All rights reserved.
//

#import "EZSearchBar.h"

@interface EZSearchBar()<UITextFieldDelegate>

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
    UINib *nib = [UINib nibWithNibName:@"EZSearchBar" bundle:bundle];
    UIView *contentView = [[nib instantiateWithOwner:self options:nil] firstObject];
    contentView.frame = rect;
    [self addSubview:contentView];
}

#pragma mark - UITextFieldDelegate
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    
}

@end
