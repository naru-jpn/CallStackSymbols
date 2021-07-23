<p align='center'><b>CallStackSymbols</b></p>
<p align='center'>Formatted call stack symbols for iOS.</p>

## Installation

Supports Swift Package Manager.

## Usage

```swift
// Get call stack symbol as DLADDR array.
let symbols = CallStackSymbols.current()
```

### What is DLADDR?

`DLADDR` is struct defined <a href="./Sources/CallStackSymbols/DLADDR.swift">here</a>.

This library internally call `Thread.callStackSymbols`. <a href="https://developer.apple.com/documentation/foundation/thread/1414836-callstacksymbols">Documentation</a> says _Each element is an NSString object with a value in a format determined by the backtrace_symbols() function_.

Information about `backtrace_symbols()` can be seen by `$ man backtrace_symbols` and manual says _backtrace_symbols() attempts to transform a call stack obtained by backtrace() into an array of human-readable strings using dladdr()_.

Detail of `dladdr()` can be seen by `$ man dladdr`. The information treated by `dladdr()` contains 2 set of name and address. The values returned value by `Thread.callStackSymbols` cannot read as-is because raw value is array of string. So I defined struct `DLADDR` and parse raw string into that formatted structure.

## License

[MIT](https://choosealicense.com/licenses/mit/)
