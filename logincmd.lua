-- checks to see if the credentials are for the admin
function checkAdminlogin(u,p)
	os.execute 'cls'
	-- hardcoded admin credentials
	local username = "randomman"
	local password = "12345"
	-- checks to see if the given credentials are the same if so return true
	if((u == username) and (p == password)) then
		return true
	end
	-- returns false if given credentials are not admin
	return false
end

-- adds a user with given credentials
function adduser()
	os.execute 'cls'
	-- repeats until username is given
	while ((usern == nil) or (usern == "")) do
		print "Enter the new users username"
		usern = io.read()
		os.execute'cls'
	end
	-- repeats until password is given
	while ((userp == nil) or (userp == "")) do
	print "Enter the new users password"
	userp = io.read()
	os.execute 'cls'
	end
	-- makes the user
	users[usern] = userp
	-- resets credentials to nil for next use
	userp = nil
	usern = nil
end

-- deletes the user specified
function deleteuser(user)
	-- checks to see if user given is nil
	if users[user] ~= nil then
		users[user] = nil
		print (user .. " Deleted")
		print "press any key to continue: "
		choice = io.read()
	-- if user given is nil gives error
	elseif users[user]== nil then
		print "Invalid Name"

		print "press any key to continue: "
		choice = io.read()
	end
end

-- Admin account options given
function AdminOptions()
	-- logs out if option 3 is chosen
	while (choice ~= '3') do
		os.execute 'cls'
		print "Add New User(1)\nDelete Existing User(2)\nLogout(3)"
		choice = io.read()
		-- adds a user if option 1 is chosen
		if choice == '1' then
			adduser()
		-- deletes a user if option 2 is chosen
		elseif choice == '2' then
			os.execute 'cls'
			print "Enter the username of the user you want to delete: "
			deluser = io.read()
			deleteuser(deluser)
		end
	end
end




-- normal account options given
function normalUserOptions()
	print "Logout(1)"
	return io.read()

end


users = {}
choice = nil

-- repeats the application until q is hit when given the option
repeat
	os.execute 'cls'
	username = nil
	password = nil
	choice = nil
	print "Login(1)\nQuit(2)\n"
	choice = io.read()
	-- if the choice is 2 then break out of the loop
	if choice == '2' then break

	-- if choice is 1 enter logit credentials
	elseif choice == '1' then
	print "please enter your username: "
	username = io.read()
	print "please enter your password: "
	password = io.read()
	end

	-- if the credentials given are not nil proceed
	if ((username ~= nil) and (password ~= nil)) then
		-- if login credentials are the same as the admin login to admin
		if(checkAdminlogin(username, password)) then
			AdminOptions()

		-- if the credentials are the same as another user login to that user
		elseif(password == users[username]) then
			choice = 0
			while choice ~= '1' do
			os.execute 'cls'
			choice = normalUserOptions()
			end
		end
	end
-- quits application
until choice == '2'

