//
//  EZAlertView.h
//  EZKit
//
//  Created by leeqb on 5/15/16.
//  Copyright © 2016 powerlee. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^ButtonClickedBlock)(NSInteger buttonIndex);

@interface EZAlertView : NSObject<UIAlertViewDelegate>

+ (instancetype)sharedInstance;

- (void)show:(NSString *)message;
- (void)confirm:(NSString *)message buttonClicked:(ButtonClickedBlock)buttonClicked;

@end
