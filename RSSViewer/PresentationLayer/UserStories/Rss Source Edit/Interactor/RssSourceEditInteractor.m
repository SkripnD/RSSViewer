//
//  RssSourceEditInteractor.m
//  RSSViewer
//
//  Created by Denis Skripnichenko on 24.12.2018.
//  Copyright © 2018 Denis Skripnichenko. All rights reserved.
//
 
#import "RssSourceEditInteractor.h"
#import "RssSourcesService.h"
#import "RssSourceModel.h"


@interface RssSourceEditInteractor()
@property (nonatomic, strong) RssSourceModel * rssSourceModel;
@property (nonatomic, strong) RssSourcesService * rssService;

@end
 
@implementation RssSourceEditInteractor

- (id) init {
    if (self = [super init]) {
        self.rssService = [RssSourcesService new];
    }
    return self;
}

#pragma mark - InteractorProtocol

- (void)setPresenter:(id<RssSourceEditInteractorOutputProtocol>)presenter
{
    _presenter = presenter;
}

- (id<RssSourceEditInteractorOutputProtocol>)getPresenter
{
    return self.presenter;
}


#pragma mark - RssSourceEditInteractorInputProtocol

- (void) setupWithRssSource:(RssSourceModel * _Nullable)rssSource {
    self.rssSourceModel = rssSource;

    if (self.rssSourceModel == nil) {
        self.rssSourceModel = [[RssSourceModel alloc] initAsNew];
    }
}

- (void) fetchRssSourceModel {
    [self.presenter handleRssSourceModel:self.rssSourceModel];
}

- (void) saveRssWithUrl:(NSString *)url {
    switch (self.rssSourceModel.modelState) {
        case RssSourceModelStateNew:
            [self createRssWith:url];
            break;
        case RssSourceModelStateNormal:
            [self updateRssWith:url];
            break;
    }
}


#pragma mark - Rss create / edit

- (void) updateRssWith:(NSString *)url {
    __weak typeof(self)weakSelf = self;
    [self.rssService updateRssSource:self.rssSourceModel completion:^(BOOL success, RssSourceModel * _Nullable updatedModel, NSString * _Nullable errorText) {

    }];
}

- (void) createRssWith:(NSString *)url {
    RssSourceModel * sourceModel = [[RssSourceModel alloc] initAsNew];
    sourceModel.url = url;

    __weak typeof(self)weakSelf = self;
    [self.rssService createRssSource:sourceModel completion:^(BOOL success, RssSourceModel * _Nullable rssSourceModel, NSString * _Nullable errorText) {
        if (success == NO) {
            [self.presenter handleSavingUrlResult:nil error:errorText];
            return;
        }
        weakSelf.rssSourceModel = rssSourceModel;
        [self.presenter handleSavingUrlResult:rssSourceModel error:nil];
    }];
}


@end
