require 'busted.runner'()
local validJson = require "./validJson"
local config = os.getenv('GLUON_SITEDIR')

describe("Test config", function()
      it("should be  a valid config", function()
            if validJson(io.open(config .. '/site.conf'):read('*a')) then
                assert.is_true(true)
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
