//
//  RssItem+FetchRequests.h
//  RSSViewer
//
//  Created by Denis Skripnichenko on 24.12.2018.
//  Copyright © 2018 Denis Skripnichenko. All rights reserved.
//

#import "RssItem+CoreDataClass.h"

NS_ASSUME_NONNULL_BEGIN

@interface RssItem (FetchRequests)

+ (NSFetchRequest<RssItem *> *)fetchRequestByGuid:(NSString *)guid withContext:(NSManagedObjectContext *)context;

@end

NS_ASSUME_NONNULL_END
