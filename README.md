# touch-grass
grass


I need to touch grass. I can't do that yet because the feature isn't implemented. I can look at it though :)

You can look at grass too: https://grass.cynamondev.com/  (use W/S or arrow keys to distance the camera)


It's a 3d engine build on wgpu mostly following [learn wgpu guide](https://sotrh.github.io/learn-wgpu/).
I wouldn't call it a full engine nor a finished project, because it doesn't realise every feature i'd like for it to.

At the time of starting making this i didn't know rust at all, but now i kinda do. Maybe it was too much for a first project, who knows.

Some if the files are not used in the build, because i will use them to finish the engine in future and they just are.

Overall we have some rotating grass going on and that's it. ![grass](image.png)

## Building
This generally should compile both normally and for wasm, but i only tested compiling it for web.
Youll also need `rustc 1.95.0`
```bash

cargo install wasm-pack # install wasm-pack using cargo. This also can be done with package manager/installation script.

https://github.com/FishyNavi/touch-grass.git && cd touch-grass
wasm-pack build --target web
```
## Running locally
Serving through a local web server is required
```bash
http-server . -p 8080 -c-1 # serving using http-server
```
