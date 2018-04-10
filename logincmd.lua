function checkAdminlogin(u,p)
	os.execute 'cls'
	local username = "randomman"
	local password = "12345"

	if((u == username) and (p == password)) then
		return true

	end
	return false
end


function adduser()
	os.execute 'cls'
	while ((usern == nil) or (usern == "")) do
		print "Enter the new users username"
		usern = io.read()
		os.execute'cls'
	end
	while ((userp == nil) or (userp == "")) do
	print "Enter the new users password"
	userp = io.read()
	os.execute 'cls'
	end
	users[usern] = userp
	userp = nil
	usern = nil
end


function deleteuser(user)
	if users[user] ~= nil then
		users[user] = nil
		print (user .. " Deleted")

		print "press any key to continue: "
		choice = io.read()
	elseif users[user]== nil then
		print "Invalid Name"

		print "press any key to continue: "
		choice = io.read()
	end

end


function AdminOptions()
	while (choice ~= '3') do
		os.execute 'cls'
		print "Add New User(1)\nDelete Existing User(2)\nLogout(3)"
		choice = io.read()
		if choice == '1' then
			adduser()
		elseif choice == '2' then
			os.execute 'cls'
			print "Enter the username of the user you want to delete: "
			deluser = io.read()
			deleteuser(deluser)
		end
	end
end





function normalUserOptions()
	print "Logout(1)"
	return io.read()

end

users = {}
choice = nil
repeat
	os.execute 'cls'
	username = nil
	password = nil
	choice = nil
	print "Login(1)\nQuit(2)\n"
	choice = io.read()
	if choice == '2' then return '0'
	elseif choice == '1' then

	print "please enter your username: "
	username = io.read()
	print "please enter your password: "
	password = io.read()
	end
	if ((username ~= nil) and (password ~= nil)) then
		if(checkAdminlogin(username, password)) then
			AdminOptions()


		elseif(password == users[username]) then
			choice = 0
			while choice ~= '1' do
			os.execute 'cls'
			choice = normalUserOptions()
			end
		end
	end
until choice == '2'

