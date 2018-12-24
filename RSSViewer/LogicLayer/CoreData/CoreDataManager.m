//
//  CoreDataManager.m
//  RSSViewer
//
//  Created by Denis Skripnichenko on 21.12.2018.
//  Copyright © 2018 Denis Skripnichenko. All rights reserved.
//

#import "CoreDataManager.h"

@interface CoreDataManager()
@property (nonatomic, strong) NSPersistentContainer * persistentContainer;

@end

@implementation CoreDataManager
@synthesize persistentContainer = _persistentContainer;

+ (id)sharedManager {
    static CoreDataManager *shared = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shared = [[self alloc] init];
    });
    return shared;
}

- (NSPersistentContainer *)persistentContainer {
    if (!_persistentContainer) {
        _persistentContainer = [[NSPersistentContainer alloc] initWithName:@"RSSViewer"];
        [_persistentContainer loadPersistentStoresWithCompletionHandler:^(NSPersistentStoreDescription *storeDescription, NSError *error) {
            if (error != nil) {

                NSLog(@"Unresolved error %@, %@", error, error.userInfo);
                abort();
            }
        }];
    }

    return _persistentContainer;
}

- (void) saveContext {
    NSManagedObjectContext * context = self.readContext;
    if ([context hasChanges]) {
        [context save:nil];
    }
}

- (NSManagedObjectContext *) readContext {
    return self.persistentContainer.viewContext;
}


@end
