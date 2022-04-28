//
//  NSURLProtocol+WebKitSupport.h
//  Pro_NSURLProtocol
//
//  Created by 申政 on 2022/4/29.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSURLProtocol (WebKitSupport)

+ (void)wk_registerScheme:(NSString*)scheme;

+ (void)wk_unregisterScheme:(NSString*)scheme;

@end

NS_ASSUME_NONNULL_END
