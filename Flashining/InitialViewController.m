//
//  InitialViewController.m
//  Flashining
//
//  Created by Jeehyung Lee on 6/8/13.
//  Copyright (c) 2013 Jeehyung Lee. All rights reserved.
//

#import "InitialViewController.h"
#import <CoreData/CoreData.h>
#import "FlashcardModel.h"
#import "Card.h"
#import "Deck.h"
#import "AppDelegate.h"
#import "DeckViewController.h"

@interface InitialViewController ()
@property (nonatomic, strong) NSArray *fromCoreData;
@end

@implementation InitialViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    [self insertTestCard];
    _fromCoreData = [self fetchCards];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)insertTestCard {
    NSManagedObjectContext *context = [[FlashcardModel sharedDataModel] mainContext];
    
    Card *c = [Card insertInManagedObjectContext:context];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setTimeStyle:NSDateFormatterLongStyle];
    c.fact = [formatter stringFromDate:[NSDate date]];
    c.definition = @"Current date and time";
    
    NSString *deckname = @"Timestamps";
    Deck *deck = [Deck newOrExisitingDeck:deckname];
    // fetch a deck by deckname
    if (deck) {
        // fetch deck managed object and set card as part of the deck
        NSMutableOrderedSet *changeThisDeck = [deck cardsSet];
        [changeThisDeck addObject:c];
    } else {
        // create new deck
        deck.name = deckname;
        c.deck = deck;
    }
    
    NSError *err = nil;
    [context save:&err];
    if (err) {
        NSLog(@"Error here: %@", err);
    }
}

- (NSArray *)fetchCards {
    NSManagedObjectContext *context = [[FlashcardModel sharedDataModel] mainContext];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [Card entityInManagedObjectContext:context];
    [fetchRequest setEntity:entity];
    
    NSError *err;
    NSArray *fetchedObjects = [context executeFetchRequest:fetchRequest error:&err];
    if (fetchRequest == nil) {
        NSLog(@"There is nothing to retrieve");
    }
    return fetchedObjects;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    NSManagedObjectContext *context = [[FlashcardModel sharedDataModel] mainContext];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:[Deck entityName] inManagedObjectContext:context];
    [fetchRequest setEntity:entity];
    NSError *error;
    NSArray *fetchedObjects = [context executeFetchRequest:fetchRequest error:&error];
    
    return fetchedObjects.count; // number of section = number of decks
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    NSManagedObjectContext *context = [[FlashcardModel sharedDataModel] mainContext];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:[Deck entityName] inManagedObjectContext:context];
    [fetchRequest setEntity:entity];
    NSError *error;
    NSArray *fetchedObjects = [context executeFetchRequest:fetchRequest error:&error];
    
    return _fromCoreData.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"DeckCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}

#pragma mark - Transitions
//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//    if ([[segue identifier] isEqualToString:@"Knowledge"]) {
//        UINavigationController *knowledgeVC = (UINavigationController *)[segue destinationViewController];
//        DeckViewController *deckVC = (DeckViewController *)[knowledgeVC topViewController];
////        deckVC.delegate = self;
////        DeckViewController *rootVC = (DeckViewController *)[knowledgeVC topViewController];
////        DeckViewController *deckVC = [self.storyboard instantiateViewControllerWithIdentifier:@"deckVC"];
////        knowledgeVC topViewController
//    }
//}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     DetailViewController *detailViewController = [[DetailViewController alloc] initWithNibName:@"nibname" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
//    [self performSegueWithIdentifier:@"knowledge" sender:self];
}

@end
