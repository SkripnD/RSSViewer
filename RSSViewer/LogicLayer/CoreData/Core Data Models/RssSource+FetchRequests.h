//
//  RssSource+FetchRequests.h
//  RSSViewer
//
//  Created by Denis Skripnichenko on 24.12.2018.
//  Copyright © 2018 Denis Skripnichenko. All rights reserved.
//

#import "RssSource+CoreDataClass.h"

NS_ASSUME_NONNULL_BEGIN

@interface RssSource (FetchRequests)

+ (NSFetchRequest<RssSource *> *)fetchRequestByUrl:(NSString *)rssUrl withContext:(NSManagedObjectContext *)context;

@end

NS_ASSUME_NONNULL_END
