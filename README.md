ISInvocationHookProxy [![Build Status](https://travis-ci.org/ishkawa/ISInvocationHookProxy.png)](https://travis-ci.org/ishkawa/ISInvocationHookProxy) [![Coverage Status](https://coveralls.io/repos/ishkawa/ISInvocationHookProxy/badge.png?branch=master)](https://coveralls.io/r/ishkawa/ISInvocationHookProxy?branch=master)
=====================

A proxy object that hooks each NSInvocation of target.

## Usage

```objc
NSString *object = [[NSString alloc] init];
ISInvocationHookProxy *proxy = [[ISInvocationHookProxy alloc] initWithTarget:object];
proxy.hookBlock = ^(NSInvocation *invocation) {
    // will be called when [(NSString *)proxy length]; is executed
};

[(NSString *)proxy length];
```

### Overwriting return value of invocation

```objc
NSString *object = @"foo";
ISInvocationHookProxy *proxy = [[ISInvocationHookProxy alloc] initWithTarget:object];
[(NSString *)proxy length]; // 3

proxy.hookBlock = ^(NSInvocation *invocation) {
    if (invocation.selector == @selector(length)) {
        NSInteger length = 10;
        [invocation setReturnValue:&length];
    }
};

[(NSString *)proxy length]; // 10
```

## License

Copyright (c) 2013-2014 Yosuke Ishikawa

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
