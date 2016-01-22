# Swoop
A python script intended to be placed in a directory where executables live, such as /usr/local/sbin.  Intended to assist with managing a group of servers.  The script assumes that lsyncd has been installed and configured on the master server and that all slave servers have ssh keys configured (a common setup)  The script will execute a given command (service httpd reload, for instance) on every server in the group by iterating over its lsyncd configuration and finding the list of IP's of the slave servers.

```
Usage: swoop <command>
Example: swoop service httpd reload
```

One liner to install on Linux server:
```
wget -P /usr/local/sbin/ https://raw.githubusercontent.com/zully/swoop/master/swoop && chmod +x /usr/local/sbin/swoop
```

Report bugs to Chris at zully_1@yahoo.com or as an issue in this github.  https://github.com/zully/swoop
