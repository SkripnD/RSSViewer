//
//  RssItem+CoreDataProperties.h
//  
//
//  Created by Denis Skripnichenko on 24.12.2018.
//
//

#import "RssItem+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface RssItem (CoreDataProperties)

@property (nullable, nonatomic, copy) NSDate *dateCreated;
@property (nullable, nonatomic, copy) NSString *descriptionText;
@property (nullable, nonatomic, copy) NSString *guid;
@property (nullable, nonatomic, copy) NSString *link;
@property (nullable, nonatomic, copy) NSString *rssUrl;
@property (nullable, nonatomic, copy) NSString *title;

@end

NS_ASSUME_NONNULL_END
