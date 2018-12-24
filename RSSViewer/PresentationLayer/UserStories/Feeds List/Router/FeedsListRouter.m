//
//  FeedsListRouter.m
//  RSSViewer
//
//  Created by Denis Skripnichenko on 21.12.2018.
//  Copyright © 2018 Denis Skripnichenko. All rights reserved.
//
 
#import "FeedsListRouter.h"
#import "FeedsListViewController.h"
#import "FeedsListInteractor.h"
#import "FeedsListPresenter.h"
#import "RssSourceEditRouter.h"
 #import "RssItemsListRouter.h"

@implementation FeedsListRouter

+ (UIViewController *)createModule
{
    NSString * controllerName = NSStringFromClass([FeedsListViewController class]);

    FeedsListViewController *viewController = [[self storyboard] instantiateViewControllerWithIdentifier:controllerName];

    FeedsListInteractor *interactor = [[FeedsListInteractor alloc] init];
    FeedsListRouter *router = [[FeedsListRouter alloc] init];
    FeedsListPresenter *presenter = [[FeedsListPresenter alloc] initWithInterface:viewController interactor:interactor router:router];
    viewController.presenter = presenter;
    router.viewController = viewController;
    return viewController;
}

+ (UIStoryboard *)storyboard {
    return [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
}


#pragma mark - FeedsListWireframeProtocol

- (void) openRssEditControllerWith:(UINavigationController*) navigationController forRssSource:(RssSourceModel* _Nullable)rssSource {
    UIViewController * rssSourceViewController = [RssSourceEditRouter createModuleWithRssSource:rssSource];
    [navigationController pushViewController:rssSourceViewController animated:YES];
}

- (void) openRssViewControllerWith:(UINavigationController*) navigationController forRssSource:(RssSourceModel* _Nonnull)rssSource {
    UIViewController * rssSourceViewController = [RssItemsListRouter createModuleWithRssSource:rssSource];
    [navigationController pushViewController:rssSourceViewController animated:YES];
}
 
@end
