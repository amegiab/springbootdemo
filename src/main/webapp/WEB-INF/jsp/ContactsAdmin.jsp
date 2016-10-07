<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
  <head>  
    <title>Administración Contacts</title>  
    <style>
      .username.ng-valid {
          background-color: lightgreen;
      }
      .username.ng-dirty.ng-invalid-required {
          background-color: red;
      }
      .username.ng-dirty.ng-invalid-minlength {
          background-color: yellow;
      }

      .email.ng-valid {
          background-color: lightgreen;
      }
      .email.ng-dirty.ng-invalid-required {
          background-color: red;
      }
      .email.ng-dirty.ng-invalid-email {
          background-color: yellow;
      }

    </style>
     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">	 
     <link href="<c:url value='/static/css/app.css' />" rel="stylesheet"></link>
  </head>
  <body ng-app="ContactsAdmApp" class="ng-cloak">
      <div class="generic-container" ng-controller="ContactsController as ctrl">
          <div class="panel panel-default">
              <div class="panel-heading"><span class="lead">Alta Contacts</span></div>
              <div class="formcontainer">
                  <form ng-submit="ctrl.submit()" name="myForm" class="form-horizontal">
                      <input type="hidden" ng-model="ctrl.contact.id" />
                      <div class="row">
                          <div class="form-group col-md-12">
                              <label class="col-md-2 control-lable" for="file">First Name</label>
                              <div class="col-md-7">
                                  <input type="text" ng-model="ctrl.contact.firstName" name="uname" class="username form-control input-sm" placeholder="First Name" required ng-minlength="4"/>
                                  <div class="has-error" ng-show="myForm.$dirty">
                                      <span ng-show="myForm.uname.$error.required">Este campo es obligatorio</span>
                                      <span ng-show="myForm.uname.$error.minlength">Longitud máxima del campo 4</span>
                                      <span ng-show="myForm.uname.$invalid">El campo no es válido</span>
                                  </div>
                              </div>
                          </div>
                      </div>
                        
                      
                      <div class="row">
                          <div class="form-group col-md-12">
                              <label class="col-md-2 control-lable" for="file">Last Name</label>                              
							  <div class="col-md-7">
								<textarea ng-model="ctrl.contact.lastName" class="form-control input-sm" rows="2" placeholder="Last Name"></textarea>
							  </div>
                          </div>
                      </div>
					  
					  <div class="row">
                          <div class="form-group col-md-12">
                              <label class="col-md-2 control-lable" for="file">Address</label>                              
							  <div class="col-md-7">
								<textarea ng-model="ctrl.contact.address" class="form-control input-sm" rows="5" placeholder="Address"></textarea>
							  </div>
                          </div>
                      </div>
					  					  
					  
					  <div class="row">
                          <div class="form-group col-md-12">
                              <label class="col-md-2 control-lable" for="file">Phone Number</label>
                              <div class="col-md-7">
                                  <input type="text" ng-model="ctrl.contact.phoneNumber" class="form-control input-sm" placeholder="Phone Number"/>
                              </div>
                          </div>
                      </div>
					  
					  <div class="row">
                          <div class="form-group col-md-12">
                              <label class="col-md-2 control-lable" for="file">Email</label>
                              <div class="col-md-7">
                                  <input type="text" ng-model="ctrl.contact.email" class="form-control input-sm" placeholder="Email"/>
                              </div>
                          </div>
                      </div>					  					  


                      <div class="row">
                          <div class="form-actions floatRight">
                              <input type="submit"  value="{{!ctrl.contact.id ? 'Add' : 'Update'}}" class="btn btn-primary btn-sm" ng-disabled="myForm.$invalid">
                              <button type="button" ng-click="ctrl.reset()" class="btn btn-warning btn-sm" ng-disabled="myForm.$pristine">Borrar formulario</button>
                          </div>
                      </div>
                  </form>
              </div>
          </div>
          <div class="panel panel-default">
                <!-- Default panel contents -->
              <div class="panel-heading"><span class="lead">List of Contacts</span></div>
              <div class="tablecontainer">
                  <table class="table table-hover">
                      <thead>
                          <tr>
                              <th>ID.</th>
                              <th>FirstName</th>
                              <th>LastName</th>
                              <th>PhoneNumber</th>
                              <th>Email</th>
                              <th width="20%"></th>
                          </tr>
                      </thead>
                      <tbody>
                          <tr ng-repeat="u in ctrl.contacts | orderBy: 'FirstName'">
                              <td><span ng-bind="u.id"></span></td>
                              <td><span ng-bind="u.firstName"></span></td>
                              <td><span ng-bind="u.lastName"></span></td>
                              <td><span ng-bind="u.phoneNumber"></span></td>
                              <td><span ng-bind="u.email"></span></td>
                              <td>
                              <button type="button" ng-click="ctrl.edit(u.id)" class="btn btn-success custom-width">Editar</button>  <button type="button" ng-click="ctrl.remove(u.id)" class="btn btn-danger custom-width">Borrar</button>
                              </td>
                          </tr>
                      </tbody>
                  </table>
              </div>
          </div>
      </div>
      
      <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.4/angular.js"></script>
      <script src="<c:url value='/static/js/app.js' />"></script>
      <script src="<c:url value='/static/js/service/contacts_service.js' />"></script>
      <script src="<c:url value='/static/js/controller/contacts_controller.js' />"></script>
  </body>
</html>