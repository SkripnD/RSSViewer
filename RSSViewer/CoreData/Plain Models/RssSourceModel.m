//
//  RssSourceModel.m
//  RSSViewer
//
//  Created by Denis Skripnichenko on 22.12.2018.
//  Copyright © 2018 Denis Skripnichenko. All rights reserved.
//

#import "RssSourceModel.h"
#import <CoreData/CoreData.h>
#import "RssSource+CoreDataProperties.h"

@implementation RssSourceModel

- (void) mapFromManagedObject:(NSManagedObject *)managedObject {
    if (![managedObject isMemberOfClass:[RssSource class]]) {
        return;
    }

    RssSource * rssSource = (RssSource *)managedObject;
    self.url = rssSource.url;
    self.name = rssSource.name;
    self.dateSynced = rssSource.dateSynced;
}

@end
