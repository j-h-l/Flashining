// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Deck.h instead.

#import <CoreData/CoreData.h>


extern const struct DeckAttributes {
	__unsafe_unretained NSString *name;
	__unsafe_unretained NSString *subject;
} DeckAttributes;

extern const struct DeckRelationships {
	__unsafe_unretained NSString *cards;
} DeckRelationships;

extern const struct DeckFetchedProperties {
} DeckFetchedProperties;

@class Card;




@interface DeckID : NSManagedObjectID {}
@end

@interface _Deck : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (DeckID*)objectID;





@property (nonatomic, strong) NSString* name;



//- (BOOL)validateName:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* subject;



//- (BOOL)validateSubject:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSOrderedSet *cards;

- (NSMutableOrderedSet*)cardsSet;





@end

@interface _Deck (CoreDataGeneratedAccessors)

- (void)addCards:(NSOrderedSet*)value_;
- (void)removeCards:(NSOrderedSet*)value_;
- (void)addCardsObject:(Card*)value_;
- (void)removeCardsObject:(Card*)value_;

@end

@interface _Deck (CoreDataGeneratedPrimitiveAccessors)


- (NSString*)primitiveName;
- (void)setPrimitiveName:(NSString*)value;




- (NSString*)primitiveSubject;
- (void)setPrimitiveSubject:(NSString*)value;





- (NSMutableOrderedSet*)primitiveCards;
- (void)setPrimitiveCards:(NSMutableOrderedSet*)value;


@end
