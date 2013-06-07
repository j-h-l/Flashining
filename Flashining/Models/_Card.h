// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Card.h instead.

#import <CoreData/CoreData.h>


extern const struct CardAttributes {
	__unsafe_unretained NSString *definition;
	__unsafe_unretained NSString *fact;
	__unsafe_unretained NSString *visual;
} CardAttributes;

extern const struct CardRelationships {
	__unsafe_unretained NSString *deck;
} CardRelationships;

extern const struct CardFetchedProperties {
} CardFetchedProperties;

@class Deck;





@interface CardID : NSManagedObjectID {}
@end

@interface _Card : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (CardID*)objectID;





@property (nonatomic, strong) NSString* definition;



//- (BOOL)validateDefinition:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* fact;



//- (BOOL)validateFact:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* visual;



//- (BOOL)validateVisual:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) Deck *deck;

//- (BOOL)validateDeck:(id*)value_ error:(NSError**)error_;





@end

@interface _Card (CoreDataGeneratedAccessors)

@end

@interface _Card (CoreDataGeneratedPrimitiveAccessors)


- (NSString*)primitiveDefinition;
- (void)setPrimitiveDefinition:(NSString*)value;




- (NSString*)primitiveFact;
- (void)setPrimitiveFact:(NSString*)value;




- (NSString*)primitiveVisual;
- (void)setPrimitiveVisual:(NSString*)value;





- (Deck*)primitiveDeck;
- (void)setPrimitiveDeck:(Deck*)value;


@end
