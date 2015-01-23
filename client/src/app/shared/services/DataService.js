studentCenterApp.factory('DataService', function ($q, $log, DataConfigService, NotificationService) {

    var Connection = require('tedious').Connection,
        Request = require('tedious').Request,
        config = DataConfigService.getConfig(),
        TYPES = require('tedious').TYPES,
        utf8 = require('utf8');

    function exec(stmt, createParams, spOrSql) {
        var deferred = $q.defer(),
            recordSet = [],
            connection = new Connection(config);

        connection.on('connect', function (err) {
            if (err) {
                NotificationService.error(err.message);
            } else {

                var request = new Request(stmt, function (err, rowCount) {
                    if (err) {
                        NotificationService.error(err.message);
                        deferred.reject(err);
                    } else {
                        deferred.resolve(recordSet);
                    }

                    connection.close();
                });

                request.on('row', function (columns) {
                    var row = {};
                    columns.forEach(function (column) {
                        if (column.isNull) {
                            row[column.metadata.colName] = null;
                        } else {
                            row[column.metadata.colName] = column.value;
                        }
                    });
                    recordSet.push(row);
                });

                var fixRequest = {
                    addParameter: function (columnName, type, value) {
                        if (value) {
                            if (type == TYPES.VarChar || type == TYPES.NVarChar) {
                                request.addParameter(columnName, type, utf8.encode(value));
                            } else {
                                request.addParameter(columnName, type, value);
                            }
                        }
                    }
                };

                createParams(fixRequest, TYPES);

                //createParams(request, TYPES);

                //shouldn't have to do this, but it's crashing the app
                try {
                    if (spOrSql === 'sp') {
                        connection.callProcedure(request);
                    } else {
                        connection.execSql(request);
                    }
                } catch (ex) {
                    $log.log(ex);
                    deferred.reject(ex);
                }
            }
        });
        return deferred.promise;
    }

    function execSql(sql, createParams) {
        return exec(sql, createParams, 'sql');
    }

    function execSp(sp, createParams) {
        return exec(sp, createParams, 'sp');
    }

    return {
        execSql: execSql,
        execSp: execSp
    };
});
