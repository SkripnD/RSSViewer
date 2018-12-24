//
//  RssSourceEditRouter.m
//  RSSViewer
//
//  Created by Denis Skripnichenko on 24.12.2018.
//  Copyright © 2018 Denis Skripnichenko. All rights reserved.
//
 
#import "RssSourceEditRouter.h"
#import "RssSourceEditViewController.h"
#import "RssSourceEditInteractor.h"
#import "RssSourceEditPresenter.h"
 
@implementation RssSourceEditRouter

+ (UIViewController *)createModuleWithRssSource:(RssSourceModel * _Nullable)rssSource
{
    NSString * controllerName = NSStringFromClass([RssSourceEditViewController class]);
    RssSourceEditViewController *viewController = [[self storyboard] instantiateViewControllerWithIdentifier:controllerName];

    
    RssSourceEditInteractor *interactor = [[RssSourceEditInteractor alloc] init];
    [interactor setupWithRssSource:rssSource];

    RssSourceEditRouter *router = [[RssSourceEditRouter alloc] init];
    RssSourceEditPresenter *presenter = [[RssSourceEditPresenter alloc] initWithInterface:viewController interactor:interactor router:router];
    viewController.presenter = presenter;
    router.viewController = viewController;
    return viewController;
}

+ (UIStoryboard *)storyboard {
    return [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
}

@end
