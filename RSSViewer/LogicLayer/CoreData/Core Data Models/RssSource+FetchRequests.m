//
//  RssSource+FetchRequests.m
//  RSSViewer
//
//  Created by Denis Skripnichenko on 24.12.2018.
//  Copyright © 2018 Denis Skripnichenko. All rights reserved.
//

#import "RssSource+FetchRequests.h"

@implementation RssSource (FetchRequests)

+ (NSFetchRequest<RssSource *> *)fetchRequestByUrl:(NSString *)rssUrl withContext:(NSManagedObjectContext *)context {
    NSFetchRequest *fetch = [[NSFetchRequest alloc] init];
    NSEntityDescription *entityDescription = [NSEntityDescription entityForName:NSStringFromClass([RssSource class])  inManagedObjectContext: context];
    [fetch setEntity:entityDescription];
    [fetch setPredicate:[NSPredicate predicateWithFormat:@"url = %@", rssUrl]];
    return fetch;
}

@end
