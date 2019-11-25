# Challenge 1

## Problem description

Help! My application broke after I upgraded it to the `preview016` release. I didn't touch anything in my project, just upgraded and now I can't run `prisma2 dev` any more, it always gives me this error:

```
$ npx prisma2 dev
Error in migration engine: [2019-11-25T10:23:33Z INFO  quaint::pool] Starting a PostgreSQL pool with 9 connections.
thread 'tokio-runtime-worker-0' panicked at 'Error parsing the migration steps: Error("unknown field `name`, expected `model`", line: 1, column: 59)', src/libcore/result.rs:1165:5
stack backtrace:
   0: <std::sys_common::backtrace::_print::DisplayBacktrace as core::fmt::Display>::fmt
   1: core::fmt::write
   2: std::io::Write::write_fmt
   3: std::panicking::default_hook::{{closure}}
   4: std::panicking::default_hook
```

How can I fix this problem?