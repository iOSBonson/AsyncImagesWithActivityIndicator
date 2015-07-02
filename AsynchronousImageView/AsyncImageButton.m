//
//  AsyncImageButton.m
//  AsynchronousImageView
//
//  Created by Bonson on 19.06.12.
//  Copyright (c) 2012 frozen. All rights reserved.
//
#import "AsyncImageButton.h"
#import "AsynchronousImage.h"

@implementation AsyncImageButton
@synthesize delegate;

-(id)initWithFrame:(CGRect)frame{
    if (self == [super initWithFrame:frame]) {
        [self setFrame:frame];
     }
    return self;
 }


-(void)setBackGroundImage:(NSString *)urlString forControlState:(UIControlState)controlState{
    CGRect imgFrame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    AsynchronousImage *image=[[AsynchronousImage alloc]initWithUrlString:urlString andFrame:imgFrame];
    activityIndicator=[[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    //setting activity indicators
    [activityIndicator setFrame:CGRectMake(imgFrame.size.width/2,imgFrame.size.height/2 ,imgFrame.size.width/5,imgFrame.size.height/5)];
    [activityIndicator  setCenter:image.center];
    [self addSubview:activityIndicator];
    [activityIndicator startAnimating];
    
    [image setDelegate:self];
}

//-(void)addTarget:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents{
//    [self setDelegate:target];
//    selector = action;
//    
//}

-(void)imageDidFailLoading:(AsynchronousImage *)aImage  {
    [activityIndicator stopAnimating];
   // can add no images for a meaningful display
}

-(void)imageDidFinishLoading:(AsynchronousImage *)aImage{
    
    [activityIndicator stopAnimating];
    [self setBackgroundImage:aImage.image forState:UIControlStateNormal];
    
}


@end
