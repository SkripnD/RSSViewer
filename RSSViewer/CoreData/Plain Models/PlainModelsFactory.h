//
//  PlainModelsFactory.h
//  RSSViewer
//
//  Created by Denis Skripnichenko on 22.12.2018.
//  Copyright © 2018 Denis Skripnichenko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PlainModelMappable.h"

NS_ASSUME_NONNULL_BEGIN


@class NSManagedObject;
@interface PlainModelsFactory : NSObject

- (NSArray<NSObject*>*) plainModelsFromManagedObjects:(NSArray<NSManagedObject *>*)managedObjects;
- (NSObject<PlainModelMappable>*) plainModelFromManagedObject:(NSManagedObject*) managedObject;

@end

NS_ASSUME_NONNULL_END
