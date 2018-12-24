//
//  RssSourcesService.h
//  RSSViewer
//
//  Created by Denis Skripnichenko on 24.12.2018.
//  Copyright © 2018 Denis Skripnichenko. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@class RssSourceModel;
@interface RssSourcesService : NSObject

- (void) setupDefaultSourcesIfNeeded;

- (void) createRssSource:(RssSourceModel*)fromModel completion:(nullable void (^)(BOOL success, RssSourceModel * _Nullable rssSourceModel, NSString * _Nullable errorText))completion;

- (void) updateRssSource:(RssSourceModel*)fromModel completion:(nullable void (^)(BOOL success, RssSourceModel * _Nullable updatedModel, NSString * _Nullable errorText))completion;

@end

NS_ASSUME_NONNULL_END
