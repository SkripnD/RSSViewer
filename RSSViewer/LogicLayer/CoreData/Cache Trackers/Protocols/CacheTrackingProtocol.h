//
//  CacheTrackingProtocol.h
//  RSSViewer
//
//  Created by Denis Skripnichenko on 23.12.2018.
//  Copyright © 2018 Denis Skripnichenko. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class CacheRequest;
@class CacheTransactionBatch;

@protocol CacheTrackingProtocol <NSObject>

- (void)setupCacheTrackingWithCacheRequest:(CacheRequest *)cacheRequest;

- (void)didProcessTransactionBatch:(CacheTransactionBatch *)transactionBatch;

@end

NS_ASSUME_NONNULL_END
