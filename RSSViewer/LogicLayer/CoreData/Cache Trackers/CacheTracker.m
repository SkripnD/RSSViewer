//
//  CacheTracker.m
//  RSSViewer
//
//  Created by Denis Skripnichenko on 21.12.2018.
//  Copyright © 2018 Denis Skripnichenko. All rights reserved.
//

#import "CacheTracker.h"
#import "CoreDataManager.h"
#import "CacheTrackerProtocol.h"
#import "CacheRequest.h"
#import "CacheTransaction.h"
#import "CacheTransactionBatch.h"
#import "PlainModelsFactory.h"

@interface CacheTracker()<NSFetchedResultsControllerDelegate>
@property (nonatomic, strong) NSFetchedResultsController * fetchController;
@property (nonatomic, strong) CacheRequest * cacheRequest;
@property (nonatomic, strong) CacheTransactionBatch * transactionBatch;
@property (nonatomic, strong) PlainModelsFactory * objectsFactory;

@end

@implementation CacheTracker


#pragma mark - CacheTracker

- (void)setupWithCacheRequest:(CacheRequest *)cacheRequest {
    self.objectsFactory = [PlainModelsFactory new];

    self.cacheRequest = cacheRequest;

    NSManagedObjectContext *defaultContext = [CoreDataManager sharedManager].readContext;
    NSFetchRequest *fetchRequest = [self fetchRequestWithCacheRequest:cacheRequest];
    self.fetchController = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest
                                                               managedObjectContext:defaultContext
                                                                 sectionNameKeyPath:nil
                                                                          cacheName:nil];
    self.fetchController.delegate = self;
    [self.fetchController performFetch:nil];
}

- (NSFetchRequest *)fetchRequestWithCacheRequest:(CacheRequest *)cacheRequest {
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:[cacheRequest.objectClass entityName]];
    [fetchRequest setPredicate:cacheRequest.predicate];
    [fetchRequest setSortDescriptors:cacheRequest.sortDescriptors];
    return fetchRequest;
}

- (CacheTransactionBatch *)obtainTransactionBatchFromCurrentCache {
    CacheTransactionBatch *batch = [CacheTransactionBatch new];
    for (NSUInteger i = 0; i < self.fetchController.fetchedObjects.count; i++) {
        id object = self.fetchController.fetchedObjects[i];
        NSIndexPath *indexPath = [self.fetchController indexPathForObject:object];
        id plainObject = [self.objectsFactory plainModelFromManagedObject:object];
        CacheTransaction *transaction = [CacheTransaction transactionWithObject:plainObject
                                                                   oldIndexPath:nil
                                                               updatedIndexPath:indexPath
                                                                     objectType:NSStringFromClass(self.cacheRequest.objectClass)
                                                                     changeType:NSFetchedResultsChangeInsert];
        [batch addTransaction:transaction];
    }

    return batch;
}

- (id) cachedObjectForIndexPath:(NSIndexPath *)indexPath {
    id object = [self.fetchController objectAtIndexPath:indexPath];
    return [self.objectsFactory plainModelFromManagedObject:object];
}


#pragma mark - Методы NSFetchedResultsControllerDelegate

- (void)controllerWillChangeContent:(NSFetchedResultsController *)controller {
    self.transactionBatch = [CacheTransactionBatch new];
}

- (void)controller:(NSFetchedResultsController *)controller didChangeObject:(NSManagedObject *)anObject atIndexPath:(NSIndexPath *)indexPath forChangeType:(NSFetchedResultsChangeType)type newIndexPath:(NSIndexPath *)newIndexPath {
    id plainObject = [self.objectsFactory plainModelFromManagedObject:anObject];
    CacheTransaction *transaction = [CacheTransaction transactionWithObject:plainObject
                                                               oldIndexPath:indexPath
                                                           updatedIndexPath:newIndexPath
                                                                 objectType:NSStringFromClass(self.cacheRequest.objectClass)
                                                                 changeType:type];
    [self.transactionBatch addTransaction:transaction];
}

- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller {
    if ([self.transactionBatch isEmpty]) {
        return;
    }

    [self.delegate didProcessTransactionBatch:self.transactionBatch];
}


@end
