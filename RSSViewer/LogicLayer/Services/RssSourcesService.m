//
//  RssSourcesService.m
//  RSSViewer
//
//  Created by Denis Skripnichenko on 24.12.2018.
//  Copyright © 2018 Denis Skripnichenko. All rights reserved.
//

#import "RssSourcesService.h"
#import "CoreDataManager.h"
#import "PlainModelsFactory.h"
#import "RssSourceUpdaterService.h"
#import "RssSourceModel.h"
#import "MWFeedParser.h"

#import "RssSource+FetchRequests.h"
#import "NSString+Hash.h"

typedef void (^ParsingCompletion)(MWFeedInfo * _Nullable feedInfo);


@interface RssSourcesService()<MWFeedParserDelegate>
@property (nonatomic, strong) PlainModelsFactory * modelsFactory;
@property (nonatomic, strong) MWFeedParser * feedParser;
@property (copy, nonatomic) ParsingCompletion parsingCompletion;

@end

@implementation RssSourcesService

- (id) init {
    if (self = [super init]) {
        self.modelsFactory = [PlainModelsFactory new];
    }
    return self;
}

- (void) setupDefaultSourcesIfNeeded {
    NSArray * defaultSources = @[
                                        @"https://abcnews.go.com/abcnews/topstories",
                                        @"https://abcnews.go.com/abcnews/travelheadlines",
                                        @"https://abcnews.go.com/abcnews/worldnewsheadlines"
                                        ];
    
    for (NSString * source in defaultSources) {
        RssSourceModel * sourceModel = [[RssSourceModel alloc] initAsNew];
        sourceModel.url = source;
        [self createRssSource:sourceModel completion:nil];
    }
}

- (void) createRssSource:(RssSourceModel *)fromModel completion:(nullable void (^)(BOOL, RssSourceModel * _Nullable, NSString * _Nullable))completion {
    if ([self isUrlExist:fromModel.url]) {
        if (completion) {
            completion(NO, nil, @"Rss уже существует!");
        }
        return;
    }


    __weak typeof(self)weakSelf = self;
    __block typeof(fromModel)_fromModel = fromModel;
    self.parsingCompletion = ^(MWFeedInfo * _Nullable feedInfo) {
        if (feedInfo == nil) {
            if (completion) {
                completion(NO, nil, @"Ошибка чтения Rss");
            }
            return;
        }
        RssSource * item = [[RssSource alloc] initWithContext:[CoreDataManager sharedManager].readContext];
        item.name = feedInfo.title;
        item.url = _fromModel.url;
        item.hashId = [_fromModel.url MD5hash];
        item.dateCreated = [NSDate date];
        [[CoreDataManager sharedManager].readContext save:nil];

        id plainModel = [weakSelf.modelsFactory plainModelFromManagedObject:item];
        [[RssSourceUpdaterService sharedService] appendSourceToUpdate:plainModel];
        if (completion) {
            completion(YES, plainModel, nil);
        }
    };

    NSURL *feedURL = [NSURL URLWithString:fromModel.url];
    self.feedParser = [[MWFeedParser alloc] initWithFeedURL:feedURL];
    self.feedParser.delegate = self;
    self.feedParser.feedParseType = ParseTypeInfoOnly;
    self.feedParser.connectionType = ConnectionTypeSynchronously;
    [self.feedParser parse];

}

- (void) updateRssSource:(RssSourceModel *)fromModel completion:(nullable void (^)(BOOL, RssSourceModel * _Nullable, NSString * _Nullable))completion {
    
}


#pragma mark - Private

- (BOOL) isUrlExist:(NSString *) rssUrl {
    NSFetchRequest * request = [RssSource fetchRequestByUrl:rssUrl withContext:[CoreDataManager sharedManager].readContext];
    NSArray * objects = [[CoreDataManager sharedManager].readContext executeFetchRequest:request error:nil];

    return [objects count] >= 1;
}


#pragma mark - MWFeedParserDelegate

- (void)feedParserDidStart:(MWFeedParser *)parser {

}

- (void)feedParser:(MWFeedParser *)parser didParseFeedInfo:(MWFeedInfo *)info {
    self.parsingCompletion(info);
}

- (void)feedParser:(MWFeedParser *)parser didParseFeedItem:(MWFeedItem *)item {

}

- (void)feedParserDidFinish:(MWFeedParser *)parser {

}

- (void)feedParser:(MWFeedParser *)parser didFailWithError:(NSError *)error {
    self.parsingCompletion(nil);
}

@end
