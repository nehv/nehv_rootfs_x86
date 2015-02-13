#!/bin/sh

#
# Author: Jamie Strandboge <jamie@canonical.com>
# Copyright (C) 2008 Canonical Ltd.
# 
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.
# 
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
# 
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.
# http://www.gnu.org/copyleft/gpl.html
#

#
# Results:
# keys/key-<pid>.pem
# keys/blacklist.db
#

getpid="./getpid.so"

if [ ! -f "$getpid" ]; then
    echo "$getpid does not exist, exiting"
    exit 1
fi

mkdir keys 2> /dev/null || true

db="keys/blacklist.db"
for i in $(seq 1 32768);
do
    key="keys/key-$i"
    if [ -e "$key" ]; then
        continue
    fi
    echo -n "${i} " >> $db
    FORCE_PID=$i LD_PRELOAD="$getpid" openvpn --genkey --secret $key
    cat $key | md5sum | cut -d ' ' -f 1 >> $db
done
