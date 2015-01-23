studentCenterApp.controller('SearchCtrl', function ($log, SearchService, SettingsService) {
    var self = this;
    self.personSearch = {};

    self.searchPerson = function () {
        SearchService.searchPerson(self.personSearch)
            .then(function (dataSet) {
                self.personSearchResults = dataSet;
            });
    };

    self.searchPersonReset = function ($event) {
        $event.preventDefault();
        self.personSearch = {};
        self.personSearchResults = [];
    }

});