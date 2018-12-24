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
#import "RssSource+FetchRequests.h"
#import "RssSourceModel.h"
#import "MWFeedParser.h"

#import "NSString+Hash.h"

typedef void (^ParsingCompletion)(MWFeedInfo * _Nullable feedInfo);

@interface RssSourcesService()<MWFeedParserDelegate>
@property (nonatomic, strong) CoreDataManager * coreDataManager;
@property (nonatomic, strong) PlainModelsFactory * modelsFactory;
@property (nonatomic, strong) MWFeedParser * feedParser;
@property (copy, nonatomic) ParsingCompletion parsingCompletion;

@end

@implementation RssSourcesService

- (id) init {
    if (self = [super init]) {
        self.coreDataManager = [CoreDataManager new];
    }
    return self;
}

- (void) createRssSource:(RssSourceModel *)fromModel completion:(nonnull void (^)(BOOL, RssSourceModel * _Nullable, NSString * _Nullable))completion {
    if ([self isUrlExist:fromModel.url]) {
        completion(NO, nil, @"Rss уже существует!");
    }


    __weak typeof(self)weakSelf = self;
    __block typeof(fromModel)_fromModel = fromModel;
    self.parsingCompletion = ^(MWFeedInfo * _Nullable feedInfo) {
        if (feedInfo == nil) {
            completion(NO, nil, @"Ошибка чтения Rss");
            return;
        }
        RssSource * item = [[RssSource alloc] initWithContext:weakSelf.coreDataManager.readContext];
        item.name = feedInfo.title;
        item.url = _fromModel.url;
        item.hashId = [_fromModel.url MD5hash];
        item.dateCreated = [NSDate date];
        [weakSelf.coreDataManager.readContext save:nil];

        id plainModel = [weakSelf.modelsFactory plainModelFromManagedObject:item];
        completion(YES, plainModel, nil);
    };

    NSURL *feedURL = [NSURL URLWithString:fromModel.url];
    self.feedParser = [[MWFeedParser alloc] initWithFeedURL:feedURL];
    self.feedParser.delegate = self;
    self.feedParser.feedParseType = ParseTypeInfoOnly;
    self.feedParser.connectionType = ConnectionTypeSynchronously;
    [self.feedParser parse];

}

- (void) updateRssSource:(RssSourceModel *)fromModel completion:(nonnull void (^)(BOOL, RssSourceModel * _Nullable, NSString * _Nullable))completion {
    
}


#pragma mark - Private

- (BOOL) isUrlExist:(NSString *) rssUrl {
    NSFetchRequest * request = [RssSource fetchRequestByUrl:rssUrl withContext:self.coreDataManager.readContext];
    NSArray * objects = [self.coreDataManager.readContext executeFetchRequest:request error:nil];

    return [objects count] >= 1;
}


#pragma mark - MWFeedParserDelegate

- (void)feedParserDidStart:(MWFeedParser *)parser {

}

- (void)feedParser:(MWFeedParser *)parser didParseFeedInfo:(MWFeedInfo *)info {
    dispatch_async(dispatch_get_main_queue(), ^{
        self.parsingCompletion(info);
    });
}

- (void)feedParser:(MWFeedParser *)parser didParseFeedItem:(MWFeedItem *)item {

}

- (void)feedParserDidFinish:(MWFeedParser *)parser {

}

- (void)feedParser:(MWFeedParser *)parser didFailWithError:(NSError *)error {
    self.parsingCompletion(nil);
}

@end
