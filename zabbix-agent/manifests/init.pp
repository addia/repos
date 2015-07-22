# === Class: zabbix_agent
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
class zabbix_agent(

    $package_ensure         = $zabbix_agent::params::package_ensure,
    $config_root            = $zabbix_agent::params::config_root,
    $config_template        = $zabbix_agent::params::config_template,
    $pidfile                = $zabbix_agent::params::pidfile,
    $logfile                = $zabbix_agent::params::logfile,
    $logfilesize            = $zabbix_agent::params::logfilesize,
    $debuglevel             = $zabbix_agent::params::debuglevel,
    $sourceip               = $zabbix_agent::params::sourceip,
    $enableremotecommands   = $zabbix_agent::params::enableremotecommands,
    $logremotecommands      = $zabbix_agent::params::logremotecommands,
    $server                 = $zabbix_agent::params::server,
    $listenport             = $zabbix_agent::params::listenport,
    $listenip               = $zabbix_agent::params::listenip,
    $startagents            = $zabbix_agent::params::startagents,
    $serveractive           = $zabbix_agent::params::serveractive,
    $hostname               = $zabbix_agent::params::hostname,
    $hostnameitem           = $zabbix_agent::params::hostnameitem,
    $hostmetadata           = $zabbix_agent::params::hostmetadata,
    $hostmetadataitem       = $zabbix_agent::params::hostmetadataitem,
    $refreshactivechecks    = $zabbix_agent::params::refreshactivechecks,
    $buffersend             = $zabbix_agent::params::buffersend,
    $buffersize             = $zabbix_agent::params::buffersize,
    $maxlinespersecond      = $zabbix_agent::params::maxlinespersecond,
    $allowroot              = $zabbix_agent::params::allowroot,
    $aliasss                = $zabbix_agent::params::aliasss,
    $timeout                = $zabbix_agent::params::timeout,
    $include                = $zabbix_agent::params::include,
    $unsafeuserparameters   = $zabbix_agent::params::unsafeuserparameters,
    $userparameter          = $zabbix_agent::params::userparameter,

) inherits zabbix_agent::params {

    validate_string($package_ensure)
    validate_absolute_path($config_root)
    validate_string($config_template)

    validate_string($pidfile)
    validate_string($logfile)
    if ! is_integer($logfilesize) {
        validate_re($logfilesize, '\d+')
    }
    if ! is_integer($debuglevel) {
        validate_re($debuglevel, '\d+')
    }
    validate_string($sourceip)
    validate_bool($enableremotecommands)
    validate_bool($logremotecommands)
    validate_string($server)
    validate_string($listenport)
    validate_string($listenip)
    validate_string($startagents)
    validate_string($serveractive)
    validate_string($hostname)
    validate_string($hostnameitem)
    validate_string($hostmetadata)
    validate_string($hostmetadataitem)
    if ! is_integer($refreshactivechecks) {
        validate_re($refreshactivechecks, '\d+')
    }
    if ! is_integer($buffersend) {
        validate_re($buffersend, '\d+')
    }
    if ! is_integer($buffersize) {
        validate_re($buffersize, '\d+')
    }
    if ! is_integer($maxlinespersecond) {
        validate_re($maxlinespersecond, '\d+')
    }
    validate_bool($allowroot)
    validate_string($aliasss)
    if ! is_integer($timeout) {
        validate_re($timeout, '\d+')
    }
    validate_string($include)
    validate_bool($unsafeuserparameters)
    validate_string($euserparameters)


    anchor { 'zabbix_agent::begin': } ->
    class { '::zabbix_agent::install': } ->
    class { '::zabbix_agent::config': } ~>
    class { '::zabbix_agent::service': } ->
    anchor { 'zabbix_agent::end': }

}
