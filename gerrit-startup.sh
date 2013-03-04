#! /bin/sh
### BEGIN INIT INFO
# Provides:          gerrit
# Required-Start:    $remote_fs $syslog
# Required-Stop:     $remote_fs $syslog
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# Short-Description: Start Gerrit code review
# Description:       This is a wrapper-script for gerrit.sh that provides the
#                    necessary description so that gerrit.sh gets started at the
#                    right time.
### END INIT INFO

# Author: Eberhard Beilharz <eb1@sil.org>

# Do NOT "set -e"

# PATH should only include /usr/* if it runs after the mountnfs.sh script
PATH=/sbin:/usr/sbin:/bin:/usr/bin
DESC="Gerrit Code Review"
NAME=gerrit.sh
DAEMON=/home/gerrit2/review_site/bin/gerrit.sh
#DAEMON_ARGS="--options args"
#PIDFILE=/var/run/$NAME.pid
USERNAME=gerrit2

# Exit if the package is not installed
[ -x "$DAEMON" ] || exit 0

# Delegate everything to the gerrit.sh script
$DAEMON "$@"
:
