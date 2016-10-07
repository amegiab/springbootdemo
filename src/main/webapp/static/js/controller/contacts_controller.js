'use strict';

angular.module('ContactsAdmApp').controller('ContactsController', ['$scope', 'ContactsService', function($scope, ContactsService) {
    var self = this;
    self.contact={id:null,firstName:'',lastName:'',address:'',phoneNumber:'',email:''};
    self.contacts=[];

    self.submit = submit;
    self.edit = edit;
    self.remove = remove;
    self.reset = reset;


    fetchAllContacts();

    function fetchAllContacts(){
    	ContactsService.fetchAllContacts()
            .then(
            function(d) {
                self.contacts = d;
            },
            function(errResponse){
                console.error('Error recuperando Contacts');
            }
        );
    }

    function createContact(contact){
    	ContactsService.createContact(contact)
            .then(
            fetchAllContacts,
            function(errResponse){
                console.error('Error creando Contact');
            }
        );
    }

    function updateContact(contact, id){
    	ContactsService.updateContact(contact, id)
            .then(
            fetchAllContacts,
            function(errResponse){
                console.error('Error actualizando Contact');
            }
        );
    }

    function deleteContact(id){
    	ContactsService.deleteContact(id)
            .then(
            fetchAllContacts,
            function(errResponse){
                console.error('Error borrando Contact');
            }
        );
    }

    function submit() {
        if(self.contact.id===null){
            console.log('Grabando nuevo Contact', self.contact);
            createContact(self.contact);
        }else{
            updateContact(self.contact, self.contact.id);
            console.log('Contact actualizado con id ', self.contact.id);
        }
        reset();
    }

    function edit(id){
        console.log('id a editar', id);
        for(var i = 0; i < self.contacts.length; i++){
            if(self.contacts[i].id === id) {
                self.contact = angular.copy(self.contacts[i]);
                break;
            }
        }
    }

    function remove(id){
        console.log('id a borrar', id);
        if(self.contact.id === id) {//clean form if the user to be deleted is shown there.
            reset();
        }
        deleteContact(id);
    }


    function reset(){
        self.contact = {id:null,firstName:'',lastName:'',address:'',phoneNumber:'',email:''};
        $scope.myForm.$setPristine(); //reset Form
    }

}]);
