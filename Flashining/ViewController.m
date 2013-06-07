//
//  ViewController.m
//  Flashining
//
//  Created by Jeehyung Lee on 6/5/13.
//  Copyright (c) 2013 Jeehyung Lee. All rights reserved.
//

#import "ViewController.h"
#import <EvernoteSession.h>
#import <EvernoteUserStore.h>
#import <EvernoteNoteStore.h>
#import "AppDelegate.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)testEvernoteAuth:(id)sender
{
    EvernoteSession *session = [EvernoteSession sharedSession];
    NSLog(@"Session host: %@", [session host]);
    NSLog(@"Session key: %@", [session consumerKey]);
    NSLog(@"Session secret: %@", [session consumerSecret]);
    
    [session authenticateWithViewController:self completionHandler:^(NSError *error) {
        if (error || !session.isAuthenticated){
            if (error) {
                NSLog(@"Error authenticating with Evernote Cloud API: %@", error);
            }
            if (!session.isAuthenticated) {
                NSLog(@"Session not authenticated");
            }
        } else {
            // We're authenticated!
            EvernoteUserStore *userStore = [EvernoteUserStore userStore];
            [userStore getUserWithSuccess:^(EDAMUser *user) {
                // success
                NSLog(@"Authenticated as %@", [user username]);
            } failure:^(NSError *error) {
                // failure
                NSLog(@"Error getting user: %@", error);
            } ];
        }
    }];
}

- (IBAction)testMakingNote:(id)sender {
    [self makeNoteWithTitle:@"My test note" withBody:@"This is only a test" withParentBotebook:nil];
}

- (void) makeNoteWithTitle:(NSString*)noteTile withBody:(NSString*) noteBody withParentBotebook:(EDAMNotebook*)parentNotebook {
    NSString *noteContent = [NSString stringWithFormat:@"<?xml version=\"1.0\" encoding=\"UTF-8\"?>"
                             "<!DOCTYPE en-note SYSTEM \"http://xml.evernote.com/pub/enml2.dtd\">"
                             "<en-note>"
                             "%@"
                             "</en-note>",noteBody];
    
    // Parent notebook is optional; if omitted, default notebook is used
    NSString* parentNotebookGUID;
    if(parentNotebook) {
        parentNotebookGUID = parentNotebook.guid;
    }
    
    // Create note object
    EDAMNote *ourNote = [[EDAMNote alloc] initWithGuid:nil title:noteTile content:noteContent contentHash:nil contentLength:noteContent.length created:0 updated:0 deleted:0 active:YES updateSequenceNum:0 notebookGuid:parentNotebookGUID tagGuids:nil resources:nil attributes:nil tagNames:nil];
    
    // Attempt to create note in Evernote account
    [[EvernoteNoteStore noteStore] createNote:ourNote success:^(EDAMNote *note) {
        // Log the created note object
        NSLog(@"Note created : %@",note);
    } failure:^(NSError *error) {
        // Something was wrong with the note data
        // See EDAMErrorCode enumeration for error code explanation
        // http://dev.evernote.com/documentation/reference/Errors.html#Enum_EDAMErrorCode
        NSLog(@"Error : %@",error);
    }];
}

#pragma mark - Housekeeping
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
