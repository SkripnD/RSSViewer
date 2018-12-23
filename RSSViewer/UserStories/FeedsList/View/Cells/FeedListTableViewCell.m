//
//  FeedListTableViewCell.m
//  RSSViewer
//
//  Created by Denis Skripnichenko on 21.12.2018.
//  Copyright © 2018 Denis Skripnichenko. All rights reserved.
//

#import "FeedListTableViewCell.h"
#import "RssSourceModel.h"

@interface FeedListTableViewCell()
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *urlLabel;

@end

@implementation FeedListTableViewCell

- (void) updateWith:(RssSourceModel *)rssSource {
    self.nameLabel.text = rssSource.name;
    self.urlLabel.text  = rssSource.url;
}

@end
