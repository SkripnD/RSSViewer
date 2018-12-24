//
//  CacheRequest.h
//  RSSViewer
//
//  Created by Denis Skripnichenko on 21.12.2018.
//  Copyright © 2018 Denis Skripnichenko. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CacheRequest : NSObject

@property (strong, nonatomic, readonly) NSPredicate *predicate;
@property (strong, nonatomic, readonly) NSArray *sortDescriptors;
@property (assign, nonatomic, readonly) Class objectClass;
@property (strong, nonatomic, readonly) NSString *filterValue;

+ (instancetype)requestWithPredicate:(NSPredicate *)predicate
                     sortDescriptors:(NSArray *)sortDescriptors
                         objectClass:(Class)objectClass
                         filterValue:(NSString *)filterValue;

@end

NS_ASSUME_NONNULL_END
