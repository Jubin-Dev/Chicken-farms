import 'dart:async';
import 'Validator.dart';
import 'package:rxdart/rxdart.dart';

class ExpensesBloc extends Object with Validator {

   // master expanses form
    
    final _expanseCodeController = BehaviorSubject<String>();
    final _expansenameController = BehaviorSubject<String>();
    final _expansetypeController = BehaviorSubject<String>();
    final _serviceController = BehaviorSubject<String>();
    final _productController = BehaviorSubject<String>();
  
  // expenseEntry form

    final _expansedateController = BehaviorSubject<String>();
    final _expNameController = BehaviorSubject<String>();
    final _vendorNameController = BehaviorSubject<String>();
    final _vendorAdressController = BehaviorSubject<String>();
    final _amountController = BehaviorSubject<String>();
    final _currencyTypeController = BehaviorSubject<String>();
    final _remarksController = BehaviorSubject<String>();
    

    
  //Stream data to variable
   // Change Data (master exp page)
  Function(String) get expcodeChanged => _expanseCodeController.sink.add;
  Function(String) get expnameChanged => _expansenameController.sink.add;
  Function(String) get exptypeChanged => _expansetypeController.sink.add;
  Function(String) get serviceChanged => _serviceController.sink.add;
  Function(String) get productChanged => _productController.sink.add;
  // change Data (expense Entry page)
  Function(String) get expDateChanged => _expansedateController.sink.add;
  Function(String) get expenseNameChanged => _expansenameController.sink.add;
  Function(String) get vendorChanged => _expansetypeController.sink.add;
  Function(String) get vendorAdressChanged => _serviceController.sink.add;
  Function(String) get currencyChanged => _productController.sink.add;
  Function(String) get amountChanged => _expanseCodeController.sink.add;
  Function(String) get remarksChanged => _expansenameController.sink.add;
  
  //Stream data  transform to variable shows validators
  //master exp form
  Stream<String> get expcodeStream => _expanseCodeController.stream.transform(notEmptyValidator);
  Stream<String> get expnameStream => _expansenameController.stream.transform(notEmptyValidator);
  Stream<String> get exptypeStream => _expansetypeController.stream.transform(notEmptyValidator);
  Stream<String> get serviceStream => _serviceController.stream.transform(notEmptyValidator);
  Stream<String> get productStream => _productController.stream.transform(notEmptyValidator);

  //Expanse entry form
  Stream<String> get expDateStream => _expansedateController.stream.transform(validatecalender);
  Stream<String> get expNameStream => _expNameController.stream.transform(validatedropDown);
  Stream<String> get vendorStream => _vendorNameController.stream.transform(notEmptyValidator);
  Stream<String> get adressStream => _vendorAdressController.stream.transform(notEmptyValidator);
  Stream<String> get amountStream => _amountController.stream.transform(notEmptyValidator);
  Stream<String> get currencyStream => _currencyTypeController.stream.transform(notEmptyValidator);
  Stream<String> get remarksStream => _remarksController.stream.transform(notEmptyValidator);
  

  //add button
  Stream<bool> get addbtn => Observable.combineLatest5(expcodeStream, expnameStream, exptypeStream, serviceStream, productStream,(ec,en,et,s,p)=>true);

  Stream<bool> get submitbtn => Observable.combineLatest7(expDateStream, expNameStream, vendorStream, adressStream, amountStream,currencyStream,remarksStream,(ed,n,v,va,a,c,r) => true);

  
  
  dispose(){
    _expanseCodeController.close();
    _expansenameController.close();
    _expansetypeController.close();
    _serviceController.close();
    _productController.close();

    //---------------------//

    _expansedateController.close();
    _expNameController.close();
    _vendorNameController.close();
    _vendorAdressController.close();
    _amountController.close();
    _currencyTypeController.close();
    _remarksController.close();


  
  }
}