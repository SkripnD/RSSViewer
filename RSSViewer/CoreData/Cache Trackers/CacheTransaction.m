//
//  CacheTransaction.m
//  RSSViewer
//
//  Created by Denis Skripnichenko on 21.12.2018.
//  Copyright © 2018 Denis Skripnichenko. All rights reserved.
//

#import "CacheTransaction.h"

@interface CacheTransaction()
@property (strong, nonatomic) id objectPrivate;
@property (strong, nonatomic) NSIndexPath * oldIndexPathPrivate;
@property (strong, nonatomic) NSIndexPath * updatedIndexPathPrivate;
@property (strong, nonatomic) NSString * objectTypePrivate;
@property (assign, nonatomic) NSFetchedResultsChangeType changeTypePrivate;

@end

@implementation CacheTransaction

+ (instancetype) transactionWithObject:(id)object oldIndexPath:(NSIndexPath *)oldIndexPath updatedIndexPath:(NSIndexPath *)updatedIndexPath objectType:(NSString *)objectType changeType:(NSUInteger)changeType {
    CacheTransaction * transaction = [CacheTransaction new];
    transaction.objectPrivate = object;
    transaction.oldIndexPathPrivate = oldIndexPath;
    transaction.updatedIndexPathPrivate = updatedIndexPath;
    transaction.objectTypePrivate = objectType;
    transaction.changeTypePrivate = changeType;
    return transaction;
}

- (id) object {
    return self.objectPrivate;
}

- (NSIndexPath *) oldIndexPath {
    return self.oldIndexPathPrivate;
}

- (NSIndexPath *) updatedIndexPath {
    return self.updatedIndexPathPrivate;
}

- (NSString *) objectType {
    return self.objectTypePrivate;
}

- (NSFetchedResultsChangeType) changeType {
    return self.changeTypePrivate;
}

@end
