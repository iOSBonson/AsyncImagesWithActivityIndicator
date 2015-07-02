//
//  AsynchronousImage.m
//  AsynchronousImageView
//  Created by Bonson on 25.05.12.
//  Copyright (c) 2012 frozen. All rights reserved.
//

#import "AsynchronousImage.h"

@implementation AsynchronousImage

@synthesize delegate;


-(void)loadImageFromUrl:(NSURL *)url{
   
    self.image=nil;
    NSURLRequest* request = [NSURLRequest requestWithURL:url];
	connection = [[NSURLConnection alloc] initWithRequest:request delegate:self startImmediately:YES];
    
}

- (void)connection:(NSURLConnection *)theConnection didReceiveData:(NSData *)incrementalData {
	if (data ==  nil) { 
        data =[[NSMutableData alloc]init];
    }
    
	[data appendData:incrementalData];
}

- (void)connectionDidFinishLoading:(NSURLConnection*)theConnection {
	self.image = [UIImage imageWithData:data];
     [activityIndicatorView stopAnimating];
    
    if ([delegate conformsToProtocol:@protocol(AsynchronousImageDelegate)]) {
        NSLog(@"confirms");
        [delegate imageDidFinishLoading:self];
    }
    
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
     [activityIndicatorView stopAnimating];
    
    if ([delegate conformsToProtocol:@protocol(AsynchronousImageDelegate)]) {
        [delegate imageDidFailLoading:self];
    }
}


-(id)initWithUrlString:(NSString *)urlString andFrame:(CGRect)frame{
    if (self == [super init]) {
        [self setFrame:frame];
        activityIndicatorView=[[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
        [activityIndicatorView setFrame:CGRectMake(self.frame.size.width/2,self.frame.size.height/2 ,self.frame.size.width/5,self.frame.size.height/5)];
        [activityIndicatorView  setCenter:CGPointMake(self.frame.size.width / 2, self.frame.size.height / 2)];
        [self addSubview:activityIndicatorView];
        [activityIndicatorView startAnimating];
        
        [self loadImageFromUrl:[NSURL URLWithString:urlString]];
                
    }
    
    return self;
}



@end
