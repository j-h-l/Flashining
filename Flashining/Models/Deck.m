#import "Deck.h"
#import "FlashcardModel.h"
#import "Card.h"


@interface Deck ()

@end


@implementation Deck


+ (Deck *)newOrExisitingDeck:(NSString *)deckName {
    // fetch with string and return whether it is in storage or not
    NSManagedObjectContext *context = [[FlashcardModel sharedDataModel] mainContext];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:[Deck entityName] inManagedObjectContext:context];
    [fetchRequest setEntity:entity];
    [fetchRequest setPredicate:[NSPredicate predicateWithFormat:@"name == %@", deckName]];
    NSError *err = nil;
    NSArray *fetchedDecks = [context executeFetchRequest:fetchRequest error:&err];
    
    NSLog(@"%@", fetchedDecks);
    NSLog(@"fetchedDecks count: %lu", (unsigned long)[fetchedDecks count]);
    
    if (fetchedDecks.count == 0) {
        NSLog(@"I'm in here");
        Deck *returnDeck = [Deck insertInManagedObjectContext:context];
        returnDeck.name = deckName;
        return returnDeck;
    } else {
        return fetchedDecks[0];
    }
}

@end
