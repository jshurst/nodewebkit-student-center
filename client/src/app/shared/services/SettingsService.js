studentCenterApp.factory('SettingsService', function (DataService) {

    function getSetting(setting) {
        var settingQuery =
            DataService.execSp('[dbo].[Usp_Select_SystemSetting]',
                function (request, TYPES) {
                    request.addParameter('owner', TYPES.VarChar, setting.owner);
                    request.addParameter('key', TYPES.VarChar, setting.key);
                })
            .then(function (dataSet) {
                return dataSet[0];
            });

        return settingQuery;
    }

    function getBasePath() {
        var ds = '/';

        if (process.platform.match(/^win/)) {
            ds = '\\';
        }
        var pathfrags = process.execPath.split(ds);
        var appDir = '';
        // Get rid of filename
        for (var i = 0; i < pathfrags.length - 1; i++) {
            appDir += pathfrags[i] + ds;
        }

        return appDir;
    }

    return {
        getSetting: getSetting,
        getBasePath: getBasePath
    };
});