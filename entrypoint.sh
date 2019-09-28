#!/bin/bash
monitor()
{
    /usr/bin/ssh-keygen -A
	/usr/sbin/sshd
	netstat -tnlp
	echo "----------------------------------------"
	echo "Running - stop container to exit"
	# Loop forever by default - container must be stopped manually.
	# Here is where you can add in conditions controlling when your container will exit - e.g. check for existence of specific processes stopping or errors being reported
	while true; do
		sleep 1
	done
}
trap stop SIGTERM SIGINT
monitor