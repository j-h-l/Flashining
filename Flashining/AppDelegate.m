//
//  AppDelegate.m
//  Flashining
//
//  Created by Jeehyung Lee on 6/5/13.
//  Copyright (c) 2013 Jeehyung Lee. All rights reserved.
//

#import "AppDelegate.h"
#import "FlashcardModel.h"
#import <EvernoteSession.h>
#import <ENConstants.h>
#import "APIKEYS.h" // apikeys stored here
#import <PonyDebugger.h>

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    NSManagedObjectContext *context = [[FlashcardModel sharedDataModel] mainContext];
    if (context) {
        NSLog(@"Context successfully created and available");
    } else {
        NSLog(@"Could not create context");
    }
    
    NSString *EVERNOTE_HOST = BootstrapServerBaseURLStringSandbox; // sandbox.evernote.com - use during development
    NSString *CONSUMER_KEY = [NSString stringWithUTF8String:EN_CONSUMER_KEY];
    NSString *CONSUMER_SECRET = [NSString stringWithUTF8String:EN_CONSUMER_SECRET];
    [EvernoteSession setSharedSessionHost:EVERNOTE_HOST
                              consumerKey:CONSUMER_KEY
                           consumerSecret:CONSUMER_SECRET];
    
    PDDebugger *debugger = [PDDebugger defaultInstance];
//    [debugger autoConnect];
    [debugger connectToURL:[NSURL URLWithString:@"ws://localhost:9000/device"]];
    [debugger enableCoreDataDebugging];
    [debugger addManagedObjectContext:context withName:@"Flashcards MOC"];
    
    return YES;
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
    BOOL canHandle = NO;
    if ([[NSString stringWithFormat:@"en-%@", [[EvernoteSession sharedSession] consumerKey]] isEqualToString:[url scheme]] == YES) {
        canHandle = [[EvernoteSession sharedSession] canHandleOpenURL:url];
    }
    return canHandle;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    [[EvernoteSession sharedSession] handleDidBecomeActive];
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
