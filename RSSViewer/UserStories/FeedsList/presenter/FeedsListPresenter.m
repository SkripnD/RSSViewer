//
//  FeedsListPresenter.m
//  RSSViewer
//
//  Created by Denis Skripnichenko on 21.12.2018.
//  Copyright © 2018 Denis Skripnichenko. All rights reserved.
//
 
#import "FeedsListPresenter.h"

@implementation FeedsListPresenter

- (instancetype)initWithInterface:(id<FeedsListViewProtocol>)interface interactor:(id<FeedsListInteractorInputProtocol>)interactor router:(id<FeedsListWireframeProtocol>)router
{
    if (self = [super init])
    {
        self.view = interface;
        self.interactor = interactor;
        self.router = router;
        [self.interactor setPresenter:self];
    }
    return self;
}


#pragma mark - FeedsListPresenterProtocol

- (void) startFetchFeedSources {
    [self.interactor fetchFeedSources];
}


#pragma mark - FeedsListInteractorOutputProtocol

- (void) feedSourcesFetched:(NSArray *)feedSources {
    [self.view showFeedSources:feedSources];
}


@end
