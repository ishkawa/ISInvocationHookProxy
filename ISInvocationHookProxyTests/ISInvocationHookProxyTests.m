#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "ISInvocationHookProxy.h"

@interface ISInvocationHookProxyTests : XCTestCase

@end

@implementation ISInvocationHookProxyTests

- (void)testInitWithNilTarget
{
    ISInvocationHookProxy *proxy = [[ISInvocationHookProxy alloc] initWithTarget:nil];
    XCTAssertNil(proxy);
}

- (void)testHookInvocation
{
    __block NSInvocation *hookedInvocation;

    NSString *object = [[NSString alloc] init];
    ISInvocationHookProxy *proxy = [[ISInvocationHookProxy alloc] initWithTarget:object];
    proxy.hookBlock = ^(NSInvocation *invocation) {
        hookedInvocation = invocation;
    };

    [(NSString *)proxy length];

    XCTAssertEqual(hookedInvocation.selector, @selector(length));
}

@end
