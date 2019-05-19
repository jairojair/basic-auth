## Basic Auth

[![Build Status](https://drone.io/github.com/jairojair/basic-auth/status.png)](https://drone.io/github.com/jairojair/basic-auth/latest)


Generic basic Authorization based on header field, according [RFC 2617](https://www.ietf.org/rfc/rfc2617.txt).


#### Installation

```
luarocks install basic-auth
```

### How to works ?

See a example below using [Pegasus.lua](https://github.com/EvandroLG/pegasus.lua)

```lua

local auth      = require 'basic-auth'
local pegasus   = require 'pegasus'

local server = pegasus:new('9090')

server:start(function (req, rep)

    local user = auth(req)

    if user then

    	--[[ 

    	Use credentials from database, file, memory, whatever.
    	This example was used vars :)
    
    	--]] 

    	local fakeUserName = 'admin'
    	local fakePassWord = 'admin'

    	if user.name == fakeUserName and user.pass == fakePassWord then
    		rep:statusCode(200):write('Welcome')
    	else
    		rep:statusCode(403):write('Invalid credentials')
    	end
    else
    	rep:addHeader('WWW-Authenticate', 'Basic realm="Restricted"')
	rep:statusCode(401, 'Unauthorized'):write('Authentication required!')
	end
end)


```

### Contributing

- fork 
- add your contribution *Thank's a lot !* 
- send pull request

#### Issues

See the issues [here](https://github.com/jairojair/basic-auth/issues)

####  Tests

```
 busted
```

#### About

Inspired by [jshttp](https://github.com/jshttp/basic-auth) and [wsapi_basic_auth](https://github.com/keplerproject/wsapi_basic_auth)

#### License

[MIT](LICENSE)
