//
//  FeedListTableViewCell.h
//  RSSViewer
//
//  Created by Denis Skripnichenko on 21.12.2018.
//  Copyright © 2018 Denis Skripnichenko. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RssSource+CoreDataProperties.h"

NS_ASSUME_NONNULL_BEGIN

@interface FeedListTableViewCell : UITableViewCell

- (void) updateWith:(RssSource*)rssSource;

@end

NS_ASSUME_NONNULL_END
