//
//  RssItemsListRouter.h
//  RSSViewer
//
//  Created by Denis Skripnichenko on 24.12.2018.
//  Copyright © 2018 Denis Skripnichenko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RssItemsListProtocols.h"
#import "RssItemsListViewController.h"

@class RssSourceModel;
@interface RssItemsListRouter : NSObject<RssItemsListWireframeProtocol>

@property (nonatomic, weak) RssItemsListViewController *viewController;

+ (UIViewController *)createModuleWithRssSource:(RssSourceModel * _Nonnull)rssSourceModel;

@end
