//
//  RssItemsListInteractor.h
//  RSSViewer
//
//  Created by Denis Skripnichenko on 24.12.2018.
//  Copyright © 2018 Denis Skripnichenko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RssItemsListProtocols.h"

NS_ASSUME_NONNULL_BEGIN

@class RssSourceModel;
@interface RssItemsListInteractor : NSObject<RssItemsListInteractorInputProtocol>

@property (nonatomic, weak, nullable) id<RssItemsListInteractorOutputProtocol> presenter;

- (void) setupWithRssSource:(RssSourceModel* _Nonnull)rssSourceModel;

@end

NS_ASSUME_NONNULL_END
