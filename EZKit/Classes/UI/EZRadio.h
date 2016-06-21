//
//  EZRadio.h
//  EZKit
//
//  Created by leeqb on 6/19/16.
//  Copyright © 2016 powerlee. All rights reserved.
//

IB_DESIGNABLE
@interface EZRadio : UIView

@property (nonatomic, readonly) BOOL checked;

@property (nonatomic, weak) IBInspectable UIImage *selectedImage;
@property (nonatomic, weak) IBInspectable UIImage *unselectImage;
@property (nonatomic, copy) IBInspectable NSString *text;

@end
