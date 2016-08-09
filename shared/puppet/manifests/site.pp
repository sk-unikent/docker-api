node 'default'
{
    include api::base

    service {
        ['nginx', 'crond', 'php56-php-fpm']:
            enable => true;
    }

    file {
        '/etc/nginx/conf.d/default.conf':
            ensure => absent;

        '/etc/nginx/conf.d/api-dev.kent.ac.uk.conf':
            ensure => present,
            source => 'puppet:///modules/webfarm/api-dev.kent.ac.uk.conf';

        '/var/www/vhosts/api-dev.kent.ac.uk/public':
            ensure => link,
            target => '/data/api/public';

        '/opt/remi/php56/root/etc/php-fpm.d/www.conf':
            ensure => absent;

        '/opt/remi/php56/root/etc/php-fpm.d/api-dev.kent.ac.uk.conf':
            ensure => present,
            source => 'puppet:///modules/webfarm/api-pool.conf';
    }
}
