//
//  RssItemModel.m
//  RSSViewer
//
//  Created by Denis Skripnichenko on 24.12.2018.
//  Copyright © 2018 Denis Skripnichenko. All rights reserved.
//

#import "RssItemModel.h"
#import <CoreData/CoreData.h>
#import "RssItem+CoreDataClass.h"

@implementation RssItemModel

- (void) mapFromManagedObject:(NSManagedObject *)managedObject {
    RssItem * rssItem = (RssItem *)managedObject;
    self.title = rssItem.title;
    self.guid = rssItem.guid;
    self.link = rssItem.link;
    self.descriptionText = rssItem.descriptionText;
    self.rssUrl = rssItem.rssUrl;
    self.dateCreated = rssItem.dateCreated;
}

@end
