//
//  RssItemTableViewCell.h
//  RSSViewer
//
//  Created by Denis Skripnichenko on 24.12.2018.
//  Copyright © 2018 Denis Skripnichenko. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class RssItemModel;
@interface RssItemTableViewCell : UITableViewCell

- (void) updateWith:(RssItemModel*)rssItem;

@end

NS_ASSUME_NONNULL_END
