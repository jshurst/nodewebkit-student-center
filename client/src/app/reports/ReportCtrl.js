studentCenterApp.controller('ReportCtrl', function (addressVm) {
    var self = this;

    function init() {
        var result = AddressService.getAddress(addressVm.address.addressId)
            .then(function (dataSet) {
                self.address = dataSet;
            });
        
        
    }   

    init();
});
