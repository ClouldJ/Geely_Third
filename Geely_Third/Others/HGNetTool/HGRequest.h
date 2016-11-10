//
//  HGRequest.h
//  MyHome
//
//  Created by haigui on 16/4/14.
//  Copyright © 2016年 haigui. All rights reserved.
//

#import "HGBaseRequest.h"

@interface HGRequest : HGBaseRequest

@property (nonatomic) BOOL ignoreCache;

/**
 *  当前缓存的对象
 */
@property (nonatomic, readonly, strong) id cacheJson;

- (id)cacheJson;

/**
 *  是否当前的数据从缓存获得
 */
@property (nonatomic, assign) BOOL isDataFromCache;


/// 返回是否当前缓存需要更新
- (BOOL)isCacheVersionExpired;

/**
 *  强制更新缓存
 */
- (void)startWithoutCache;

/**
 *  手动将其他请求的JsonResponse写入该请求的缓存
 *
 *  @param jsonResponse 其他请求jsonResponse
 */
- (void)saveJsonResponseToCacheFile:(id)jsonResponse;

/// For subclass to overwrite
@property (nonatomic, assign) NSInteger cacheTimeInSeconds;
@property (nonatomic, assign) long long cacheVersion;
@property (nonatomic, strong) id cacheSensitiveData;


@end
