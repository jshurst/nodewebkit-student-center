studentCenterApp.factory('SearchService', function ($q, $log, DataService, UserService) {

    function searchPerson(personSearch) {

        var addressQuery =
            DataService.execSp('[dbo].[Usp_Select_Person_Search]',
                function (request, TYPES) {
                    request.addParameter('personId', TYPES.Int, personSearch.personId);
                    request.addParameter('active', TYPES.Bit, personSearch.active);
                    request.addParameter('firstName', TYPES.VarChar, personSearch.firstName);
                    request.addParameter('middlename', TYPES.VarChar, personSearch.middleName);
                    request.addParameter('lastName', TYPES.VarChar, personSearch.lastName);
                    request.addParameter('birthDay', TYPES.Int, personSearch.birthDay);
                    request.addParameter('birthMonth', TYPES.Int, personSearch.birthMonth);
                    request.addParameter('birthYear', TYPES.Int, personSearch.birthYear);
                })
            .then(function (dataSet) {
                return dataSet;
            });

        return addressQuery;
    }

    return {
        searchPerson: searchPerson
    };
});
