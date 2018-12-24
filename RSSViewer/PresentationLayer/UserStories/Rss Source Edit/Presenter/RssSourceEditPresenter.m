//
//  RssSourceEditPresenter.m
//  RSSViewer
//
//  Created by Denis Skripnichenko on 24.12.2018.
//  Copyright © 2018 Denis Skripnichenko. All rights reserved.
//
 
#import "RssSourceEditPresenter.h"
#import "RssSourceModel.h"

@implementation RssSourceEditPresenter

- (instancetype)initWithInterface:(id<RssSourceEditViewProtocol>)interface interactor:(id<RssSourceEditInteractorInputProtocol>)interactor router:(id<RssSourceEditWireframeProtocol>)router
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


#pragma mark - RssSourceEditPresenterProtocol

- (void) fetchRssSourceModel {
    [self.interactor fetchRssSourceModel];
}

- (void) saveRssWithUrl:(NSString *)url {
    [self.interactor saveRssWithUrl:url];
    [self.view startSavingLoader];
}


#pragma mark - RssSourceEditInteractorOutputProtocol

- (void) handleRssSourceModel:(RssSourceModel *)rssSourceModel {
    switch (rssSourceModel.modelState) {
        case RssSourceModelStateNew:
            [self.view configureForNewMode];
            break;
        case RssSourceModelStateNormal:
            [self.view configureForEditModeWith:rssSourceModel];
    }
}

- (void) handleSavingUrlResult:(RssSourceModel *)rssSourceModel error:(NSString *)error {
    // Error
    if (rssSourceModel == nil) {
        [self.view stopSavingLoaderWithError:error];
    } else {
        [self.view stopSavingLoaderSuccessfully];
        [self.view configureForEditModeWith:rssSourceModel];
    }
}

@end
