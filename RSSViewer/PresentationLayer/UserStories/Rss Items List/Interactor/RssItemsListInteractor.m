//
//  RssItemsListInteractor.m
//  RSSViewer
//
//  Created by Denis Skripnichenko on 24.12.2018.
//  Copyright © 2018 Denis Skripnichenko. All rights reserved.
//
 
#import "RssItemsListInteractor.h"
#import "RssSourceModel.h"
#import "CacheRequest.h"
#import "CacheTracker.h"
#import "RssItem+CoreDataClass.h"
#import "CacheTrackingProtocol.h"

@interface RssItemsListInteractor()<CacheTrackingProtocol>
@property (nonatomic, strong) CacheTracker * cacheTracker;

@end

@implementation RssItemsListInteractor

#pragma mark - InteractorProtocol

- (void)setPresenter:(id<RssItemsListInteractorOutputProtocol>)presenter
{
    _presenter = presenter;
}

- (id<RssItemsListInteractorOutputProtocol>)getPresenter
{
    return self.presenter;
}

- (void) setupWithRssSource:(RssSourceModel * _Nonnull)rssSourceModel {
    CacheRequest * cacheRequest = [CacheRequest requestWithPredicate:[NSPredicate predicateWithFormat:@"rssUrl = %@", rssSourceModel.url]
                                                     sortDescriptors:@[[[NSSortDescriptor alloc] initWithKey:@"dateCreated" ascending:YES]]
                                                         objectClass:[RssItem class] filterValue:@""];
    [self setupCacheTrackingWithCacheRequest:cacheRequest];
}


#pragma mark - RssItemsListInteractorInputProtocol

- (void) startFetchingRssItems {
    CacheTransactionBatch *initialBatch = [self.cacheTracker obtainTransactionBatchFromCurrentCache];
    [self.presenter didProcessCacheTransaction:initialBatch];
}


#pragma mark - CacheTrackingProtocol

- (void) didProcessTransactionBatch:(CacheTransactionBatch *)transactionBatch {
    [self.presenter didProcessCacheTransaction:transactionBatch];
}

- (void) setupCacheTrackingWithCacheRequest:(CacheRequest *)cacheRequest {
    self.cacheTracker = [CacheTracker new];
    self.cacheTracker.delegate = self;
    [self.cacheTracker setupWithCacheRequest:cacheRequest];
}

@end
