//
//  RssSourceUpdaterService.h
//  RSSViewer
//
//  Created by Denis Skripnichenko on 24.12.2018.
//  Copyright © 2018 Denis Skripnichenko. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class RssSourceModel;
@interface RssSourceUpdaterService : NSObject

+ (RssSourceUpdaterService*)sharedService;

- (void) setupWithSources;

- (void) appendSourceToUpdate:(RssSourceModel*)rssSourceModel;

@end

NS_ASSUME_NONNULL_END
