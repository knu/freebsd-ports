#!/bin/sh
#
# $FreeBSD$
#

# PROVIDE: clamav-milter
# REQUIRE: LOGIN clamd
# BEFORE: mail
# KEYWORD: shutdown

#
# Add the following lines to /etc/rc.conf to enable clamav-milter:
#
#clamav_milter_enable="YES"
#
# See clamav-milter(1) for flags
#

. %%RC_SUBR%%

name=clamav_milter
rcvar=`set_rcvar`

command=%%PREFIX%%/sbin/clamav-milter
pidfile=%%RUNDIR%%/clamav-milter.pid
required_dirs=%%DBDIR%%
required_files=%%PREFIX%%/etc/clamd.conf

start_precmd=start_precmd

start_precmd()
{
	if [ -S "$clamav_milter_socket" ]; then
		warn "Stale socket $clamav_milter_socket removed."
		rm "$clamav_milter_socket"
	fi
	rc_flags="--pidfile ${pidfile} ${flags:-$clamav_milter_flags} $clamav_milter_socket"
}

# read settings, set default values
load_rc_config $name
: ${clamav_milter_enable="NO"}
: ${clamav_milter_socket="%%CLAMAV_MILTER_SOCKET%%"}
: ${clamav_milter_flags="--postmaster-only --local --outgoing --max-children=50"}

# add socket to any given argument
clamav_milter_flags="${clamav_milter_flags} ${clamav_milter_socket}"
run_rc_command "$1"
