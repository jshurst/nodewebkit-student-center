studentCenterApp.factory('UserService', function () {

    var username;

    function getUser(obj) {
        if (username) {
            return username;
        }

        username = process.env[(process.platform == 'win32') ? 'USERNAME' : 'HOME'];
        return username;
    }

    function userHasAccess() {
        var user = getUser();
        //Need to add conditional logic here
        return true;
    }

    return {
        userHasAccess: userHasAccess,
        getUser: getUser
    };
});
