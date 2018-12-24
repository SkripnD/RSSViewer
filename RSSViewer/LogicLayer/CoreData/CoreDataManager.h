//
//  CoreDataManager.h
//  RSSViewer
//
//  Created by Denis Skripnichenko on 21.12.2018.
//  Copyright © 2018 Denis Skripnichenko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

NS_ASSUME_NONNULL_BEGIN

@interface CoreDataManager : NSObject
+ (CoreDataManager*)sharedManager;

@property (nonatomic, readonly) NSManagedObjectContext * readContext;


@end

NS_ASSUME_NONNULL_END
