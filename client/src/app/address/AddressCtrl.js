studentCenterApp.controller('AddressCtrl', function ($modalInstance, AddressService, addressVm) {
    var self = this;

    function init() {
        var result = AddressService.getAddress(addressVm.address.addressId)
            .then(function (dataSet) {
                self.address = dataSet;
            });
    }

    self.save = function () {
        if (self.address.addressId > 0) {
            //update
            AddressService.updateAddress(self.address);
        } else {
            //insert
            self.address.personId = addressVm.personId;
            AddressService.addAddress(self.address);
        }

        //then send a refresh message
        $modalInstance.close("saved!");
    };

    self.cancel = function () {
        $modalInstance.dismiss('cancel');
    };

    self.delete = function() {
        //AddressService.delete(self.address.addressId);
        $modalInstance.close("deleted!");
    }

    init();
});
