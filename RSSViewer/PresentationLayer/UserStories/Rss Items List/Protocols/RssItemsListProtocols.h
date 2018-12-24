//
//  RssItemsListProtocols.h
//  RSSViewer
//
//  Created by Denis Skripnichenko on 24.12.2018.
//  Copyright © 2018 Denis Skripnichenko. All rights reserved.
//

#import <Foundation/Foundation.h>

#pragma mark - WireFrameProtocol

@protocol RssItemsListWireframeProtocol <NSObject>

@end

#pragma mark - PresenterProtocol

@protocol RssItemsListPresenterProtocol <NSObject>

- (void) fetchRssItems;

@end

#pragma mark - InteractorProtocol

@class CacheTransactionBatch;
@protocol RssItemsListInteractorOutputProtocol <NSObject>

/** Interactor -> Presenter */
- (void) didProcessCacheTransaction:(CacheTransactionBatch *)transactionBatch;

@end

@protocol RssItemsListInteractorInputProtocol <NSObject>

- (void)setPresenter:(id<RssItemsListInteractorOutputProtocol>)presenter;
- (id<RssItemsListInteractorOutputProtocol>)getPresenter;

/** Presenter -> Interactor */

- (void) startFetchingRssItems;

@end

#pragma mark - ViewProtocol

@class CacheTransaction;
@protocol RssItemsListViewProtocol <NSObject>

/** Presenter -> ViewController */
@required
- (void) didProcessInsertTransactions:(NSOrderedSet<CacheTransaction*>*)transactions;
- (void) didProcessUpdateTransactions:(NSOrderedSet<CacheTransaction*>*)transactions;
- (void) didProcessDeleteTransactions:(NSOrderedSet<CacheTransaction*>*)transactions;
- (void) didProcessMoveTransactions:(NSOrderedSet<CacheTransaction*>*)transactions;

@end
