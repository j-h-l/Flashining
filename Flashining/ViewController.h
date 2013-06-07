//
//  ViewController.h
//  Flashining
//
//  Created by Jeehyung Lee on 6/5/13.
//  Copyright (c) 2013 Jeehyung Lee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (nonatomic, strong) IBOutlet UIButton *testButton;
@property (nonatomic, strong) IBOutlet UIButton *makeNotetest;
- (IBAction)testEvernoteAuth:(id)sender;
- (IBAction)testMakingNote:(id)sender;
    

@end
