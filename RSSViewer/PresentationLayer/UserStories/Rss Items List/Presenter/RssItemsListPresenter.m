//
//  RssItemsListPresenter.m
//  RSSViewer
//
//  Created by Denis Skripnichenko on 24.12.2018.
//  Copyright © 2018 Denis Skripnichenko. All rights reserved.
//
 
#import "RssItemsListPresenter.h"
#import "CacheTransactionBatch.h"

@implementation RssItemsListPresenter

- (instancetype)initWithInterface:(id<RssItemsListViewProtocol>)interface interactor:(id<RssItemsListInteractorInputProtocol>)interactor router:(id<RssItemsListWireframeProtocol>)router
{
    if (self = [super init])
    {
        self.view = interface;
        self.interactor = interactor;
        self.router = router;
        [self.interactor setPresenter:self];
    }
    return self;
}


#pragma mark - RssItemsListPresenterProtocol

- (void) fetchRssItems {
    [self.interactor startFetchingRssItems];
}


#pragma mark - FeedsListInteractorOutputProtocol

- (void) didProcessCacheTransaction:(CacheTransactionBatch *)transactionBatch {
    if ([transactionBatch.insertTransactions count] > 0 && self.view) {
        [self.view didProcessInsertTransactions:transactionBatch.insertTransactions];
    }
    if ([transactionBatch.updateTransactions count] > 0 && self.view) {
        [self.view didProcessUpdateTransactions:transactionBatch.updateTransactions];
    }
    if ([transactionBatch.deleteTransactions count] > 0 && self.view) {
        [self.view didProcessDeleteTransactions:transactionBatch.deleteTransactions];
    }
    if ([transactionBatch.moveTransactions count] > 0 && self.view) {
        [self.view didProcessMoveTransactions:transactionBatch.moveTransactions];
    }
}

@end
