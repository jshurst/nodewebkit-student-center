studentCenterApp.factory('AddressService', function ($q, $log, DataService, UserService) {

    function getAddresses(personId) {

        var addressQuery =
            DataService.execSp('[dbo].[Usp_Select_Address_By_PersonId]',
                function (request, TYPES) {
                    request.addParameter('personId', TYPES.Int, personId);
                })
            .then(function (dataSet) {
                return dataSet;
            });

        return addressQuery;
    }

    function getAddress(addressId) {

        var addressQuery =
            DataService.execSp('[dbo].[Usp_Select_Address_By_AddressId]',
                function (request, TYPES) {
                    request.addParameter('addressId', TYPES.Int, addressId);
                })
            .then(function (dataSet) {
                return dataSet[0];
            });

        return addressQuery;
    }

    function updateAddress(address) {

        var addressQuery =
            DataService.execSp('[dbo].[Usp_Update_Address]',
                function (request, TYPES) {
                    request.addParameter('addressId', TYPES.Int, address.addressId);
                    request.addParameter('village', TYPES.VarChar, address.village);
                    request.addParameter('street', TYPES.VarChar, address.street);
                    request.addParameter('postalCode', TYPES.VarChar, address.postalCode);
                    request.addParameter('region', TYPES.VarChar, address.region);
                    request.addParameter('country', TYPES.VarChar, address.country);
                    request.addParameter('modifiedOn', TYPES.DateTime, new Date());
                    request.addParameter('modifiedBy', TYPES.VarChar, UserService.getUser());
                })
            .then(function () {
                return;
            });

        return addressQuery;
    }

    function addAddress(address) {

        var addressQuery =
            DataService.execSp('[dbo].[Usp_Insert_Address]',
                function (request, TYPES) {
                    request.addParameter('personId', TYPES.Int, address.personId);
                    request.addParameter('village', TYPES.VarChar, address.village);
                    request.addParameter('street', TYPES.VarChar, address.street);
                    request.addParameter('postalCode', TYPES.VarChar, address.postalCode);
                    request.addParameter('region', TYPES.VarChar, address.region);
                    request.addParameter('country', TYPES.VarChar, address.country);
                    request.addParameter('createdOn', TYPES.DateTime, new Date());
                    request.addParameter('createdBy', TYPES.VarChar, UserService.getUser());
                    request.addParameter('modifiedOn', TYPES.DateTime, new Date());
                    request.addParameter('modifiedBy', TYPES.VarChar, UserService.getUser());
                })
            .then(function () {
                return;
            });

        return addressQuery;
    }

    return {
        getAddress: getAddress,
        getAddresses: getAddresses,
        updateAddress: updateAddress,
        addAddress: addAddress
    };
});
