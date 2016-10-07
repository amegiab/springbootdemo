'use strict';

angular.module('ContactsAdmApp').factory('ContactsService', ['$http', '$q', function($http, $q){

    var REST_SERVICE_URI = 'http://localhost:8080/springboot/contacts/';

    var factory = {
        fetchAllContacts: fetchAllContacts,
        createContact: createContact,
        updateContact:updateContact,
        deleteContact:deleteContact
    };

    return factory;

    function fetchAllContacts() {
        var deferred = $q.defer();
        $http.get(REST_SERVICE_URI)
            .then(
            function (response) {
                deferred.resolve(response.data);
            },
            function(errResponse){
                console.error('Error recuperando Contacts');
                deferred.reject(errResponse);
            }
        );
        return deferred.promise;
    }

    function createContact(contact) {
        var deferred = $q.defer();
        $http.post(REST_SERVICE_URI, contact)
            .then(
            function (response) {
                deferred.resolve(response.data);
            },
            function(errResponse){
                console.error('Error creando Contact');
                deferred.reject(errResponse);
            }
        );
        return deferred.promise;
    }


    function updateContact(contact, id) {
        var deferred = $q.defer();
        $http.put(REST_SERVICE_URI+id, contact)
            .then(
            function (response) {
                deferred.resolve(response.data);
            },
            function(errResponse){
                console.error('Error actualizando Contact');
                deferred.reject(errResponse);
            }
        );
        return deferred.promise;
    }

    function deleteContact(id) {
        var deferred = $q.defer();
        $http.delete(REST_SERVICE_URI+id)
            .then(
            function (response) {
                deferred.resolve(response.data);
            },
            function(errResponse){
                console.error('Error borrando Contact');
                deferred.reject(errResponse);
            }
        );
        return deferred.promise;
    }

}]);
