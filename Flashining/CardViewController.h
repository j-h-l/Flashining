//
//  CardViewController.h
//  Flashining
//
//  Created by Jeehyung Lee on 6/11/13.
//  Copyright (c) 2013 Jeehyung Lee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "Card.h"
#import "InitialViewController.h"
#import "DeckViewController.h"

@interface CardViewController : UIViewController

@property (nonatomic, strong) NSManagedObjectContext *editContext;

@property (weak) IBOutlet UITextField *fact;
@property (weak) IBOutlet UITextField *definition;

- (IBAction)addCard:(id)sender;
- (IBAction)backToDeckVC:(id)sender;
- (IBAction)allDone:(id)sender;
@end