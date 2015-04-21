function auth(request)

	if is_table(request) then
		local auth = request.headers.Authorization

		if auth then
			local user, pass = get_credentials(auth)
			return { user = user, pass = pass }
		end
	end
end

function get_credentials(header)

	local b64 = require "base64"

	local credentials = header:match(".%w+%s(%w+.)")

	local credentials_decoded = b64.decode(credentials)

	return credentials_decoded:match("(.*):(.*)")

end

function is_table(param)

	if type(param) == "table" then
		return true
	end
end

return auth
