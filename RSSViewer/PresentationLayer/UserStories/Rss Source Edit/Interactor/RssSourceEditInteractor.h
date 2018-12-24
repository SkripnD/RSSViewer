//
//  RssSourceEditInteractor.h
//  RSSViewer
//
//  Created by Denis Skripnichenko on 24.12.2018.
//  Copyright © 2018 Denis Skripnichenko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RssSourceEditProtocols.h"

NS_ASSUME_NONNULL_BEGIN

@interface RssSourceEditInteractor : NSObject<RssSourceEditInteractorInputProtocol>

@property (nonatomic, weak, nullable) id<RssSourceEditInteractorOutputProtocol> presenter;

@end

NS_ASSUME_NONNULL_END
