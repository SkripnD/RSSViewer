//
//  FeedsListProtocols.h
//  RSSViewer
//
//  Created by Denis Skripnichenko on 21.12.2018.
//  Copyright © 2018 Denis Skripnichenko. All rights reserved.
//

#import <Foundation/Foundation.h>

#pragma mark - WireFrameProtocol

@protocol FeedsListWireframeProtocol <NSObject>

@end

#pragma mark - PresenterProtocol

@protocol FeedsListPresenterProtocol <NSObject>
- (void) startFetchFeedSources;

@end

#pragma mark - InteractorProtocol

@protocol FeedsListInteractorOutputProtocol <NSObject>

/** Interactor -> Presenter */

- (void) feedSourcesFetched:(NSArray *)feedSources;

@end

@protocol FeedsListInteractorInputProtocol <NSObject>

- (void)setPresenter:(id<FeedsListInteractorOutputProtocol>)presenter;
- (id<FeedsListInteractorOutputProtocol>)getPresenter;
- (void) fetchFeedSources;
/** Presenter -> Interactor */

@end

#pragma mark - ViewProtocol

@protocol FeedsListViewProtocol <NSObject>

/** Presenter -> ViewController */

- (void) showFeedSources:(NSArray *) feedSources;

@end
