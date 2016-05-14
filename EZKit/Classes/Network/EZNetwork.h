//
//  EZNetwork.h
//  EZKit
//
//  Created by leeqb on 4/28/16.
//  Copyright © 2016 powerlee. All rights reserved.
//

#import "AFNetworking.h"

typedef NSDictionary *(^BeforeRequestBlock)(NSDictionary *params);
typedef NSDictionary *(^AfterResponseBlock)(id result, NSError *error);
typedef void(^RequestSuccessBlock)(id result);
typedef void(^RequestFailedBlock)(id result, NSError *error);
typedef void(^NetworkStatusChangeBlock)(AFNetworkReachabilityStatus status);

@protocol EZNetworkDelegate<NSObject>

@optional
- (NSDictionary *)beforeRequest:(NSDictionary *)inParams;
- (NSDictionary *)afterResponse:(NSDictionary *)receiveData error:(NSError *)error;
- (void)networkStatusChange:(AFNetworkReachabilityStatus)status;

@end

@interface EZNetwork : NSObject

+ (instancetype)sharedInstance;

@property (nonatomic, assign) id<EZNetworkDelegate> delegate;
@property (atomic, strong) BeforeRequestBlock beforeBlock;
@property (atomic, strong) AfterResponseBlock afterBlock;
@property (atomic, strong) NetworkStatusChangeBlock statusChangeBlock;

- (void)POST:(NSString *)url params:(NSDictionary *)params success:(RequestSuccessBlock)success failed:(RequestFailedBlock)failed finally:(void(^)())finally;

- (void)GET:(NSString *)url params:(NSDictionary *)params success:(RequestSuccessBlock)success failed:(RequestFailedBlock)failed finally:(void(^)())finally;

@end
