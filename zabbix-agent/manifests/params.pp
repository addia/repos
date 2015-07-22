#
# === Class: zabbix_agent::params
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
class zabbix_agent::params {

    $package_ensure         = 'installed'
    $config_root            = '/etc/zabbix_agent'
    $config_template        = 'zabbix_agent/zabbix_agent.erb'
    $pidfile                = ''
    $logfile                = ''
    $logfilesize            = ''
    $debuglevel             = ''
    $sourceip               = $::serverip
    $enableremotecommands   = ''
    $logremotecommands      = ''
    $server                 = []
    $listenport             = ''
    $listenip               = ''
    $startagents            = ''
    $serveractive           = ''
    $hostname               = ''
    $hostnameitem           = ''
    $hostmetadata           = "$::kernel 'aaabbbbccccddddeeee'"
    $hostmetadataitem       = "$::kernel $::os"
    $refreshactivechecks    = ''
    $buffersend             = ''
    $buffersize             = ''
    $maxlinespersecond      = ''
    $allowroot              = ''
    $aliasss                = ''
    $timeout                = ''
    $include                = '/etc/zabbix/zabbix_agentd.conf.d/'
    $unsafeuserparameters   = ''
    $userparameter          = 'smart.check,/opt/local/zabbix/scripts/smartchk.sh'

}
