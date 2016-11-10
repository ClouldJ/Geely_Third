//
//  HGBaseRequest.h
//  HGToolKit
//
//  Created by haigui on 16/2/16.
//  Copyright © 2016年 haigui. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"
#import "HGNetworkPrivate.h"

typedef NS_ENUM(NSInteger , HGRequestMethod) {
    HGRequestMethodGet = 0,
    HGRequestMethodPost,
    HGRequestMethodHead,
    HGRequestMethodPut,
    HGRequestMethodDelete,
    HGRequestMethodPatch
};

typedef NS_ENUM(NSInteger , HGResponseSerializerType) {
    HGResponseSerializerTypeJSON = 0,
    HGResponseSerializerTypeHTTP
};

typedef NS_ENUM(NSInteger , HGRequestSerializerType) {
    HGRequestSerializerTypeHTTP = 0,
    HGRequestSerializerTypeJSON,
};

@class HGBaseRequest;

typedef void (^AFConstructingBlock)(id<AFMultipartFormData> formData);
typedef void (^HGRequestCompletionBlock)(__kindof HGBaseRequest *request);
typedef void (^HGRequestFailureBlock)(__kindof HGBaseRequest *request, NSError *error);

@protocol HGRequestDelegate <NSObject>

@optional

- (void)requestFinished:(HGBaseRequest *)request;
- (void)requestFailed:(HGBaseRequest *)request error:(NSError *)error;
- (void)requestProgress:(NSProgress *)progress;

@end

@interface HGBaseRequest : NSObject

//
//

/**
 *  请求的url地址, 如果是完整的url则忽略baseUrl
 */
@property (nonatomic, copy) NSString *requestUrl;
/**
 *  请求的baseUrl
 */
@property (nonatomic, copy) NSString *baseUrl;
/**
 *  请求的cdnUrl
 */
@property (nonatomic, copy) NSString *cdnUrl;
/**
 *  请求的参数列表
 */
@property (nonatomic, copy) id requestArgument;
/**
 *  http表头添加的自定义参数
 */
@property (nonatomic, copy) NSDictionary<NSString *, NSString *> *requestHeaderFieldValueDictionary;
/**
 *  当POST的内容带有文件等富文本时使用
 */
@property (nonatomic, copy) AFConstructingBlock constructingBodyBlock;

@property (nonatomic, strong) NSURLRequest *buildCustomUrlRequest;




//
//

/**
 *  请求的连接超时时间，默认为60秒
 */
@property (nonatomic, assign) NSTimeInterval requestTimeoutInterval;
/**
 *  是否使用cdn的host地址
 */
@property (nonatomic, assign) BOOL useCDN;
/**
 *  是否使用统一的参数加工
 */
@property (nonatomic, assign) BOOL useArgument;
/**
 *  是否使用统一的http表头的自定义参数
 */
@property (nonatomic, assign) BOOL useHeaderFieldValueDictionary;
/**
 *  Http请求的方法
 */
@property (nonatomic, assign) HGRequestMethod requestMethod;
/**
 *  请求的SerializerType
 */
@property (nonatomic, assign) HGRequestSerializerType requestSerializerType;

@property (nonatomic, assign) HGResponseSerializerType responseSerializerType;
/**
 *  request delegate object
 */
@property (nonatomic, weak) id<HGRequestDelegate> delegate;

//
//
//
@property (nonatomic, strong) NSURLSessionDataTask *sessionDataTask;
@property (nonatomic, copy) void (^successCompletionBlock)(HGBaseRequest *);
@property (nonatomic, copy) void (^failureCompletionBlock)(HGBaseRequest *, NSError *);
@property (nonatomic, copy) void (^progressBlock)(NSProgress * progress);
@property (nonatomic, strong) id responseJSONObject;


- (void)start;
- (void)stop;
- (void)clearCompletionBlock;

- (void)startWithBlockSuccess:(HGRequestCompletionBlock)success
                      failure:(HGRequestFailureBlock)failure;

- (void)startWithBlockProgress:(void (^)(NSProgress *))progress
                       success:(HGRequestCompletionBlock)success
                       failure:(HGRequestFailureBlock)failure;

@end
