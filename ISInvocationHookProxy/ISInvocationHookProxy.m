#import "ISInvocationHookProxy.h"

@implementation ISInvocationHookProxy

- (instancetype)initWithTarget:(id)target
{
    _target = target;
    return target ? self : nil;
}

- (BOOL)respondsToSelector:(SEL)selector
{
    return [super respondsToSelector:selector] || [self.target respondsToSelector:selector];
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)selector
{
    return [self.target methodSignatureForSelector:selector];
}

- (void)forwardInvocation:(NSInvocation *)invocation
{
    [invocation invokeWithTarget:self.target];

    if (self.hookBlock) {
        self.hookBlock(invocation);
    }
}

@end