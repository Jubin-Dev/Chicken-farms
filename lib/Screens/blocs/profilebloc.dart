import 'dart:async';
import 'Validator.dart';
import 'package:rxdart/rxdart.dart';

class ProfileBloc extends Object with Validator {

   //farm Profile
    final _farmNameController = BehaviorSubject<String>();
    final _farmAdressController = BehaviorSubject<String>();
    final _mobileController = BehaviorSubject<String>();
    final _alternumberController = BehaviorSubject<String>();
    final _lineidController = BehaviorSubject<String>();
    final _anyWebController = BehaviorSubject<String>();
    final _socialPageController = BehaviorSubject<String>();
    final _aboutusController = BehaviorSubject<String>();

    //chicken Details
    final _animalCodeController = BehaviorSubject<String>();
    final _nameController = BehaviorSubject<String>();
    final _symbolController = BehaviorSubject<String>();
    final _animalStatusController = BehaviorSubject<String>();
    final _dobController = BehaviorSubject<String>();
    final _genderController = BehaviorSubject<String>();
    final _breedController = BehaviorSubject<String>();
    final _sirecodeController = BehaviorSubject<String>();
    final _breederCodeController = BehaviorSubject<String>();
    final _talentsController = BehaviorSubject<String>();
    final _weightController = BehaviorSubject<String>();
    final _weightTypeController = BehaviorSubject<String>();
    final _fightRecordController = BehaviorSubject<String>();
    final _standerdPriceController = BehaviorSubject<String>();
    final _currencyController = BehaviorSubject<String>();
    final _remarksController = BehaviorSubject<String>();


    //Stream data to variable
   // Change Data (login page)
  Function(String) get farmNameChanged => _farmNameController.sink.add;
  Function(String) get farmAdressChanged => _farmAdressController.sink.add;
  Function(String) get mobileChanged => _mobileController.sink.add;
  Function(String) get alternumberChanged => _alternumberController.sink.add;
  Function(String) get lineIdChanged => _lineidController.sink.add;
  Function(String) get anyWebChanged => _anyWebController.sink.add;
  Function(String) get socialPageChanged => _socialPageController.sink.add;
  Function(String) get aboutusChanged => _aboutusController.sink.add;

  // Change Data (chicken Details page)
  Function(String) get animalCodeChanged => _animalCodeController.sink.add;
  Function(String) get animalNameChanged => _nameController.sink.add;
  Function(String) get symbolChanged => _symbolController.sink.add;
  Function(String) get animalStatusChanged => _animalStatusController.sink.add;
  Function(String) get dobChanged => _dobController.sink.add;
  Function(String) get genderChanged => _genderController.sink.add;
  Function(String) get breedChanged => _breedController.sink.add;
  Function(String) get sireCodeChanged => _sirecodeController.sink.add;
  Function(String) get breederCodeChanged => _breederCodeController.sink.add;
  Function(String) get talentsChanged => _talentsController.sink.add;
  Function(String) get weightChanged => _weightController.sink.add;
  Function(String) get weightTypeChanged => _weightTypeController.sink.add;
  Function(String) get fightingRecordsChanged => _fightRecordController.sink.add;
  Function(String) get standerdPriceChanged => _standerdPriceController.sink.add;
  Function(String) get currencyChanged => _currencyController.sink.add;
  Function(String) get remarksChanged => _remarksController.sink.add;


  //Stream data to variable
  //farm profile Screen
  Stream<String> get farmStream => _farmNameController.stream.transform(notEmptyValidator);
  Stream<String> get farmAdressStream => _farmAdressController.stream.transform(notEmptyValidator);
  Stream<String> get mobileStream => _mobileController.stream.transform(notEmptyValidator);
  Stream<String> get alternumberStream => _alternumberController.stream.transform(notEmptyValidator);
  Stream<String> get lineIdStream => _lineidController.stream.transform(notEmptyValidator);
  Stream<String> get anyWebStream => _anyWebController.stream.transform(notEmptyValidator);
  Stream<String> get socialPageStream => _socialPageController.stream.transform(notEmptyValidator);
  Stream<String> get aboutusStream => _aboutusController.stream.transform(notEmptyValidator);

  //chicken details screen
  Stream<String> get animalCodeStream => _animalCodeController.stream.transform(notEmptyValidator);
  Stream<String> get animalnameStream => _nameController.stream.transform(notEmptyValidator);
  Stream<String> get symbolStream => _symbolController.stream.transform(notEmptyValidator);
  Stream<String> get animalStatusStream => _animalStatusController.stream.transform(validatedropDown);
  Stream<String> get dobStream => _dobController.stream.transform(validatecalender);
  Stream<String> get genderWebStream => _genderController.stream.transform(validatedropDown);
  Stream<String> get breedPageStream => _breedController.stream.transform(validatedropDown);
  Stream<String> get sireCodeStream => _sirecodeController.stream.transform(notEmptyValidator);
  Stream<String> get breederCodeStream => _breederCodeController.stream.transform(notEmptyValidator);
  Stream<String> get talentsStream => _talentsController.stream.transform(notEmptyValidator);
  Stream<String> get weightStream => _weightController.stream.transform(notEmptyValidator);
  Stream<String> get weightTypeStream => _weightTypeController.stream.transform(validatedropDown);
  Stream<String> get fightingRecordStream => _fightRecordController.stream.transform(notEmptyValidator);
  Stream<String> get standardPriceStream => _standerdPriceController.stream.transform(notEmptyValidator);
  Stream<String> get currencyStream => _currencyController.stream.transform(validatedropDown);
  Stream<String> get remarksStream => _remarksController.stream.transform(notEmptyValidator);
 
  //Submit Button
  Stream<bool> get submitedbutton => Observable.combineLatest8(
    farmStream, farmAdressStream, mobileStream, alternumberStream, lineIdStream, anyWebStream, socialPageStream, aboutusStream,
     (fs,fa,ms,an,li,aw,sp,au) => true);

  Stream<bool> get submiteddetails => Observable.combineLatest9(animalCodeStream,
  animalStatusStream, dobStream, breedPageStream, sireCodeStream, breederCodeStream,
  weightStream,currencyStream, weightTypeStream,(ac,s,d,bp,sc,bc,ws,cs,wt) => true);

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
      _farmNameController.close();
      _farmAdressController.close();
      _mobileController.close();
      _alternumberController.close();
      _lineidController.close();
      _anyWebController.close();
      _socialPageController.close();
      _aboutusController.close();
      
      //----------------------//
      
      _animalCodeController.close();
      _nameController.close();
      _symbolController.close();
      _animalStatusController.close();
      _dobController.close();
      _genderController.close();
      _breedController.close();
      _sirecodeController.close();
      _breederCodeController.close();
      _talentsController.close();
      _weightController.close();
      _weightTypeController.close();
      _fightRecordController.close();
      _standerdPriceController.close();
      _currencyController.close();
      _remarksController.close();

  }
}