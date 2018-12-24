//
//  RssSourceEditProtocols.h
//  RSSViewer
//
//  Created by Denis Skripnichenko on 24.12.2018.
//  Copyright © 2018 Denis Skripnichenko. All rights reserved.
//

#import <Foundation/Foundation.h>

#pragma mark - WireFrameProtocol

@class UINavigationController;
@protocol RssSourceEditWireframeProtocol <NSObject>

- (void) goBackForNavigationController:(UINavigationController*) navigationController;

@end

#pragma mark - PresenterProtocol

@protocol RssSourceEditPresenterProtocol <NSObject>
- (void) fetchRssSourceModel;

- (void) saveRssWithUrl:(NSString *)url;

- (void) goBackForNavigationController:(UINavigationController*) navigationController;

@end

#pragma mark - InteractorProtocol

@class RssSourceModel;
@protocol RssSourceEditInteractorOutputProtocol <NSObject>

/** Interactor -> Presenter */
- (void) handleRssSourceModel:(RssSourceModel *)rssSourceModel;

- (void) handleSavingUrlResult:(RssSourceModel* _Nullable)rssSourceModel error:(NSString*)error;

@end

@class RssSourceModel;
@protocol RssSourceEditInteractorInputProtocol <NSObject>

- (void)setPresenter:(id<RssSourceEditInteractorOutputProtocol>)presenter;
- (id<RssSourceEditInteractorOutputProtocol>)getPresenter;
- (void) setupWithRssSource:(RssSourceModel * _Nullable) rssSource;

/** Presenter -> Interactor */

- (void) fetchRssSourceModel;

- (void) saveRssWithUrl:(NSString *)url;

@end

#pragma mark - ViewProtocol

@protocol RssSourceEditViewProtocol <NSObject>

/** Presenter -> ViewController */

- (void) configureForEditModeWith:(RssSourceModel *)rssSourceModel;
- (void) configureForNewMode;

- (void) startSavingLoader;
- (void) stopSavingLoaderSuccessfully;
- (void) stopSavingLoaderWithError:(NSString *)error;



@end
