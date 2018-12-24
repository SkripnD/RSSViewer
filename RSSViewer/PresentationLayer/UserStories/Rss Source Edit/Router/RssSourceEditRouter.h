//
//  RssSourceEditRouter.h
//  RSSViewer
//
//  Created by Denis Skripnichenko on 24.12.2018.
//  Copyright © 2018 Denis Skripnichenko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RssSourceEditProtocols.h"
#import "RssSourceEditViewController.h"

@class RssSourceModel;
@interface RssSourceEditRouter : NSObject<RssSourceEditWireframeProtocol>

@property (nonatomic, weak) RssSourceEditViewController *viewController;

+ (UIViewController *)createModuleWithRssSource:(RssSourceModel * _Nullable)rssSource;

@end
