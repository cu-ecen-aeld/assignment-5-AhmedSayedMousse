#!/bin/sh
# Sample init script for the misc drivers module <rubini@linux.it>

case "$1" in
  start)
     echo -n "Loading modules scull, hello and faulty"
	/usr/bin/scull_load
	/usr/bin/module_load faulty
	modprobe hello
	echo "."
	;;
  stop)
	echo -n "UnLoading modules scull, hello and faulty"
	/usr/bin/module_unload faulty
	/usr/bin/module_unload hello
	/usr/bin/scull_unload
	echo "."
	;;
  force-reload|restart)
	echo -n "ReLoading modules scull, hello and faulty"
	/usr/bin/module_unload faulty
	/usr/bin/module_unload hello
	/usr/bin/scull_unload
	/usr/bin/scull_load
	/usr/bin/module_load faulty
	modprobe hello
	echo "."
	;;
  *)
	echo "Usage: $0 {start|stop|restart|force-reload}"
	exit 1
esac

exit 0
