// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Card.m instead.

#import "_Card.h"

const struct CardAttributes CardAttributes = {
	.definition = @"definition",
	.fact = @"fact",
	.visual = @"visual",
};

const struct CardRelationships CardRelationships = {
	.deck = @"deck",
};

const struct CardFetchedProperties CardFetchedProperties = {
};

@implementation CardID
@end

@implementation _Card

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Card" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Card";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Card" inManagedObjectContext:moc_];
}

- (CardID*)objectID {
	return (CardID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	

	return keyPaths;
}




@dynamic definition;






@dynamic fact;






@dynamic visual;






@dynamic deck;

	






@end
