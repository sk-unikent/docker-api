node 'default'
{
    include api::base

    file {
        '/var/www/vhosts/api-dev.kent.ac.uk/public/testing':
            ensure => link,
            target => '/data';

        '/var/www/vhosts/api-dev.kent.ac.uk/writable/data/testing':
            ensure => directory,
            require => File['/var/www/vhosts/api-dev.kent.ac.uk/writable/data'];
    }
}
