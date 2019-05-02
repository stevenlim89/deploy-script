echo "Logging out of gigalixir account"

gigalixir logout

echo "Starting deployment"

while IFS=',' read -r email password directory || [[ -n "$directory" ]]; 
do
	gigalixir login -e $email -p $password -y

	gigalixir account

	cd "$directory" && git pull gigalixir master && 
		git commit --allow-empty -m "deploy" && 
		git push gigalixir master

	gigalixir logout

done < "$1"	

echo "Deployment finished"