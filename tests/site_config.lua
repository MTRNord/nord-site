require 'busted.runner'()
local validJson = require "tests/validJson"
local config = os.getenv('GLUON_SITEDIR')
function jsonLint(json){
      local file = io.open("/tmp/config.json", "a")
      io.write(json)
      io.close(file)
      local handle = assert(io.popen("jsonlint /tmp/config.json -t [    ]"))
      local result = handle:read("*all")
      handle:close()
      print(result)
}

describe("Test config", function()
      it("should be  a valid config", function()
            local json = io.open(config .. '/site.conf'):read('*a')
            if validJson(json) then
                  jsonLint(json)
            else
                local errfn = function()
                  error("Invalid Config: ")
                end

                assert.has_error(errfn, "Invalid Config: ")
               local function loader()
                  coroutine.yield('return ')
                  coroutine.yield(io.open(config .. '/site.conf'):read('*a'))
               end

               -- setfenv doesn't work with Lua 5.2 anymore, but we're using 5.1
               setfenv(assert(load(coroutine.wrap(loader), 'site.conf')), {})()
            end
     end)
end)

