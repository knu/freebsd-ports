#!/bin/sh
#
# An rc.subr-style startup script for Courier-IMAP's POP3 service.

# PROVIDE: courier_imap_pop3d
# REQUIRE: LOGIN
# KEYWORD: FreeBSD shutdown

# Define these courier_imap_pop3d_* variables in one of these files:
# 	/etc/rc.conf
# 	/etc/rc.conf.local
# 	/etc/rc.conf.d/courier_imap_pop3d
#
# DO NOT CHANGE THESE DEFAULT VALUES HERE

courier_imap_pop3d_enable=${courier_imap_pop3d_enable-"NO"}

. %%RC_SUBR%%

name="courier_imap_pop3d"
rcvar=`set_rcvar`
command="%%PREFIX%%/libexec/courier-imap/pop3d.rc"

start_cmd="pop3d_cmd start"
stop_cmd="pop3d_cmd stop"
restart_cmd="pop3d_cmd stop && pop3d_cmd start"

load_rc_config $name

pop3d_cmd () {
	case $1 in
	start)
		echo "Starting ${name}."
		${command} start
		;;
	stop)
		echo "Stopping ${name}."
		${command} stop
		;;
	esac
}

run_rc_command "$1"

