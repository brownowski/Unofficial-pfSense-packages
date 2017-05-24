#!/bin/sh

# *
# * install_filer_23.sh
# *
# * part of unofficial packages for pfSense(R) software
# * Copyright (c) 2011-2017 Marcello Coutinho
# * All rights reserved.
# *
# * Licensed under the Apache License, Version 2.0 (the "License");
# * you may not use this file except in compliance with the License.
# * You may obtain a copy of the License at
# *
# * http://www.apache.org/licenses/LICENSE-2.0
# *
# * Unless required by applicable law or agreed to in writing, software
# * distributed under the License is distributed on an "AS IS" BASIS,
# * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# * See the License for the specific language governing permissions and
# * limitations under the License.

if [ "$(cat /etc/version | cut -c 1-3)" == "2.3" ]; then
prefix=https://raw.githubusercontent.com/pfsense/pfsense-packages/master/config/filer
prefix2=https://raw.githubusercontent.com/marcelloc/Unofficial-pfSense-packages/master/pkg-filer/files/

# /etc/inc files
file=/etc/inc/priv/filer.priv.inc
fetch -q -o $file $prefix/$file

check_service_file=check_filer_service.php
fetch -q -o /root/$check_service_file $prefix2/$check_service_file

# /usr/local files

for file in filer.inc filer.xml filer_sync.xml
 do
	echo "fetching  /usr/local/pkg/$file from github"
	fetch -q -o /usr/local/pkg/$file $prefix/$file
done

#install services and menus
php /root/check_filer_service.php

fi
