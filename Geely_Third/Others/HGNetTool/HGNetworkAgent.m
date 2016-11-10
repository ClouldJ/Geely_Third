//
//  HGNetworkAgent.m
//  HGToolKit
//
//  Created by haigui on 16/2/17.
//  Copyright © 2016年 haigui. All rights reserved.
//

#import "HGNetworkAgent.h"
#import "HGBaseRequest.h"
#import "HGNetworkConfig.h"
#import "HGNetworkPrivate.h"
#import "AFNetworking.h"

@interface HGNetworkAgent () {
    AFHTTPSessionManager *_manager;
    HGNetworkConfig *_config;
    NSMutableDictionary *_requestsRecord;
}

@property (nonatomic, strong) AFHTTPSessionManager *manager;
@property (nonatomic, strong) HGNetworkConfig *config;
@property (nonatomic, strong) NSMutableDictionary *requestsRecord;

@end

@implementation HGNetworkAgent

+ (instancetype)sharedInstance {
    static HGNetworkAgent *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    return instance;
}

- (instancetype)init {
    if (self = [super init]) {
        _config = [HGNetworkConfig sharedInstance];
        _manager = [AFHTTPSessionManager manager];
        _requestsRecord = [NSMutableDictionary dictionary];
        _manager.operationQueue.maxConcurrentOperationCount = 1;
        
    }
    return self;
}

- (NSString *)buildRequestUrl:(HGBaseRequest *)request {
    NSString *detailUrl = request.requestUrl;
    if ([detailUrl hasPrefix:@"http"] || [detailUrl hasPrefix:@"https"]) {
        return detailUrl;
    }
    
    NSDictionary *argument = [[HGNetworkConfig sharedInstance].requestArgument copy];
    if (argument && argument.count > 0) {
        detailUrl = [HGNetworkPrivate urlStringWithOriginUrlString:detailUrl appendParameters:argument];
    }
    
    NSString *baseUrl;
    if (request.useCDN) {
        if (request.cdnUrl.length > 0) {
            baseUrl = request.cdnUrl;
        } else {
            baseUrl = _config.cdnUrl;
        }
    } else {
        if (request.baseUrl.length > 0) {
            baseUrl = request.baseUrl;
        } else {
            baseUrl = _config.baseUrl;
        }
    }
    return [NSString stringWithFormat:@"%@%@", baseUrl, detailUrl];
}

- (NSDictionary *)buildHeader:(HGBaseRequest *)request {
    
    if (!request.requestHeaderFieldValueDictionary && (!request.useArgument || !_config.requestHeaderFieldValueDictionary)) {
        return nil;
    }
    
    NSMutableDictionary *allHeader = [NSMutableDictionary dictionary];
    if (request.requestHeaderFieldValueDictionary) {
        [allHeader addEntriesFromDictionary:request.requestHeaderFieldValueDictionary];
    }
    if (request.useArgument && _config.requestHeaderFieldValueDictionary) {
        [allHeader addEntriesFromDictionary:_config.requestHeaderFieldValueDictionary];
    }
    return [allHeader copy];
}

- (void)configManager:(HGBaseRequest *)request {
    if (request.requestSerializerType ==
        HGRequestSerializerTypeHTTP) {
        _manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    } else if (request.requestSerializerType ==
               HGRequestSerializerTypeJSON) {
        _manager.requestSerializer = [AFJSONRequestSerializer serializer];
    }
    
    if (request.responseSerializerType == HGResponseSerializerTypeJSON) {
        AFJSONResponseSerializer *serializer = [AFJSONResponseSerializer serializer];
        serializer.acceptableContentTypes = _config.acceptableContentTypes;
        _manager.responseSerializer = serializer;
    } else if (request.responseSerializerType == HGResponseSerializerTypeHTTP) {
        _manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    }
    
    
    
    _manager.requestSerializer.timeoutInterval = request.requestTimeoutInterval;
    
}

- (void)addRequest:(HGBaseRequest *)request {
    
//    NSLog(@"add request: %@", NSStringFromClass([request class]));
    
    NSString *url = [self buildRequestUrl:request];
    
//    NSLog(@"url: %@", url);
    
    _manager.requestSerializer.timeoutInterval = [request requestTimeoutInterval];
    id param = request.requestArgument;

    AFConstructingBlock constructingBlock = request.constructingBodyBlock;
    
//    NSLog(@"%@", [_manager.requestSerializer valueForHTTPHeaderField:@"Content-Type"]);
    
    
    [self configManager:request];
    
    NSDictionary *header = [self buildHeader:request];
    if (header && header.count > 0) {
        [header enumerateKeysAndObjectsUsingBlock:^(NSString *key, NSString *obj, BOOL * _Nonnull stop) {
            [_manager.requestSerializer setValue:obj forHTTPHeaderField:key];
        }];
    }
    
//    NSLog(@"all header : %@", header);
//    NSLog(@"argument: %@", request.requestArgument);

    HGRequestMethod method = request.requestMethod;
    if (method == HGRequestMethodGet) {
        request.sessionDataTask = [_manager GET:url parameters:param progress:^(NSProgress * _Nonnull downloadProgress) {
            [self handleRequestProgress:downloadProgress request:request];
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            request.responseJSONObject = responseObject;
            [self handleRequestSuccess:task];
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            [self handleRequestFailue:task error:error];
            
        }];
    } else if (method == HGRequestMethodPost) {
        
        if (constructingBlock) {
            request.sessionDataTask = [_manager POST:url parameters:param constructingBodyWithBlock:constructingBlock progress:^(NSProgress * _Nonnull uploadProgress) {
                [self handleRequestProgress:uploadProgress request:request];
            } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                request.responseJSONObject = responseObject;
                [self handleRequestSuccess:task];
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                [self handleRequestFailue:task error:error];
            }];
        } else {
            request.sessionDataTask = [_manager POST:url parameters:param progress:^(NSProgress * _Nonnull downloadProgress) {
            [self handleRequestProgress:downloadProgress request:request];
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            request.responseJSONObject = responseObject;
            [self handleRequestSuccess:task];
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            [self handleRequestFailue:task error:error];

        }];
        }
    } else if (method == HGRequestMethodHead) {
        request.sessionDataTask = [_manager HEAD:url parameters:param success:^(NSURLSessionDataTask * _Nonnull task) {
            [self handleRequestSuccess:task];
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            [self handleRequestFailue:task error:error];
        }];
    } else if (method == HGRequestMethodPut) {
        request.sessionDataTask = [_manager PUT:url parameters:param success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            request.responseJSONObject = responseObject;
            [self handleRequestSuccess:task];
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            [self handleRequestFailue:task error:error];
        }];
    } else if (method == HGRequestMethodDelete) {
        request.sessionDataTask = [_manager DELETE:url parameters:param success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            request.responseJSONObject = responseObject;
            [self handleRequestSuccess:task];
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            [self handleRequestFailue:task error:error];
        }];
    } else {
//        NSLog(@"Error, unsupport method type");
        return;
    }
    
    [self addOperation:request];
}

- (void)cancelRequest:(HGBaseRequest *)request {
    [request.sessionDataTask cancel];
    [self removeOperation:request.sessionDataTask];
    [request clearCompletionBlock];
}

- (void)handleRequestProgress:(NSProgress *)progress request:(HGBaseRequest *)request{
    if (!request) {
        return;
    }
    
    if (request.delegate && [request.delegate respondsToSelector:@selector(requestProgress:)]) {
        [request.delegate requestProgress:progress];
    }
    if (request.progressBlock) {
        request.progressBlock(progress);
    }
}

- (void)handleRequestSuccess:(NSURLSessionDataTask *)sessionDataTask {
    NSString *key = [self keyForRequest:sessionDataTask];
    HGBaseRequest *request = _requestsRecord[key];
    
    if (request.delegate && [request.delegate respondsToSelector:@selector(requestFinished:)]) {
        [request.delegate requestFinished:request];
    }
    if (request.successCompletionBlock) {
        request.successCompletionBlock(request);
    }
    
    [self removeOperation:sessionDataTask];
    [request clearCompletionBlock];
    
}

- (void)handleRequestFailue:(NSURLSessionDataTask *)sessionDataTask error:(NSError *)error {
    NSString *key = [self keyForRequest:sessionDataTask];
    HGBaseRequest *request = _requestsRecord[key];
    if (request) {
        if (request.delegate && [request.delegate respondsToSelector:@selector(requestFailed:error:)]) {
            [request.delegate requestFailed:request error:error];
        }
        if (request.failureCompletionBlock) {
            request.failureCompletionBlock(request, error);
        }
    }
    
    [self removeOperation:sessionDataTask];
    [request clearCompletionBlock];
}

- (void)addOperation:(HGBaseRequest *)request {
    if (!request.sessionDataTask) {
        return;
    }
    
    NSString *key = [self keyForRequest:request.sessionDataTask];
    @synchronized(self) {
        _requestsRecord[key] = request;
    }
    
}

- (void)removeOperation:(NSURLSessionDataTask *)operation {
    NSString *key = [self keyForRequest:operation];
    @synchronized(self) {
        [_requestsRecord removeObjectForKey:key];
    }
}

- (NSString *)keyForRequest:(NSURLSessionDataTask *)object {
    NSString *key = [@(object.taskIdentifier) stringValue];
    return key;
}


@end
