//
//  FeedsListProtocols.h
//  RSSViewer
//
//  Created by Denis Skripnichenko on 21.12.2018.
//  Copyright © 2018 Denis Skripnichenko. All rights reserved.
//

#import <Foundation/Foundation.h>

#pragma mark - WireFrameProtocol

@class UINavigationController;
@class RssSourceModel;
@protocol FeedsListWireframeProtocol <NSObject>

- (void) openRssEditControllerWith:(UINavigationController*) navigationController forRssSource:(RssSourceModel* _Nullable)rssSource;
- (void) openRssViewControllerWith:(UINavigationController*) navigationController forRssSource:(RssSourceModel* _Nonnull)rssSource;

@end

#pragma mark - PresenterProtocol

@protocol FeedsListPresenterProtocol <NSObject>
/**
 Метод сообщает Presenter'у о необходимости
 загрузки списка Rss источников
 */
- (void) startFetchFeedSources;

- (void) openNewRssControllerFor:(UINavigationController*) navigationController;

- (void) openEditRssControllerFor:(NSIndexPath *)indexPath navigationController:(UINavigationController*) navigationController;

- (void) openViewRssControllerFor:(NSIndexPath *)indexPath navigationController:(UINavigationController*) navigationController;

@end

#pragma mark - InteractorProtocol

@class CacheTransactionBatch;
@protocol FeedsListInteractorOutputProtocol <NSObject>

/** Interactor -> Presenter */

- (void) didProcessCacheTransaction:(CacheTransactionBatch*) transactionBatch;

@end

@class RssSourceModel;
@protocol FeedsListInteractorInputProtocol <NSObject>

- (void)setPresenter:(id<FeedsListInteractorOutputProtocol>)presenter;
- (id<FeedsListInteractorOutputProtocol>)getPresenter;

/** Presenter -> Interactor */

- (void) fetchFeedSources;

- (RssSourceModel *) rssSourceModelForIndexPath:(NSIndexPath *) indexPath;

@end

#pragma mark - ViewProtocol

@class CacheTransaction;
@protocol FeedsListViewProtocol <NSObject>

/** Presenter -> ViewController */
@required
- (void) didProcessInsertTransactions:(NSOrderedSet<CacheTransaction*>*)transactions;
- (void) didProcessUpdateTransactions:(NSOrderedSet<CacheTransaction*>*)transactions;
- (void) didProcessDeleteTransactions:(NSOrderedSet<CacheTransaction*>*)transactions;
- (void) didProcessMoveTransactions:(NSOrderedSet<CacheTransaction*>*)transactions;

@end
