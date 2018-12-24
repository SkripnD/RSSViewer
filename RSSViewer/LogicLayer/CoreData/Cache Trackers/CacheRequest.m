//
//  CacheRequest.m
//  RSSViewer
//
//  Created by Denis Skripnichenko on 21.12.2018.
//  Copyright © 2018 Denis Skripnichenko. All rights reserved.
//

#import "CacheRequest.h"

@interface CacheRequest()
@property (strong, nonatomic) NSPredicate * predicatePrivate;
@property (strong, nonatomic) NSArray * sortDescriptorsPrivate;
@property (assign, nonatomic) Class objectClassPrivate;
@property (strong, nonatomic) NSString * filterValuePrivate;

@end

@implementation CacheRequest

+ (instancetype) requestWithPredicate:(NSPredicate *)predicate sortDescriptors:(NSArray *)sortDescriptors objectClass:(Class)objectClass filterValue:(NSString *)filterValue {
    CacheRequest * request = [CacheRequest new];
    request.predicatePrivate = predicate;
    request.sortDescriptorsPrivate = sortDescriptors;
    request.objectClassPrivate = objectClass;
    request.filterValuePrivate = filterValue;
    return request;
}

- (NSPredicate *) predicate {
    return self.predicatePrivate;
}

- (NSArray *) sortDescriptors {
    return self.sortDescriptorsPrivate;
}

- (Class) objectClass {
    return self.objectClassPrivate;
}

- (NSString *) filterValue {
    return self.filterValuePrivate;
}

@end
