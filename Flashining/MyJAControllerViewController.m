//
//  MyJAControllerViewController.m
//  Flashining
//
//  Created by Jeehyung Lee on 6/7/13.
//  Copyright (c) 2013 Jeehyung Lee. All rights reserved.
//

#import "MyJAControllerViewController.h"
#import <UIViewController+JASidePanel.h>

@interface MyJAControllerViewController ()

@end

@implementation MyJAControllerViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)awakeFromNib {
    [self setLeftPanel:[self.storyboard instantiateViewControllerWithIdentifier:@"leftViewController"]];
    [self setCenterPanel:[self.storyboard instantiateViewControllerWithIdentifier:@"centerViewController"]];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
