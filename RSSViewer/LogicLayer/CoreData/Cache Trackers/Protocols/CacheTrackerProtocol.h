//
//  CacheTracker.h
//  RSSViewer
//
//  Created by Denis Skripnichenko on 21.12.2018.
//  Copyright © 2018 Denis Skripnichenko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CacheRequest.h"
#import "CacheTransactionBatch.h"

NS_ASSUME_NONNULL_BEGIN

@protocol CacheTrackerProtocol <NSObject>

/**
 Метод настраивает трекер кеша

 @param cacheRequest Запрос, описывающий поведение трекера
 */
- (void)setupWithCacheRequest:(CacheRequest *)cacheRequest;

/**
 Метод формирует батч транзакций исходя из текущего состояния кеша

 @return CacheTransactionBatch
 */
- (CacheTransactionBatch *)obtainTransactionBatchFromCurrentCache;


@end

NS_ASSUME_NONNULL_END
