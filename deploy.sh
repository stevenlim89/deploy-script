gigalixir logout

while IFS=',' read -r email password directory || [[ -n "$directory" ]]; 
do
	gigalixir login -e $email -p $password -y

	gigalixir account

	cd "$directory" && git commit --allow-empty -m "deploy" && 
		`git push gigalixir master`

	gigalixir logout

done < "$1"