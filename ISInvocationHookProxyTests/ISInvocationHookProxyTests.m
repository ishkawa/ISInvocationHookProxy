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

    NSString *object = @"foo";
    ISInvocationHookProxy *proxy = [[ISInvocationHookProxy alloc] initWithTarget:object];
    proxy.hookBlock = ^(NSInvocation *invocation) {
        hookedInvocation = invocation;
    };

    [(NSString *)proxy length];

    XCTAssertEqual(hookedInvocation.selector, @selector(length));
}

- (void)testOverwriteReturnValue
{
    __block NSInteger length = 10;
    NSString *object = @"foo";
    ISInvocationHookProxy *proxy = [[ISInvocationHookProxy alloc] initWithTarget:object];
    proxy.hookBlock = ^(NSInvocation *invocation) {
        [invocation setReturnValue:&length];
    };

    XCTAssertEqual([(NSString *)proxy length], length);
}

- (void)testRespondsToSelector
{
    NSString *object = @"foo";
    ISInvocationHookProxy *proxy = [[ISInvocationHookProxy alloc] initWithTarget:object];
    XCTAssertTrue([proxy respondsToSelector:@selector(length)]);
}

@end
