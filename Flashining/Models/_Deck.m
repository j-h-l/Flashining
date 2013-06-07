// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Deck.m instead.

#import "_Deck.h"

const struct DeckAttributes DeckAttributes = {
	.name = @"name",
	.subject = @"subject",
};

const struct DeckRelationships DeckRelationships = {
	.cards = @"cards",
};

const struct DeckFetchedProperties DeckFetchedProperties = {
};

@implementation DeckID
@end

@implementation _Deck

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Deck" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Deck";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Deck" inManagedObjectContext:moc_];
}

- (DeckID*)objectID {
	return (DeckID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	

	return keyPaths;
}




@dynamic name;






@dynamic subject;






@dynamic cards;

	
- (NSMutableOrderedSet*)cardsSet {
	[self willAccessValueForKey:@"cards"];
  
	NSMutableOrderedSet *result = (NSMutableOrderedSet*)[self mutableOrderedSetValueForKey:@"cards"];
  
	[self didAccessValueForKey:@"cards"];
	return result;
}
	






@end
