//
//  EZNetwork.h
//  EZKit
//
//  Created by leeqb on 4/28/16.
//  Copyright © 2016 powerlee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking.h>

typedef NSDictionary *(^BeforeRequestBlock)(NSDictionary *params);
typedef NSDictionary *(^AfterResponseBlock)(id responseObject);
typedef void(^NetworkStatusChangeBlock)(AFNetworkReachabilityStatus status);
typedef void(^RequestSuccessBlock)(NSDictionary *result);
typedef void(^RequestFailedBlock)(NSDictionary *result, NSError *error);

@interface EZNetwork : NSObject

+ (instancetype)sharedInstance;

@property (atomic, strong) BeforeRequestBlock beforeBlock;
@property (atomic, strong) AfterResponseBlock afterBlock;
@property (atomic, strong) NetworkStatusChangeBlock statusChangeBlock;

- (void)POST:(NSString *)url params:(NSDictionary *)params success:(RequestSuccessBlock)success failed:(RequestFailedBlock)failed finally:(void(^)())finally;

- (void)GET:(NSString *)url params:(NSDictionary *)params success:(RequestSuccessBlock)success failed:(RequestFailedBlock)failed finally:(void(^)())finally;

@end
