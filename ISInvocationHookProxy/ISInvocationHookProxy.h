#import <UIKit/UIKit.h>

FOUNDATION_EXPORT double ISInvocationHookProxyVersionNumber;
FOUNDATION_EXPORT const unsigned char ISInvocationHookProxyVersionString[];

@interface ISInvocationHookProxy : NSProxy

@property (nonatomic, readonly) id target;
@property (nonatomic, copy) void (^hookBlock)(NSInvocation *);

- (instancetype)initWithTarget:(id)target;

@end

