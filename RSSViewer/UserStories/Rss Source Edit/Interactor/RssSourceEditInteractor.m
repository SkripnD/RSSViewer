//
//  RssSourceEditInteractor.m
//  RSSViewer
//
//  Created by Denis Skripnichenko on 24.12.2018.
//  Copyright © 2018 Denis Skripnichenko. All rights reserved.
//
 
#import "RssSourceEditInteractor.h"
#import "RssSourceModel.h"

@interface RssSourceEditInteractor()
@property (nonatomic, strong) RssSourceModel * rssSourceModel;

@end
 
@implementation RssSourceEditInteractor

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
 
@end
