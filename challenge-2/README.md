# Challenge 2

## Problem description

The error occured after I upgraded my `prisma2` development dependency to version `preview017`. Whenever I'm trying to start my app, I'm getting this error:

```
$ yarn dev
yarn run v1.19.1
$ ts-node src/index.ts

/Users/nikolasburk/Desktop/css-hiring-challenge/challenge-2/node_modules/ts-node/src/index.ts:293
    return new TSError(diagnosticText, diagnosticCodes)
           ^
TSError: ⨯ Unable to compile TypeScript:
src/index.ts:1:24 - error TS2307: Cannot find module '@generated/photon'.

1 import { Photon } from '@generated/photon'
                         ~~~~~~~~~~~~~~~~~~~

    at createTSError (/Users/nikolasburk/Desktop/css-hiring-challenge/challenge-2/node_modules/ts-node/src/index.ts:293:12)
    at reportTSError (/Users/nikolasburk/Desktop/css-hiring-challenge/challenge-2/node_modules/ts-node/src/index.ts:297:19)
    at getOutput (/Users/nikolasburk/Desktop/css-hiring-challenge/challenge-2/node_modules/ts-node/src/index.ts:399:34)
    at Object.compile (/Users/nikolasburk/Desktop/css-hiring-challenge/challenge-2/node_modules/ts-node/src/index.ts:457:32)
    at Module.m._compile (/Users/nikolasburk/Desktop/css-hiring-challenge/challenge-2/node_modules/ts-node/src/index.ts:530:43)
    at Module._extensions..js (internal/modules/cjs/loader.js:770:10)
    at Object.require.extensions.<computed> [as .ts] (/Users/nikolasburk/Desktop/css-hiring-challenge/challenge-2/node_modules/ts-node/src/index.ts:533:12)
    at Module.load (internal/modules/cjs/loader.js:628:32)
    at Function.Module._load (internal/modules/cjs/loader.js:555:12)
    at Function.Module.runMain (internal/modules/cjs/loader.js:822:10)
error Command failed with exit code 1.
```

Help please!!!