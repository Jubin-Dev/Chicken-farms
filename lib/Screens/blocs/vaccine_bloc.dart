import 'dart:async';
import 'Validator.dart';
import 'package:rxdart/rxdart.dart';

class VaccineBloc extends Object with Validator {

   //Vaccine Scheduled
    final _animalAgeController = BehaviorSubject<String>();
    final _vaccineNameController = BehaviorSubject<String>();
    final _vaccineTypeController = BehaviorSubject<String>();
    final _vaccineCompanyController = BehaviorSubject<String>();
    final _vaccineRemarkController = BehaviorSubject<String>();
   

    //Purchased Vaccine
    final _nameVaccineController = BehaviorSubject<String>();
    final _typeVaccineController = BehaviorSubject<String>();
    final _companyVaccineController = BehaviorSubject<String>();
    final _purchaseDateController = BehaviorSubject<String>();
    final _expDateController = BehaviorSubject<String>();
    final _batchNumController = BehaviorSubject<String>();
    final _supplybyController = BehaviorSubject<String>();
    final _quantityController = BehaviorSubject<String>();
    final _unitController = BehaviorSubject<String>();
    final _unitPriceController = BehaviorSubject<String>();
    final _currencysController = BehaviorSubject<String>();
    final _amountPurchasedController = BehaviorSubject<String>();
   
   //Give Vaccine
    final _aniCodeController = BehaviorSubject<String>();
    final _aniAgeController = BehaviorSubject<String>();
    final _vaccinesNamesController = BehaviorSubject<String>();
    final _vaccinesTypesController = BehaviorSubject<String>();
    final _vaccinesCompaniesController = BehaviorSubject<String>();
    final _vaccineMethodController = BehaviorSubject<String>();
    final _quantityyController = BehaviorSubject<String>();
    final _remarksGiveController = BehaviorSubject<String>();
    
    //Vaccine Due
    final _fromDateController = BehaviorSubject<String>();
    final _uptodateController = BehaviorSubject<String>();

   
   // Change Data (Vaccine Scheduled)
  Function(String) get animalAgeChanged => _animalAgeController.sink.add;
  Function(String) get vaccineNameChanged => _vaccineNameController.sink.add;
  Function(String) get vaccineTypeChanged => _vaccineTypeController.sink.add;
  Function(String) get vaccineCompanyChanged => _vaccineCompanyController.sink.add;
  Function(String) get vaccineRemarksChanged => _vaccineRemarkController.sink.add;
  

  // Change Data (Purchased Vaccine)
  Function(String) get nameVaccineChanged => _nameVaccineController.sink.add;
  Function(String) get typeVaccineChanged => _typeVaccineController.sink.add;
  Function(String) get companyVaccineChanged => _companyVaccineController.sink.add;
  Function(String) get pdateChanged => _purchaseDateController.sink.add;
  Function(String) get expDateChanged => _expDateController.sink.add;
  Function(String) get batchNumChanged => _batchNumController.sink.add;
  Function(String) get supplyByChanged => _supplybyController.sink.add;
  Function(String) get unitChanged => _unitController.sink.add;
  Function(String) get unitPriceChanged => _unitPriceController.sink.add;
  Function(String) get currenciesChanged => _currencysController.sink.add;
  Function(String) get pamountChanged => _amountPurchasedController.sink.add;
 
  //Change Data(Give Vaccine)
  Function(String) get animalsCodesChanged => _aniCodeController.sink.add;
  Function(String) get ageAnimalsChanged => _aniAgeController.sink.add;
  Function(String) get nameVaccinesChanged => _vaccinesNamesController.sink.add;
  Function(String) get typesVaccinesChanged =>  _vaccinesTypesController.sink.add;
  Function(String) get companyChanged => _vaccinesCompaniesController.sink.add;
  Function(String) get methodVaccineChanged => _vaccineMethodController.sink.add;
  Function(String) get quantityVaccineChanged => _quantityyController.sink.add;
  Function(String) get remarksChanged => _remarksGiveController.sink.add;

  //Vaccine Due
  Function(String) get fromDateChanged => _fromDateController.sink.add;
  Function(String) get todateChanged => _uptodateController.sink.add;



  //Stream data to variable
  //Vaccine Scheduled
  Stream<String> get animalAgeStream => _animalAgeController.stream.transform(notEmptyValidator);
  Stream<String> get vaccineNameStream => _vaccineNameController.stream.transform(notEmptyValidator);
  Stream<String> get vaccinesTypeStream => _vaccineTypeController.stream.transform(notEmptyValidator);
  Stream<String> get companyStream => _vaccineCompanyController.stream.transform(notEmptyValidator);
  Stream<String> get remarksStream => _vaccineRemarkController.stream.transform(notEmptyValidator);
 
  //purchased Vaccine
  Stream<String> get nameVaccineStream => _nameVaccineController.stream.transform(notEmptyValidator);
  Stream<String> get typeVaccineStream => _typeVaccineController.stream.transform(notEmptyValidator);
  Stream<String> get companyVaccineStream => _companyVaccineController.stream.transform(notEmptyValidator);
  Stream<String> get purchaseDateStream => _purchaseDateController.stream.transform(validatecalender);
  Stream<String> get expDateStream => _expDateController .stream.transform(notEmptyValidator);
  Stream<String> get batchNumStream => _batchNumController.stream.transform(notEmptyValidator);
  Stream<String> get supplyNumStream => _supplybyController.stream.transform(notEmptyValidator);
  Stream<String> get quantityStream => _quantityController.stream.transform(notEmptyValidator);
  Stream<String> get unitsStream => _unitController.stream.transform(notEmptyValidator);
  Stream<String> get unitPriceStream => _unitPriceController.stream.transform(notEmptyValidator);
  Stream<String> get currencyStream => _currencysController.stream.transform(validatedropDown);
  Stream<String> get amountPurStream => _amountPurchasedController.stream.transform(notEmptyValidator);
  

  //Give Vaccine
  Stream<String> get aniCodeStream => _aniCodeController.stream.transform(validatedropDown);
  Stream<String> get aniAgeStream => _aniAgeController.stream.transform(notEmptyValidator);
  Stream<String> get vaccinesNamesStream => _vaccinesNamesController.stream.transform(notEmptyValidator);
  Stream<String> get vaccineTypesStream => _vaccinesTypesController.stream.transform(notEmptyValidator);
  Stream<String> get vaccineCompanyStream => _vaccinesCompaniesController.stream.transform(notEmptyValidator);
  Stream<String> get vaccineMethodStream => _vaccineMethodController.stream.transform(notEmptyValidator);
  Stream<String> get quantityyStream => _quantityyController.stream.transform(notEmptyValidator);
  Stream<String> get remarksGiveStream => _remarksGiveController.stream.transform(notEmptyValidator);
  
  //Vaccine Due
  Stream<String> get fromDateStream =>  _fromDateController.stream.transform(validatecalender);
  Stream<String> get todateStream => _uptodateController.stream.transform(validatecalender);


  //Submit Button
  Stream<bool> get submitedbutton => Observable.combineLatest5(
    animalAgeStream, vaccineNameStream, vaccinesTypeStream, companyStream, remarksStream,
     (a,vs,vt,cs,rs) => true);

  Stream<bool> get submitedDetails => Observable.combineLatest5(nameVaccineStream,
  typeVaccineStream, quantityStream, purchaseDateStream, amountPurStream
  ,(vn,vt,q,pd,pa) => true);

  Stream<bool> get addingDetails => Observable.combineLatest5(aniAgeStream,
  vaccinesNamesStream, vaccineTypesStream, quantityyStream, vaccineMethodStream,
  (a,n,t,q,m,) => true);

 
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
      _animalAgeController.close();
      _vaccineNameController.close();
      _vaccineTypeController.close();
      _vaccineCompanyController.close();
      _vaccineRemarkController.close();
     
      
      //----------------------//
      
      _nameVaccineController.close();
      _typeVaccineController.close();
      _companyVaccineController.close();
      _purchaseDateController.close();
      _expDateController.close();
      _batchNumController.close();
      _supplybyController.close();
      _quantityController.close();
      _unitController.close();
      _unitPriceController.close();
      _currencysController.close();
      _amountPurchasedController.close();

      //-----------------------------//
      _aniCodeController.close();
      _aniAgeController.close();
      _vaccinesNamesController.close();
      _vaccinesTypesController .close();
      _vaccinesCompaniesController.close();
      _vaccineMethodController.close();
      _quantityyController.close();
      _remarksGiveController.close();

      //-----------------------------//

      _fromDateController.close();
      _uptodateController.close();




  }
}