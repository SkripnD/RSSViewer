//
//  RssSourceEditPresenter.h
//  RSSViewer
//
//  Created by Denis Skripnichenko on 24.12.2018.
//  Copyright © 2018 Denis Skripnichenko. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RssSourceEditProtocols.h"

NS_ASSUME_NONNULL_BEGIN

@interface RssSourceEditPresenter : NSObject<RssSourceEditInteractorOutputProtocol, RssSourceEditPresenterProtocol>

@property (nonatomic, weak, nullable) id<RssSourceEditViewProtocol> view;
@property (nonatomic) id<RssSourceEditInteractorInputProtocol> interactor;
@property (nonatomic) id<RssSourceEditWireframeProtocol> router;

- (instancetype)initWithInterface:(id<RssSourceEditViewProtocol>)interface interactor:(id<RssSourceEditInteractorInputProtocol>)interactor router:(id<RssSourceEditWireframeProtocol>)router;

@end

NS_ASSUME_NONNULL_END
