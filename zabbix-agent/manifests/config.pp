# === Class: zabbix_agent::config
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
class zabbix_agent::config inherits zabbix_agent {

    # Workaround for the lack of dirname() in stdlib 3.2.
    $directory = inline_template('<%= File.dirname(config) %>')
    file { $directory:
        ensure  => directory,
        owner   => root,
        group   => root,
        mode    => '0755',
        recurse => true,
    }

    file { $config:
        ensure  => file,
        owner   => root,
        group   => root,
        mode    => '0644',
        content => template($config_template),
    }

}
