//
//  FeedSourcesCacheTracker.h
//  RSSViewer
//
//  Created by Denis Skripnichenko on 21.12.2018.
//  Copyright © 2018 Denis Skripnichenko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CacheTrackerProtocol.h"
#import "CacheTrackingProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface FeedSourcesCacheTracker : NSObject<CacheTrackerProtocol>
@property (nonatomic, weak) id<CacheTrackingProtocol>delegate;

@end

NS_ASSUME_NONNULL_END
