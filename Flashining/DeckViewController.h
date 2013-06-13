//
//  DeckViewController.h
//  Flashining
//
//  Created by Jeehyung Lee on 6/11/13.
//  Copyright (c) 2013 Jeehyung Lee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "Deck.h"
#import "InitialViewController.h"

@interface DeckViewController : UIViewController

@property (nonatomic, strong) NSManagedObjectContext *editContext;
@property (weak) IBOutlet UITextField *deckname;
@property (weak) IBOutlet UITextField *subject;

- (IBAction)addDeck:(id)sender;
- (IBAction)cancel:(id)sender;
@end
