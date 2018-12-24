//
//  RssItemTableViewCell.m
//  RSSViewer
//
//  Created by Denis Skripnichenko on 24.12.2018.
//  Copyright © 2018 Denis Skripnichenko. All rights reserved.
//

#import "RssItemTableViewCell.h"
#import "RssItemModel.h"

@interface RssItemTableViewCell()
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *descrLabel;

@end

@implementation RssItemTableViewCell

- (void) updateWith:(RssItemModel *)rssItem {
    self.titleLabel.text = rssItem.title;
    self.descrLabel.text = rssItem.descriptionText;
}


@end
