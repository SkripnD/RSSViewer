//
//  PlainModelMappable.h
//  RSSViewer
//
//  Created by Denis Skripnichenko on 23.12.2018.
//  Copyright © 2018 Denis Skripnichenko. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class NSManagedObject;
@protocol PlainModelMappable <NSObject>

- (void) mapFromManagedObject:(NSManagedObject *)managedObject;

@end

NS_ASSUME_NONNULL_END
