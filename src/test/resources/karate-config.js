function fn() {
    var env = karate.env || 'dev';
    karate.log('Environment:', env);

    var config = {
        baseUrl: 'https://dev.api.com'
    };

    if (env == 'staging') {
        config.baseUrl = 'https://staging.api.com';
    }
    if (env == 'prod') {
        config.baseUrl = 'https://api.pearson.com';
    }

    // Common headers for all requests
    karate.configure('headers', {
        'Content-Type': 'application/json',
        'Accept': 'application/json'
    });

    return config;
}
