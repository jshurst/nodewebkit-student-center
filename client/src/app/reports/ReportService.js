studentCenterApp.factory('ReportService', function ($q, $log, SettingsService) {
    var gui = require('nw.gui'),        
        wkhtmltopdf = require('wkhtmltopdf');

    function renderReport(html, reportId) {

        //We should either ask the user, or scan for this
        //Or perhaps capture it on install?
        wkhtmltopdf.command = 'C:\\Program Files\\wkhtmltopdf\\bin\\wkhtmltopdf.exe';
        var reportOutputPath = SettingsService.getBasePath() + id + getDateIdentifier() + '.pdf';

        //Print to pdf
        wkhtmltopdf(html, {
            output: reportOutputPath
        }, function (code, signal) {
            gui.Shell.openItem(reportOutputPath);
        });
    }

    function getDateIdentifier() {
        //prob should let the user decide if they want this
        var date = new Date();
        var year = date.getFullYear();
        var month = date.getMonth() + 1; // "+ 1" becouse the 1st month is 0
        var day = date.getDate();
        var hour = date.getHours();
        var minutes = date.getMinutes();
        var secconds = date.getSeconds();
        var dateId = '--' + year + '-' + month + '-' + day + '--' + hour + '' + minutes + '' + secconds;
        return dateId;
    }

    return {
        searchPerson: searchPerson
    };
});