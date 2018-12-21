//
//  FeedListTableViewCell.m
//  RSSViewer
//
//  Created by Denis Skripnichenko on 21.12.2018.
//  Copyright © 2018 Denis Skripnichenko. All rights reserved.
//

#import "FeedListTableViewCell.h"

@interface FeedListTableViewCell()
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *urlLabel;

@end

@implementation FeedListTableViewCell

- (void) updateWith:(RssSource *)rssSource {
    self.nameLabel.text = rssSource.name;
    self.urlLabel.text  = rssSource.url;
}

@end
