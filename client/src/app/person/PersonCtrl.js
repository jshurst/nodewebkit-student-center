studentCenterApp.controller('PersonCtrl', function ($scope, $timeout, $routeParams, $modal, $log, PersonService, AddressService, SettingsService) {
    var self = this,
        personId = $routeParams.personId;


    function init() {
        PersonService.getPersonSummary(personId)
            .then(function (dataSet) {
                self.person = dataSet.person;
                self.address = dataSet.address;
                self.education = dataSet.education;
                self.personPictures = dataSet.personPictures;
                self.personPictureLocation = dataSet.personPictureLocation;
            });
    }

    $scope.$on('$includeContentLoaded', function () {
        $timeout(function () {
            var a = $('#addyId').html();
            if (a) {
                console.log(a);

            }
        }, 0);
    });


    self.update = function () {
        PersonService.updatePerson(self.person);
    };

    self.cancel = function () {
        init();
    };

    self.addAddress = function () {
        openModal('emptyAddress').then(refreshAddress);
    };

    self.editAddress = function (address) {
        openModal(address).then(refreshAddress);
    };

    function openModal(address) {
        var modalInstance = $modal.open({
            templateUrl: 'address/addressAddEdit.html',
            controller: 'AddressCtrl as vm',
            backdrop: 'static',
            resolve: {
                addressVm: function () {
                    return {
                        personId: personId,
                        address: address
                    };
                }
            }
        });

        return modalInstance.result;
    }

    function refreshAddress(msg) {
        AddressService.getAddresses(personId)
            .then(function (dataSet) {
                self.address = dataSet;
            });
    }

    init();
});