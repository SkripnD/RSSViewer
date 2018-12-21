//
//  FeedsListPresenter.h
//  RSSViewer
//
//  Created by Denis Skripnichenko on 21.12.2018.
//  Copyright © 2018 Denis Skripnichenko. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FeedsListProtocols.h"

NS_ASSUME_NONNULL_BEGIN

@interface FeedsListPresenter : NSObject<FeedsListInteractorOutputProtocol, FeedsListPresenterProtocol>

@property (nonatomic, weak, nullable) id<FeedsListViewProtocol> view;
@property (nonatomic) id<FeedsListInteractorInputProtocol> interactor;
@property (nonatomic) id<FeedsListWireframeProtocol> router;

- (instancetype)initWithInterface:(id<FeedsListViewProtocol>)interface interactor:(id<FeedsListInteractorInputProtocol>)interactor router:(id<FeedsListWireframeProtocol>)router;

@end

NS_ASSUME_NONNULL_END
