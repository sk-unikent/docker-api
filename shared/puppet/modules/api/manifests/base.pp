class api::base {
    group {
        'pkg':
            ensure => 'present';
    }

    user {
        ['w3api', 'w3admin']:
            ensure => 'present',
            managehome => true,
            groups => ['pkg'],
            require => Group['pkg'];
    }

    class {
        'webfarm::base': ;
    }

    webfarm::base::vhost {
        'api-dev.kent.ac.uk': ;
    }
}
