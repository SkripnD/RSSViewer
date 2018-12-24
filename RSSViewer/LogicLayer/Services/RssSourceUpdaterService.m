//
//  RssSourceUpdaterService.m
//  RSSViewer
//
//  Created by Denis Skripnichenko on 24.12.2018.
//  Copyright © 2018 Denis Skripnichenko. All rights reserved.
//

#import "RssSourceUpdaterService.h"
#import "CoreDataManager.h"
#import "RssSourceModel.h"
#import "MWFeedParser.h"
#import "PlainModelsFactory.h"

#import "RssSource+FetchRequests.h"
#import "RssItem+FetchRequests.h"

@interface RssSourceUpdaterService()<MWFeedParserDelegate>
@property (nonatomic, strong) NSMutableArray * activeFeedParsers;

@end

@implementation RssSourceUpdaterService

+ (RssSourceUpdaterService*)sharedService {
    static RssSourceUpdaterService *shared = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shared = [[self alloc] init];
    });
    return shared;
}

- (void) setupWithSources {
    NSFetchRequest * request = [RssSource fetchRequestAllWithContext:[CoreDataManager sharedManager].readContext];
    NSArray * objects = [[CoreDataManager sharedManager].readContext executeFetchRequest:request error:nil];
    PlainModelsFactory * factory = [PlainModelsFactory new];
    for (RssSource * rssSource in objects) {
        RssSourceModel * rssSourceModel = (RssSourceModel *)[factory plainModelFromManagedObject:rssSource];
        [self appendSourceToUpdate:rssSourceModel];
    }
}

- (void) appendSourceToUpdate:(RssSourceModel *)rssSourceModel {
    MWFeedParser * feedParser = [[MWFeedParser alloc] initWithFeedURL:[NSURL URLWithString:rssSourceModel.url]];
    feedParser.delegate = self;
    feedParser.feedParseType = ParseTypeItemsOnly;
    feedParser.connectionType = ConnectionTypeAsynchronously;
    [feedParser parse];

    [self.activeFeedParsers addObject:feedParser];
}

- (void) handleFeedItem:(MWFeedItem*)item forUrl:(NSString *)url {
    if ([self isRssItemExist:item.identifier]) {
        return;
    }

    RssItem * rssItem = [[RssItem alloc] initWithContext:[CoreDataManager sharedManager].readContext];
    rssItem.guid = item.identifier;
    rssItem.title = item.title;
    rssItem.descriptionText = item.description;
    rssItem.link = item.link;
    rssItem.rssUrl = url;
    rssItem.dateCreated = [NSDate date];
    [[CoreDataManager sharedManager].readContext save:nil];
}

- (BOOL) isRssItemExist:(NSString *) guid {
    NSFetchRequest * request = [RssItem fetchRequestByGuid:guid withContext:[CoreDataManager sharedManager].readContext];
    NSArray * objects = [[CoreDataManager sharedManager].readContext executeFetchRequest:request error:nil];

    return [objects count] >= 1;
}


#pragma mark - MWFeedParserDelegate

- (void)feedParserDidStart:(MWFeedParser *)parser {

}

- (void)feedParser:(MWFeedParser *)parser didParseFeedInfo:(MWFeedInfo *)info {

}

- (void)feedParser:(MWFeedParser *)parser didParseFeedItem:(MWFeedItem *)item {
    [self handleFeedItem:item forUrl:parser.url.absoluteString];
}

- (void)feedParserDidFinish:(MWFeedParser *)parser {

}

- (void)feedParser:(MWFeedParser *)parser didFailWithError:(NSError *)error {

}

@end
