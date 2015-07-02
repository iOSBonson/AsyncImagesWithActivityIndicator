//
//  RootViewController.m
//  AsynchronousImageView
//
//  Created by Bonson on 25.05.12.
//  Copyright (c) 2012 frozen. All rights reserved.
//

#import "RootViewController.h"
#import "AsynchronousImage.h"
#import "AsyncImageButton.h"

#define kNumberOfColumns 3

@implementation RootViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(id)init{
    return [self initWithNibName:Nil bundle:nil];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

-(void)callMethod:(id)sender{
    NSLog(@"Call method");
    UIButton *button=(UIButton *)sender;
    NSLog(@"%d",button.tag);
}

- (void)viewDidLoad
{
    // dummy url
    NSString *url=@"http://hughash.files.wordpress.com/2012/05/iphone-3gs1.jpg";
    
    int xPos =0,yPos = 0;
    float width = (self.view.frame.size.width/3);
    float height = (self.view.frame.size.height/3);
    int counter = 0;
    for (int i = 0 ; i < kNumberOfColumns ; i ++) {
        for (int j = 0 ; j < kNumberOfColumns ; j++) {
            CGRect frame = CGRectMake(xPos, yPos, width ,height);
            
            AsyncImageButton *button=[[AsyncImageButton alloc]initWithFrame:frame];
            [button setDelegate:(id)self]; //crashes on click if not set
            [button setTag:counter];
            [button setBackGroundImage:url forControlState:UIControlStateNormal];
            [button setBackgroundColor:[UIColor blueColor]];
            
            
            [button addTarget:self action:@selector(callMethod:) forControlEvents:UIControlEventTouchUpInside];
            //AsynchronousImage *img=[[AsynchronousImage alloc]initWithUrlString:url andFrame:frame];
            // [self.view addSubview:img];
            [self.view addSubview:button];
            xPos = xPos + width;
            counter ++;
        }
        xPos = 0;
        yPos = yPos + height;
    }
    [super viewDidLoad];
    
    // Do any additional setup after loading the view from its nib.
}




- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return YES;
}

@end
