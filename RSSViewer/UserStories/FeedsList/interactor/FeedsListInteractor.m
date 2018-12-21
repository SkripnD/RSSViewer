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

@interface FeedsListInteractor()<NSFetchedResultsControllerDelegate, CacheTrackerProtocol>
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


    RssSource * item = [[RssSource alloc] initWithContext:self.coreDataManager.readContext];
    item.name = @"test";
    item.url = @"test2";
    [self.coreDataManager.readContext save:nil] ;

    CacheRequest * request = [CacheRequest requestWithPredicate:nil
                                                sortDescriptors:@[[[NSSortDescriptor alloc] initWithKey:@"dateCreated" ascending:YES]]
                                                    objectClass:[RssSource class] filterValue:nil];

    [self.cacheTracker setupWithCacheRequest:request];
    CacheTransactionBatch *initialBatch = [self.cacheTracker obtainTransactionBatchFromCurrentCache];

    [self.presenter feedSourcesFetched:self.fetchController.fetchedObjects];
}



@end
