//
//  RssItem+FetchRequests.m
//  RSSViewer
//
//  Created by Denis Skripnichenko on 24.12.2018.
//  Copyright © 2018 Denis Skripnichenko. All rights reserved.
//

#import "RssItem+FetchRequests.h"

@implementation RssItem (FetchRequests)

+ (NSFetchRequest<RssItem *> *)fetchRequestByGuid:(NSString *)guid withContext:(NSManagedObjectContext *)context {
    NSFetchRequest *fetch = [[NSFetchRequest alloc] init];
    NSEntityDescription *entityDescription = [NSEntityDescription entityForName:NSStringFromClass([RssItem class])  inManagedObjectContext: context];
    [fetch setEntity:entityDescription];
    [fetch setPredicate:[NSPredicate predicateWithFormat:@"guid = %@", guid]];
    return fetch;
}

@end
