//
//  CacheTransactionBatch.h
//  RSSViewer
//
//  Created by Denis Skripnichenko on 21.12.2018.
//  Copyright © 2018 Denis Skripnichenko. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class CacheTransaction;

@interface CacheTransactionBatch : NSObject

@property (strong, nonatomic, readonly) NSOrderedSet<CacheTransaction*> *insertTransactions;
@property (strong, nonatomic, readonly) NSOrderedSet<CacheTransaction*> *updateTransactions;
@property (strong, nonatomic, readonly) NSOrderedSet<CacheTransaction*> *deleteTransactions;
@property (strong, nonatomic, readonly) NSOrderedSet<CacheTransaction*> *moveTransactions;

/**
 Метод добавляет в батч новую транзакцию

 @param transaction Транзакция
 */
- (void)addTransaction:(CacheTransaction *)transaction;

/**
 Метод сообщает, содержит ли батч хоть одну транзакцию

 @return YES/NO
 */
- (BOOL)isEmpty;

@end

NS_ASSUME_NONNULL_END
