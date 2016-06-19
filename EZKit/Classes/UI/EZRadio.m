//
//  EZRadio.m
//  EZKit
//
//  Created by leeqb on 6/19/16.
//  Copyright © 2016 powerlee. All rights reserved.
//

#import "EZRadio.h"
#import "Masonry.h"

@interface EZRadio()
{
    UIImageView *_iconImageView;
    UILabel *_textLabel;
}

@end

@implementation EZRadio

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self _initSelf];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self _initSelf];
    }
    return self;
}

- (void)_initSelf
{
    self.backgroundColor = [UIColor redColor];
    
    _iconImageView = [UIImageView new];
    [self addSubview:_iconImageView];
    
    _textLabel = [UILabel new];
    [self addSubview:_textLabel];
}

#pragma mark - Setter
- (void)setIconImage:(UIImage *)iconImage
{
    _iconImage = iconImage;
    _iconImageView.image = _iconImage;
    
    [_iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.mas_offset(0);
        make.centerY.equalTo(self);
    }];
}

- (void)setText:(NSString *)text
{
    _text = text;
    _textLabel.text = text;
    _textLabel.backgroundColor = [UIColor blueColor];
    
    [_textLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.mas_offset(0);
        make.leading.mas_offset(_iconImage.size.width);
        make.trailing.mas_offset(10);
    }];
}

@end
