studentCenterApp.factory('NotificationService', function () {

    function configure(obj) {
        obj.options = {
            'positionClass': 'toast-bottom-full-width'
        };
    }


    function error(text) {
        configure(toastr);
        toastr.error(text, 'Error');
    }

    function success(text) {
        configure(toastr);
        toastr.success(text, 'Success');
    }

    //Handle uncaught exceptions
    process.on('uncaughtException', function (err) {
        error(err);
    });

    return {
        success: success,
        error: error
    };
});