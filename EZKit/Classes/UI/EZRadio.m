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
    _iconImageView = [UIImageView new];
    [self addSubview:_iconImageView];
    
    _textLabel = [UILabel new];
    _textLabel.font = [UIFont systemFontOfSize:17];
    [self addSubview:_textLabel];
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapHandle:)];
    [self addGestureRecognizer:tapGesture];
}

- (void)tapHandle:(UITapGestureRecognizer *)tapGesture
{
    if (_checked) {
        _checked = NO;
        _iconImageView.image = _unselectImage;
    } else {
        _checked = YES;
        _iconImageView.image = _selectedImage;
    }
}

#pragma mark - Setter
- (void)setSelectedImage:(UIImage *)selectedImage
{
    _selectedImage = selectedImage;
}

- (void)setUnselectImage:(UIImage *)unselectImage
{
    _unselectImage = unselectImage;
    _iconImageView.image = _unselectImage;
    
    [_iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.mas_equalTo(0);
        make.width.mas_equalTo(_unselectImage.size.width);
        make.height.mas_equalTo(_unselectImage.size.height);
        make.centerY.equalTo(self.mas_centerY);
    }];
}

- (void)setText:(NSString *)text
{
    _text = text;
    _textLabel.text = text;
    
    [_textLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.bottom.mas_offset(-1);
        make.leading.equalTo(_iconImageView.mas_trailing);
        make.trailing.mas_offset(-10);
    }];
}

@end
