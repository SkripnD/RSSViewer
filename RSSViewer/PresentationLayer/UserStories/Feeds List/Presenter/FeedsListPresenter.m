//
//  FeedsListPresenter.m
//  RSSViewer
//
//  Created by Denis Skripnichenko on 21.12.2018.
//  Copyright © 2018 Denis Skripnichenko. All rights reserved.
//
 
#import "FeedsListPresenter.h"
#import "CacheTransactionBatch.h"

@implementation FeedsListPresenter

- (instancetype)initWithInterface:(id<FeedsListViewProtocol>)interface interactor:(id<FeedsListInteractorInputProtocol>)interactor router:(id<FeedsListWireframeProtocol>)router
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


#pragma mark - FeedsListPresenterProtocol

- (void) startFetchFeedSources {
    [self.interactor fetchFeedSources];
}

- (void) openNewRssControllerFor:(UINavigationController *)navigationController {
    [self.router openRssEditControllerWith:navigationController forRssSource:nil];
}

- (void) openEditRssControllerFor:(NSIndexPath *)indexPath navigationController:(UINavigationController *)navigationController {
    RssSourceModel * rssSource = [self.interactor rssSourceModelForIndexPath:indexPath];
    [self.router openRssEditControllerWith:navigationController forRssSource:rssSource];
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
