# === Class: zabbix_agent::install
#
# === Author
#
# Addi Abel
#
# === Copyright
#
# Copyright 2015 Addi Abel
#
#
#
class zabbix_agent::install inherits zabbix_agent {

    package { 'zabbix-agent':
        ensure  => $package_ensure,
        name    => $package_name,
    }

}
