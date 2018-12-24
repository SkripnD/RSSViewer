//
//  CacheTransactionBatch.m
//  RSSViewer
//
//  Created by Denis Skripnichenko on 21.12.2018.
//  Copyright © 2018 Denis Skripnichenko. All rights reserved.
//

#import "CacheTransactionBatch.h"
#import "CacheTransaction.h"

@interface CacheTransactionBatch()

@property (strong, nonatomic) NSMutableOrderedSet<CacheTransaction*> *insertTransactionsPrivate;
@property (strong, nonatomic) NSMutableOrderedSet<CacheTransaction*> *updateTransactionsPrivate;
@property (strong, nonatomic) NSMutableOrderedSet<CacheTransaction*> *deleteTransactionsPrivate;
@property (strong, nonatomic) NSMutableOrderedSet<CacheTransaction*> *moveTransactionsPrivate;

@end

@implementation CacheTransactionBatch

- (id) init {
    if (self = [super init]) {
        [self setupTransactions];
    }
    return self;
}

- (void) setupTransactions {
    _insertTransactionsPrivate = [NSMutableOrderedSet new];
    _updateTransactionsPrivate = [NSMutableOrderedSet new];
    _deleteTransactionsPrivate = [NSMutableOrderedSet new];
    _moveTransactionsPrivate = [NSMutableOrderedSet new];
}

- (void) addTransaction:(CacheTransaction *)transaction {
    switch (transaction.changeType) {
            case NSFetchedResultsChangeInsert:
                [_insertTransactionsPrivate addObject:transaction];
            break;
            case NSFetchedResultsChangeUpdate:
                [_updateTransactionsPrivate addObject:transaction];
            break;
            case NSFetchedResultsChangeDelete:
                [_deleteTransactionsPrivate addObject:transaction];
            break;
            case NSFetchedResultsChangeMove:
                [_moveTransactionsPrivate addObject:transaction];
            break;

        default:
            break;
    }
}

- (BOOL) isEmpty {
    return [_insertTransactionsPrivate count] == 0 &&
    [_updateTransactionsPrivate count] == 0 &&
    [_deleteTransactionsPrivate count] == 0 &&
    [_moveTransactionsPrivate count] == 0;
}


#pragma mark - Getters

- (NSOrderedSet *) insertTransactions {
    return _insertTransactionsPrivate;
}

- (NSOrderedSet *) updateTransactions {
    return _updateTransactionsPrivate;
}

- (NSOrderedSet *) deleteTransactions {
    return _deleteTransactionsPrivate;
}

- (NSOrderedSet *) moveTransactions {
    return _moveTransactionsPrivate;
}

@end
