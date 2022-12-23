# tsx-yarn-pnp-demo

This is a demo project showcasing [tsx](https://github.com/esbuild-kit/tsx) and [Yarn PnP](https://yarnpkg.com/features/pnp) together, which was (to my knowledge), impossible [until recently](https://github.com/nodejs/node/pull/43772).

## How to run

NOTE: at the time of writing,
[nodejs/node@12f6da7](https://github.com/nodejs/node/commit/12f6da731c385177abfad2bc2a17579956b2d35a)
isn't available in any stable release build.
There are nightly builds containing this patch, but unfortunately
[ESBuild doesn't let you use unknown Node versions](https://github.com/evanw/esbuild/issues/2766).

In order to test this feature, I have manually merged the necessary patches
in my own fork of [nodejs/node](https://github.com/notpeelz/node/tree/v19-loader-chaining), included as a submodule of this repo.

1. Clone this repo **with submodules**:

```
git clone --recurse-submodules https://github.com/notpeelz/tsx-yarn-pnp-demo
```

2. `cd node` and build Node using [these instructions](https://github.com/notpeelz/node/blob/v19-loader-chaining/BUILDING.md#building-nodejs-on-supported-platforms)

3. Run tsx using this script: `./scripts/with_patched_node.sh`
   If you wish to test using your current install of node: `./scripts/with_system_node.sh`.
   For manually invoking tsx via `node`, a workaround is needed (see `with_manual_node_invocation.sh`)
