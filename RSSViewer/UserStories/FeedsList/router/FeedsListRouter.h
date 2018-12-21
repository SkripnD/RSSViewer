//
//  FeedsListRouter.h
//  RSSViewer
//
//  Created by Denis Skripnichenko on 21.12.2018.
//  Copyright © 2018 Denis Skripnichenko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FeedsListProtocols.h"
#import "FeedsListViewController.h"

@interface FeedsListRouter : NSObject<FeedsListWireframeProtocol>

@property (nonatomic, weak) FeedsListViewController *viewController;

+ (UIViewController *)createModule;

@end