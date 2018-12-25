//
//  RssItemModel.h
//  RSSViewer
//
//  Created by Denis Skripnichenko on 24.12.2018.
//  Copyright © 2018 Denis Skripnichenko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PlainModelMappable.h"

NS_ASSUME_NONNULL_BEGIN

@interface RssItemModel : NSObject<PlainModelMappable>
@property (nonatomic, strong) NSString * guid;
@property (nonatomic, strong) NSString * link;
@property (nonatomic, strong) NSString * title;
@property (nonatomic, strong) NSString * descriptionText;
@property (nonatomic, strong) NSString * rssUrl;
@property (nonatomic, strong) NSDate * dateCreated;
@property (nonatomic) BOOL isRead;

@end

NS_ASSUME_NONNULL_END
