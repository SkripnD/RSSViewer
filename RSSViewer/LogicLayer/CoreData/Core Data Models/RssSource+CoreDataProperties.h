//
//  RssSource+CoreDataProperties.h
//  
//
//  Created by Denis Skripnichenko on 21.12.2018.
//
//

#import "RssSource+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface RssSource (CoreDataProperties)

+ (NSFetchRequest<RssSource *> *)fetchRequest;

@property (nonnull, nonatomic, copy) NSDate *dateCreated;
@property (nullable, nonatomic, copy) NSDate *dateSynced;
@property (nonnull, nonatomic, copy) NSString *name;
@property (nonnull, nonatomic, copy) NSString *url;
@property (nonnull, nonatomic, copy) NSString *hashId;

@end

NS_ASSUME_NONNULL_END
