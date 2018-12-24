//
//  PlainModelsFactory.m
//  RSSViewer
//
//  Created by Denis Skripnichenko on 22.12.2018.
//  Copyright © 2018 Denis Skripnichenko. All rights reserved.
//

#import "PlainModelsFactory.h"
#import <CoreData/CoreData.h>
#import "RssSource+CoreDataClass.h"
#import "RssItem+CoreDataClass.h"
#import "RssSourceModel.h"
#import "RssItemModel.h"

@implementation PlainModelsFactory

- (NSArray<NSObject*>*) plainModelsFromManagedObjects:(NSArray<NSManagedObject *>*) managedObjects {
    NSMutableArray * plainModels = [NSMutableArray new];
    for (NSManagedObject * managedObject in managedObjects) {
        id plainModel = [self plainModelFromManagedObject:managedObject];
        [plainModels addObject:plainModel];
    }
    return plainModels;
}

- (NSObject<PlainModelMappable>*) plainModelFromManagedObject:(NSManagedObject*) managedObject {
    Class plainClass = [[PlainModelsFactory plainClasses] objectForKey:[managedObject class]];
    NSObject<PlainModelMappable>* plainModel = [plainClass new];
    [plainModel mapFromManagedObject:managedObject];
    return plainModel;
}


+ (NSDictionary *) plainClasses {
    static NSMutableDictionary * _plainClasses = nil;
    static dispatch_once_t plainClassesToken;
    dispatch_once(&plainClassesToken, ^{
        _plainClasses = [NSMutableDictionary new];
        [_plainClasses setObject:[RssSourceModel class] forKey:[RssSource class]];
        [_plainClasses setObject:[RssItemModel class] forKey:[RssItem class]];
    });

    return _plainClasses;
}

@end
