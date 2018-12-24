//
//  FeedsListInteractor.m
//  RSSViewer
//
//  Created by Denis Skripnichenko on 21.12.2018.
//  Copyright © 2018 Denis Skripnichenko. All rights reserved.
//
 
#import "FeedsListInteractor.h"
#import "CacheRequest.h"
#import "CacheTracker.h"
#import "RssSourcesService.h"
#import "RssSource+CoreDataProperties.h"
#import "CacheTrackingProtocol.h"

@class RssSourceModel;
@interface FeedsListInteractor()<CacheTrackingProtocol>
@property (nonatomic, strong) CacheTracker * cacheTracker;
@property (nonatomic, strong) RssSourcesService * rssSourcesService;

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
    self.rssSourcesService = [RssSourcesService new];
    [self.rssSourcesService setupDefaultSourcesIfNeeded];

    self.cacheTracker = [CacheTracker new];
    CacheRequest * cacheRequest = [CacheRequest requestWithPredicate:nil
                                                sortDescriptors:@[[[NSSortDescriptor alloc] initWithKey:@"dateCreated" ascending:YES]]
                                                    objectClass:[RssSource class] filterValue:@""];

    [self setupCacheTrackingWithCacheRequest:cacheRequest];
}

- (RssSourceModel *) rssSourceModelForIndexPath:(NSIndexPath *)indexPath {
    return [self.cacheTracker cachedObjectForIndexPath:indexPath];
}


#pragma mark - CacheTrackingProtocol

- (void) didProcessTransactionBatch:(CacheTransactionBatch *)transactionBatch {
    [self.presenter didProcessCacheTransaction:transactionBatch];
}

- (void) setupCacheTrackingWithCacheRequest:(CacheRequest *)cacheRequest {
    self.cacheTracker = [CacheTracker new];
    self.cacheTracker.delegate = self;
    [self.cacheTracker setupWithCacheRequest:cacheRequest];
    CacheTransactionBatch *initialBatch = [self.cacheTracker obtainTransactionBatchFromCurrentCache];
    [self.presenter didProcessCacheTransaction:initialBatch];
}


@end
