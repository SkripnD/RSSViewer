//
//  FeedsListInteractor.m
//  RSSViewer
//
//  Created by Denis Skripnichenko on 21.12.2018.
//  Copyright © 2018 Denis Skripnichenko. All rights reserved.
//
 
#import "FeedsListInteractor.h"
#import "CoreDataManager.h"
#import "CacheRequest.h"
#import "FeedSourcesCacheTracker.h"
#import "RssSource+CoreDataProperties.h"

#import "CacheTrackingProtocol.h"

@interface FeedsListInteractor()<NSFetchedResultsControllerDelegate, CacheTrackingProtocol>
@property (nonatomic, strong) CoreDataManager * coreDataManager;
@property (nonatomic, strong) FeedSourcesCacheTracker * cacheTracker;

@end

@implementation FeedsListInteractor

#pragma mark - FeedsListInteractorInputProtocol

- (void)setPresenter:(id<FeedsListInteractorOutputProtocol>)presenter
{
    _presenter = presenter;
}

- (id<FeedsListInteractorOutputProtocol>)getPresenter
{
    return self.presenter;
}

- (void) fetchFeedSources {
    self.coreDataManager = [CoreDataManager new];

    self.cacheTracker = [FeedSourcesCacheTracker new];

    NSLog(@"%@", self.coreDataManager.readContext);
    RssSource * item = [[RssSource alloc] initWithContext:self.coreDataManager.readContext];
    item.name = @"test";
    item.url = @"test2";
    [self.coreDataManager.readContext save:nil] ;

    CacheRequest * cacheRequest = [CacheRequest requestWithPredicate:nil
                                                sortDescriptors:@[[[NSSortDescriptor alloc] initWithKey:@"dateCreated" ascending:YES]]
                                                    objectClass:[RssSource class] filterValue:@""];

    [self setupCacheTrackingWithCacheRequest:cacheRequest];
}


#pragma mark - CacheTrackingProtocol

- (void) didProcessTransactionBatch:(CacheTransactionBatch *)transactionBatch {
    [self.presenter didProcessCacheTransaction:transactionBatch];
}

- (void) setupCacheTrackingWithCacheRequest:(CacheRequest *)cacheRequest {
    [self.cacheTracker setupWithCacheRequest:cacheRequest];
    CacheTransactionBatch *initialBatch = [self.cacheTracker obtainTransactionBatchFromCurrentCache];
    [self.presenter didProcessCacheTransaction:initialBatch];
}


@end
