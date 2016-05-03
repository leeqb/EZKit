//
//  EZNetwork.m
//  EZKit
//
//  Created by leeqb on 4/28/16.
//  Copyright © 2016 powerlee. All rights reserved.
//

#import "EZNetwork.h"

@implementation EZNetwork

+ (instancetype)sharedInstance
{
    static EZNetwork *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [self new];
    });
    return instance;
}

#pragma mark - Private Methods
- (NSDictionary *)generateRequestParams:(NSDictionary *)params
{
    if (_beforeBlock) {
        params = _beforeBlock(params);
    }
    
    return params;
}

- (void)doRequest:(NSURLRequest *)request success:(RequestSuccessBlock)success failed:(RequestFailedBlock)failed finally:(void (^)())finally
{
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration] delegate:nil delegateQueue:[NSOperationQueue mainQueue]];
    NSURLSessionTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        id result = data;
        
        NSError *jsonError = nil;
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&jsonError];
        
        // 如果JSON序列化失败，就将原始数据返回
        if (!jsonError) {
            result = dict;
        }
        
        // 正常情况不返回error
        if (_afterBlock) {
            _afterBlock(result, error);
        }
        
        if (error) {
            failed(result, error);
        } else {
            success(result);
        }
        finally();
    }];
    [dataTask resume];
}

#pragma mark - Public Methods
- (void)POST:(NSString *)url params:(NSDictionary *)params success:(RequestSuccessBlock)success failed:(RequestFailedBlock)failed finally:(void (^)())finally
{
    params = [self generateRequestParams:params];
    NSURLRequest *request = [[AFJSONRequestSerializer serializer] requestWithMethod:@"POST" URLString:url parameters:params error:nil];
    [self doRequest:request success:success failed:failed finally:finally];
}

- (void)GET:(NSString *)url params:(NSDictionary *)params success:(RequestSuccessBlock)success failed:(RequestFailedBlock)failed finally:(void (^)())finally
{
    params = [self generateRequestParams:params];
    NSURLRequest *request = [[AFJSONRequestSerializer serializer] requestWithMethod:@"GET" URLString:url parameters:params error:nil];
    [self doRequest:request success:success failed:failed finally:finally];
}

@end
