pcfile=~/.aws/credentials_pixxis
cfile=~/.aws/credentials

if [ -L $cfile ] && [ "$(readlink $cfile)" = "$pcfile" ]; then
	echo "=> Info: Symlink exists and already points to Pixxis credentials"
	echo "=> Info: Nothing to do...."
	exit
fi

if [ ! -f $pcfile ]; then
       	echo "=> Error: Pixxis credentials file doesn't exist"
	exit
else
	echo "=> Info: Pixxis credentials file found"
fi

if [ -f $cfile ]  && [ ! -h $cfile ]; then
       	echo "=> Error: Credentials file is not a symlink"
	exit
else
	ln -s ~/.aws/credentials_pixxis ~/.aws/credentials
	echo "=> Info: Symlink to Pixxis credentials created"
	echo "=> Info: All done..."
fi
