studentCenterApp.factory('DataConfigService', function ($log) {

    var config = require('./dbConfig.json');

    function getConfig() {
        //Should get this from a config file
        return config;
    }

    return {
        getConfig: getConfig
    };
});
