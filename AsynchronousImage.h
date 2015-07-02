//
//  AsynchronousImage.h
//  AsynchronousImageView
//
//  Created by Bonson on 25.05.12.
//  Copyright (c) 2012 frozen. All rights reserved.
//

#import <Foundation/Foundation.h>
@protocol AsynchronousImageDelegate;

@interface AsynchronousImage : UIImageView {
    UIActivityIndicatorView *activityIndicatorView;
    NSMutableData *data;
    NSURLConnection* connection; 
    id <AsynchronousImageDelegate> delegate;
}

@property(nonatomic,retain) id<AsynchronousImageDelegate>delegate;
/*!
 *  @brief  Instance type initializer
 *  @param urlString <#urlString description#>
 *  @param frame     <#frame description#>
 *  @return <#return value description#>
 */
-(id)initWithUrlString:(NSString *)urlString andFrame:(CGRect)frame;
@end


/*!
 *  @brief  This protocol will inform the button class when 
            the button imaage is finished downloading
 */
@protocol AsynchronousImageDelegate<NSObject>
-(void)imageDidFinishLoading:(AsynchronousImage *)aImage;
-(void)imageDidFailLoading:(AsynchronousImage *)aImage;

@end
