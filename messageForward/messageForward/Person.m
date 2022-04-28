//
//  Person.m
//  messageForward
//
//  Created by 申政 on 2022/4/27.
//

#import "Person.h"
#import "Helper.h"

@interface Person ()

@property (strong) Helper *helper;

@end

@implementation Person

- (id)init {
    if (self = [super init]) {
        self.helper = [[Helper alloc] init];
    }
    return self;
}

+ (BOOL)resolveInstanceMethod:(SEL)sel {
    return YES;
}

- (id)forwardingTargetForSelector:(SEL)aSelector {
    if ([self.helper respondsToSelector:aSelector]) {
        return self.helper;
    }
    return nil;
}
@end
