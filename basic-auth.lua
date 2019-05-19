function auth(request)

	if is_table(request) then
		local auth = request:headers().Authorization

		if auth then
			local username, password = get_credentials(auth)
			return { name = username, pass = password }
		end
	end
end

function get_credentials(header)

	local b64 = require "base64"

	local credentials_decoded = b64.decode(header:match(".%w+%s(%w+.)"))

	return credentials_decoded:match("(.*):(.*)")

end

function is_table(param)

	if type(param) == "table" then
		return true
	end
end

return auth
