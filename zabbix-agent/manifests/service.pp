# === Class: zabbix_agent::service
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
class zabbix_agent::service inherits zabbix_agent {

    if $service_manage == true {
        service { 'zabbix-agent':
            ensure      => $service_ensure,
            enable      => $service_enable,
            name        => $service_name,
            hasstatus   => true,
            hasrestart  => true,
        }
    }

}
