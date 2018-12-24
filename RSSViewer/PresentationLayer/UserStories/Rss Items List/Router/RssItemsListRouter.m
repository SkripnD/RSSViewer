//
//  RssItemsListRouter.m
//  RSSViewer
//
//  Created by Denis Skripnichenko on 24.12.2018.
//  Copyright © 2018 Denis Skripnichenko. All rights reserved.
//
 
#import "RssItemsListRouter.h"
#import "RssItemsListViewController.h"
#import "RssItemsListInteractor.h"
#import "RssItemsListPresenter.h"
#import "RssSourceModel.h"
 
@implementation RssItemsListRouter

+ (UIViewController *)createModuleWithRssSource:(RssSourceModel * _Nonnull)rssSourceModel
{
    NSString * controllerName = NSStringFromClass([RssItemsListViewController class]);
    RssItemsListViewController *viewController = [[self storyboard] instantiateViewControllerWithIdentifier:controllerName];
    viewController.sourceTitle = rssSourceModel.name;

    RssItemsListInteractor *interactor = [[RssItemsListInteractor alloc] init];
    [interactor setupWithRssSource:rssSourceModel];

    RssItemsListRouter *router = [[RssItemsListRouter alloc] init];
    RssItemsListPresenter *presenter = [[RssItemsListPresenter alloc] initWithInterface:viewController interactor:interactor router:router];
    viewController.presenter = presenter;
    router.viewController = viewController;
    return viewController;
}

+ (UIStoryboard *)storyboard {
    return [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
}

@end
