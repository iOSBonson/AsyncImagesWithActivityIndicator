//
//  AsyncImageButton.h
//  AsynchronousImageView
//
//  Created by Bonson on 19.06.12.
//  Copyright (c) 2012 frozen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AsynchronousImage.h"

@interface AsyncImageButton : UIButton<AsynchronousImageDelegate>{
    UIActivityIndicatorView *activityIndicator;
    id delegate;
    SEL selector;
}

@property(nonatomic ,strong)id delegate;

-(id)initWithFrame:(CGRect)frame;
-(void)setBackGroundImage:(NSString *)urlString forControlState:(UIControlState)controlState;

@end
