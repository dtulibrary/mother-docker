# Use this script when you need to remove the /tmp/pids/server.pid files
sudo chown -R $USER:$USER .
for i in $(find . -type f -name server.pid); do rm -i $i; done;
