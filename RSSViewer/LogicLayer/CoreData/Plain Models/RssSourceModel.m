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

- (id) initAsNew {
    if (self = [super init]) {
        self.modelState = RssSourceModelStateNew;
    }
    return self;
}

- (void) mapFromManagedObject:(NSManagedObject *)managedObject {
    RssSource * rssSource = (RssSource *)managedObject;
    self.hashId = rssSource.hashId;
    self.url = rssSource.url;
    self.name = rssSource.name;
    self.dateSynced = rssSource.dateSynced;
    self.dateCreated = rssSource.dateCreated;
    self.modelState = RssSourceModelStateNormal;
}

@end
