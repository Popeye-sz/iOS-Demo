//
//  CustomURLProtocol.m
//  Pro_NSURLProtocol
//
//  Created by 申政 on 2022/4/28.
//

#import "CustomURLProtocol.h"

@implementation CustomURLProtocol

+ (BOOL)canInitWithRequest:(NSURLRequest *)request {
    if ([request.URL.scheme caseInsensitiveCompare:@"myapp"] == NSOrderedSame) {
        return YES;
    }
    return NO;
}

+ (NSURLRequest *)canonicalRequestForRequest:(NSURLRequest *)request {
    return request;
}

- (void)startLoading {
    NSLog(@"URL is %@", self.request.URL);
    NSString *imagePath = [[NSBundle mainBundle] pathForResource:@"image1" ofType:@"jpg"];
    NSData *data = [NSData dataWithContentsOfFile:imagePath];
    NSURLResponse *response = [[NSURLResponse alloc] initWithURL:self.request.URL
                                                        MIMEType:@"image/jpg"
                                           expectedContentLength:-1
                                                textEncodingName:nil];
    [self.client URLProtocol:self didReceiveResponse:response cacheStoragePolicy:NSURLCacheStorageAllowed];
    [self.client URLProtocol:self didLoadData:data];
    [self.client URLProtocolDidFinishLoading:self];
}

- (void)stopLoading {
    NSLog(@"stopLoading");
}
@end
