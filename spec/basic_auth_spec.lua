 
local auth = require 'basic-auth'


local request = 
{
	headers = 
	{
		Authorization = " Basic YWRtaW46YWRtaW4="
	}
}

describe("auth(request)", function()

	describe('with no params', function()

		it("should return nil", function()

			local ret = auth()
			assert.is.falsy(ret)
		end)
		
	end)

	describe('with invalid param', function()

		it("should return nil", function()

			local ret = auth("string isn't table")
			assert.is.falsy(ret)
		end)
		
	end)

	describe('with valid credentials', function()

		it("should return table with user and pass", function()

			local credentials = auth(request)

			expected_user = 'admin'
			expected_pass = 'admin'

			assert.are.same(expected_user, credentials.name)
			assert.are.same(expected_pass, credentials.pass)

		end)
		
	end)
end)
