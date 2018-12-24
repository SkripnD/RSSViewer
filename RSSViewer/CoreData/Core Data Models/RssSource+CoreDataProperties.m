//
//  RssSource+CoreDataProperties.m
//  
//
//  Created by Denis Skripnichenko on 21.12.2018.
//
//

#import "RssSource+CoreDataProperties.h"

@implementation RssSource (CoreDataProperties)

+ (NSFetchRequest<RssSource *> *)fetchRequest {
	return [NSFetchRequest fetchRequestWithEntityName:@"RssSource"];
}

@dynamic dateCreated;
@dynamic dateSynced;
@dynamic name;
@dynamic url;
@dynamic identifier;

@end
