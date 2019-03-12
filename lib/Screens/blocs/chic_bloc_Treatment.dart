import 'dart:async';
import 'Validator.dart';
import 'package:rxdart/rxdart.dart';

class TreatmentBloc extends Object with Validator {

   //chicken treatment form
    
    final _animalCodeController = BehaviorSubject<String>();
    final _medicinenameController = BehaviorSubject<String>();
    final _reasonController = BehaviorSubject<String>();
    final _quantityController = BehaviorSubject<String>();
    final _unitsController = BehaviorSubject<String>();
    final _startdateController = BehaviorSubject<String>();
    final _enddateController = BehaviorSubject<String>();
    final _doseperdayController = BehaviorSubject<String>();
    final _remarksController = BehaviorSubject<String>();

    //purchased medicine Details
    
    final _medicnameController = BehaviorSubject<String>();
    final _medictypeController = BehaviorSubject<String>();
    final _mediccompanyController = BehaviorSubject<String>();
    final _purchdateController = BehaviorSubject<String>();
    final _expirydateController = BehaviorSubject<String>();
    final _batchnumController = BehaviorSubject<String>();
    final _supplyController = BehaviorSubject<String>();
    final _quantitiController = BehaviorSubject<String>();
    final _unitController = BehaviorSubject<String>();
    final _unitpriceController = BehaviorSubject<String>();
    final _currenciesController = BehaviorSubject<String>();
    final _amountController = BehaviorSubject<String>();
   
    //Stream data to variable
   // Change Data (chicken treatment page)
  Function(String) get anicodeChanged => _animalCodeController.sink.add;
  Function(String) get medicChanged => _medicinenameController.sink.add;
  Function(String) get reasonChanged => _reasonController.sink.add;
  Function(String) get quantityChanged => _quantityController.sink.add;
  Function(String) get unitChanged => _unitsController.sink.add;
  Function(String) get startdateChanged => _startdateController.sink.add;
  Function(String) get enddateChanged => _enddateController.sink.add;
  Function(String) get dosezChanged => _doseperdayController.sink.add;
  Function(String) get remarksChanged => _remarksController.sink.add;

  // Change Data (purchase medicines Details page)
  Function(String) get medinameChanged => _medicnameController.sink.add;
  Function(String) get meditypeChanged => _medictypeController.sink.add;
  Function(String) get medicompanyChanged => _mediccompanyController.sink.add;
  Function(String) get pdChanged => _purchdateController.sink.add;
  Function(String) get edChanged => _expirydateController.sink.add;
  Function(String) get batchChanged => _batchnumController.sink.add;
  Function(String) get suplyChanged => _supplyController.sink.add;
  Function(String) get quantiChanged => _quantitiController.sink.add;
  Function(String) get unitsChanged => _unitController.sink.add;
  Function(String) get upChanged => _unitpriceController.sink.add;
  Function(String) get currencyChanged => _currenciesController.sink.add;
  Function(String) get amountChanged => _amountController.sink.add;
 
  //Stream data to variable
  //chicken tratment form
  Stream<String> get anicodeStream => _animalCodeController.stream.transform(notEmptyValidator);
  Stream<String> get medinameStream => _medicinenameController.stream.transform(notEmptyValidator);
  Stream<String> get reasonStream => _reasonController.stream.transform(notEmptyValidator);
  Stream<String> get quantityStream => _quantityController.stream.transform(notEmptyValidator);
  Stream<String> get unitsStream => _unitsController.stream.transform(notEmptyValidator);
  Stream<String> get startdateStream => _startdateController.stream.transform(notEmptyValidator);
  Stream<String> get enddateStream => _enddateController.stream.transform(notEmptyValidator);
  Stream<String> get dosesStream => _doseperdayController.stream.transform(notEmptyValidator);
  Stream<String> get remarksStream => _remarksController.stream.transform(notEmptyValidator);

  //purchased details of medicines
  Stream<String> get medicnameStream => _medicnameController.stream.transform(notEmptyValidator);
  Stream<String> get medictypeStream => _medictypeController.stream.transform(notEmptyValidator);
  Stream<String> get mediccompStream => _mediccompanyController.stream.transform(notEmptyValidator);
  Stream<String> get pdStream => _purchdateController.stream.transform(notEmptyValidator);
  Stream<String> get edStream => _expirydateController.stream.transform(notEmptyValidator);
  Stream<String> get batchStream => _batchnumController.stream.transform(notEmptyValidator);
  Stream<String> get supplyStream => _supplyController.stream.transform(notEmptyValidator);
  Stream<String> get quantyStream => _quantitiController.stream.transform(notEmptyValidator);
  Stream<String> get unitStream => _unitController.stream.transform(notEmptyValidator);
  Stream<String> get unipriceStream => _unitpriceController.stream.transform(notEmptyValidator);
  Stream<String> get currencyStream => _currenciesController.stream.transform(validatedropDown);
  Stream<String> get amountStream => _amountController.stream.transform(notEmptyValidator);
  
  // Submit Buttons
  Stream<bool> get subtrtbtn => Observable.combineLatest9(
    anicodeStream, medinameStream, reasonStream, quantityStream, unitsStream, startdateStream, enddateStream, dosesStream,remarksStream,
     (acs,mn,rs,qs,us,sd,ed,dp,re) => true);

  Stream<bool> get submitdetail => Observable.combineLatest9(medicnameStream,medictypeStream,mediccompStream,batchStream,
  supplyStream,quantyStream,unitStream,currencyStream,amountStream,
  (ms,mt,mc,bs,ss,q,u,c,am) => true);

 submit()
  {
    // final animalcode = _animalCodeController.value;
    // final animalname = _nameController.value;
    // final animalstatus = _animalStatusController.value;
    
    // print('Animal Code : $animalcode');
    // print('Animal Name : $animalname');
    // print('Animal Status : $animalstatus');
   
  }


  dispose() {
      _animalCodeController.close();
      _medicinenameController.close();
      _reasonController.close();
      _quantityController.close();
      _unitsController.close();
      _startdateController.close();
      _enddateController.close();
      _doseperdayController.close();
      _remarksController.close();
      
      //----------------------//
     
      _medicnameController.close();
      _medictypeController.close();
      _mediccompanyController.close();
      _startdateController.close();
      _expirydateController.close();
      _batchnumController.close();
      _supplyController.close();
      _purchdateController.close();
      _quantitiController.close();
      _unitController.close();
      _unitpriceController.close();
      _currenciesController.close();
      _amountController.close();
    
  }
}