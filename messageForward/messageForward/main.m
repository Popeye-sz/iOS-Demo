//
//  main.m
//  messageForward
//
//  Created by 申政 on 2022/4/27.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Person+Helper.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Person *p = [[Person alloc] init];
        [p test];
    }
    return 0;
}
