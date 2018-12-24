//
//  RssItemsListPresenter.h
//  RSSViewer
//
//  Created by Denis Skripnichenko on 24.12.2018.
//  Copyright © 2018 Denis Skripnichenko. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RssItemsListProtocols.h"

NS_ASSUME_NONNULL_BEGIN

@interface RssItemsListPresenter : NSObject<RssItemsListInteractorOutputProtocol, RssItemsListPresenterProtocol>

@property (nonatomic, weak, nullable) id<RssItemsListViewProtocol> view;
@property (nonatomic) id<RssItemsListInteractorInputProtocol> interactor;
@property (nonatomic) id<RssItemsListWireframeProtocol> router;

- (instancetype)initWithInterface:(id<RssItemsListViewProtocol>)interface interactor:(id<RssItemsListInteractorInputProtocol>)interactor router:(id<RssItemsListWireframeProtocol>)router;

@end

NS_ASSUME_NONNULL_END
