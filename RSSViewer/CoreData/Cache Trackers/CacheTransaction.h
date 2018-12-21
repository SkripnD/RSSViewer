//
//  CacheTransaction.h
//  RSSViewer
//
//  Created by Denis Skripnichenko on 21.12.2018.
//  Copyright © 2018 Denis Skripnichenko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

NS_ASSUME_NONNULL_BEGIN

@interface CacheTransaction : NSObject

/**
 Измененный объект
 */
@property (strong, nonatomic, readonly) id object;

/**
 IndexPath объекта до его изменения
 */
@property (strong, nonatomic, readonly) NSIndexPath *oldIndexPath;

/**
 IndexPath объекта после его изменения
 */
@property (strong, nonatomic, readonly) NSIndexPath *updatedIndexPath;

/**
 Тип измененного объекта
 */
@property (strong, nonatomic, readonly) NSString *objectType;

/**
 Тип изменения
 */
@property (assign, nonatomic, readonly) NSFetchedResultsChangeType changeType;

+ (instancetype)transactionWithObject:(id)object
                         oldIndexPath:(NSIndexPath *)oldIndexPath
                     updatedIndexPath:(NSIndexPath *)updatedIndexPath
                           objectType:(NSString *)objectType
                           changeType:(NSUInteger)changeType;

@end

NS_ASSUME_NONNULL_END
