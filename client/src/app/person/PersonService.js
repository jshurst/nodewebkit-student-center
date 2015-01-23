studentCenterApp.factory('PersonService', function ($q, $log, AddressService, NotificationService, DataService, SettingsService, UserService) {

    var moment = require('moment');

    function search(criteria) {

        var deferred = $q.defer();

        return deferred.promise;
    }

    function createPerson(person) {
        //Object.prototype.toString.call(1)).slice(8, -1)
        var now = new Date();
        person.createdOn = now;
        person.createdBy = UserService.getUser();
        person.modifiedOn = now;
        person.modifiedBy = UserService.getUser();

        var promise =
            DataService.execSp('[dbo].Usp_Person_Insert',
                function (request, TYPES) {
                    request.addParameter('firstName', TYPES.VarChar, person.firstName);
                    request.addParameter('middleName', TYPES.VarChar, person.middleName);
                    request.addParameter('lastName', TYPES.VarChar, person.lastName);
                    request.addParameter('birthDay', TYPES.Int, person.birthDay);
                    request.addParameter('birthMonth', TYPES.Int, person.birthMonth);
                    request.addParameter('birthYear', TYPES.Int, person.birthYear);
                    request.addParameter('createdOn', TYPES.DateTime, person.createdOn);
                    request.addParameter('createdBy', TYPES.VarChar, person.createdBy);
                    request.addParameter('modifiedOn', TYPES.DateTime, person.modifiedOn);
                    request.addParameter('modifiedBy', TYPES.VarChar, person.modifiedBy);
                })
            .then(function (dataSet) {
                NotificationService.success('Person was created!');
                return dataSet;
            });

        return promise;
    }

    function updatePerson(person) {
        //Object.prototype.toString.call(1)).slice(8, -1)
        var now = new Date();
        person.modifiedOn = now;
        person.modifiedBy = UserService.getUser();

        var promise =
            DataService.execSp('[dbo].Usp_Person_Insert',
                function (request, TYPES) {
                    request.addParameter('firstName', TYPES.Int, person.personId);
                    request.addParameter('firstName', TYPES.VarChar, person.firstName);
                    request.addParameter('middleName', TYPES.VarChar, person.middleName);
                    request.addParameter('lastName', TYPES.VarChar, person.lastName);
                    request.addParameter('birthDay', TYPES.Int, person.birthDay);
                    request.addParameter('birthMonth', TYPES.Int, person.birthMonth);
                    request.addParameter('birthYear', TYPES.Int, person.birthYear);
                    request.addParameter('modifiedOn', TYPES.DateTime, person.modifiedOn);
                    request.addParameter('modifiedBy', TYPES.VarChar, person.modifiedBy);
                })
            .then(function (dataSet) {
                NotificationService.success('Person was updated!');
                return dataSet;
            });

        return promise;
    }


    function getPersonSummary(personId) {

        var promises = [];
        promises.push(getPerson(personId));
        promises.push(AddressService.getAddresses(personId));
        promises.push(getEducation(personId));
        promises.push(getPersonPictures(personId));
        promises.push(SettingsService.getSetting({
            owner: 'System',
            key: 'PersonPictureLocation'
        }));

        return $q.all(promises).then(
            function (values) {
                var dataSet = {
                    person: values[0],
                    address: values[1],
                    education: values[2],
                    personPictures: values[3],
                    personPictureLocation: values[4].value
                };

                NotificationService.success('Ran all profile queries.');
                return dataSet;
            });
    }

    function getPerson(personId) {

        var personQuery =
            DataService.execSp('[dbo].[Usp_Select_Person_By_PersonId]',
                function (request, TYPES) {
                    request.addParameter('personId', TYPES.Int, personId);
                })
            .then(function (dataSet) {
                var found = dataSet[0],
                    birthDate;

                if (found && found.birthYear) {
                    var birthDate = found.birthYear.toString();
                    birthDate = (found.birthMonth ? birthDate + '-' + found.birthMonth.toString() : birthDate + '-' + '1');
                    birthDate = (found.birthDay ? birthDate + '-' + found.birthDay.toString() : birthDate + '-' + '1');
                    birthDate = moment().diff(birthDate, 'years');
                }

                found.age = (birthDate ? birthDate : '');

                return found;
            });

        return personQuery;
    }

    function getEducation(personId) {

        var educationQuery =
            DataService.execSp('[dbo].[Usp_Select_Education_By_PersonId]',
                function (request, TYPES) {
                    request.addParameter('personId', TYPES.Int, personId);
                })
            .then(function (dataSet) {
                return dataSet;
            });

        return educationQuery;
    }

    function getEducationNotes(personId) {

        var educationQuery =
            DataService.execSp('[dbo].[Usp_Select_Education_Note_By_PersonId]',
                function (request, TYPES) {
                    request.addParameter('personId', TYPES.Int, personId);
                })
            .then(function (dataSet) {
                return dataSet;
            });

        return educationQuery;
    }

    function getPersonPictures(personId) {

        var personQuery =
            DataService.execSp('[dbo].[Usp_Select_Person_Picture_By_PersonId]',
                function (request, TYPES) {
                    request.addParameter('personId', TYPES.Int, personId);
                })
            .then(function (dataSet) {
                return dataSet;
            });

        return personQuery;
    }

    /*function saveData(person) {

        var now = new Date();
        person.modifiedOn = now;
        person.modifiedBy = UserService.getUser();

        //Let's determine if we need to insert or update
        if (person.personId) {
            //Update

        } else {
            //Insert
            person.createdOn = now;
            person.createdBy = UserService.getUser();

            createPerson(person).then(
                function (x, y) {

                },
                function (r, s) {
                    $log.log(r);
                    $log.log(s);
                }
            );
        }
    }*/

    return {
        search: search,
        getPersonSummary: getPersonSummary,
        getPerson: getPerson,
        getPersonPictures: getPersonPictures,
        createPerson: createPerson,
        updatePerson: updatePerson
        //saveData: saveData
    }
});