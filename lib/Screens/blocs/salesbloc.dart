import 'dart:async';
import 'Validator.dart';
import 'package:rxdart/rxdart.dart';

class SalesBloc extends Object with Validator {

   // price detail form
    
    final _sireCodeController = BehaviorSubject<String>();
    final _breedercodeController = BehaviorSubject<String>();
    final _priceController = BehaviorSubject<String>();
    final _currencytypeController = BehaviorSubject<String>();
    
  
  // sales Deatils form

    final _animCodeController = BehaviorSubject<String>();
    final _animAgeController = BehaviorSubject<String>();
    final _animTypeController = BehaviorSubject<String>();
    final _breedTypeController = BehaviorSubject<String>();
    final _codeSireController = BehaviorSubject<String>();
    final _codeBreederTypeController = BehaviorSubject<String>();
    final _talentsController = BehaviorSubject<String>();
    final _weightController = BehaviorSubject<String>();
    final _fightingController = BehaviorSubject<String>();
    final _standardPriceController = BehaviorSubject<String>();
    final _statusController = BehaviorSubject<String>();
    final _standardCheckboxController = BehaviorSubject<String>();
    
    

    
  //Stream data to variable
   // Change Data (price Details page)
  Function(String) get sirecodeChanged => _sireCodeController.sink.add;
  Function(String) get breedercodeChanged => _breedercodeController.sink.add;
  Function(String) get priceChanged => _priceController.sink.add;
  Function(String) get currencytypeChanged => _currencytypeController.sink.add;
  
  // change Data (Sale details page)
  Function(String) get animCodeChanged => _animCodeController.sink.add;
  Function(String) get animAgeChanged => _animAgeController.sink.add;
  Function(String) get animTypeChanged => _animTypeController.sink.add;
  Function(String) get breedTypeChanged => _breedTypeController.sink.add;
  Function(String) get codeSireChanged => _codeSireController.sink.add;
  Function(String) get codebreederChanged => _codeBreederTypeController.sink.add;
  Function(String) get talentsChanged => _talentsController.sink.add;
  Function(String) get weightChanged => _weightController.sink.add;
  Function(String) get fightingChanged => _fightingController.sink.add;
  Function(String) get spChanged => _standardPriceController.sink.add;
  Function(String) get spCheckboxChanged => _standardCheckboxController.sink.add;
  Function(String) get statusChanged => _statusController.sink.add;
  
  
  //Stream data  transform to variable shows validators
  //price details form
  Stream<String> get sirecodeStream => _sireCodeController.stream.transform(notEmptyValidator);
  Stream<String> get breedercodeStream => _breedercodeController.stream.transform(notEmptyValidator);
  Stream<String> get priceStream => _priceController.stream.transform(notEmptyValidator);
  Stream<String> get currencytypeStream => _currencytypeController.stream.transform(notEmptyValidator);
  

  //Sale details form
  Stream<String> get animCodeStream => _animCodeController.stream.transform(validatecalender);
  Stream<String> get animAgeStream => _animAgeController.stream.transform(validatedropDown);
  Stream<String> get animaTypeStream => _animTypeController.stream.transform(notEmptyValidator);
  Stream<String> get breedTypeStream => _breedTypeController.stream.transform(notEmptyValidator);
  Stream<String> get codeSireStream => _codeSireController.stream.transform(notEmptyValidator);
  Stream<String> get codeBreederStream => _codeBreederTypeController.stream.transform(notEmptyValidator);
  Stream<String> get talentsStream => _talentsController.stream.transform(notEmptyValidator);
  Stream<String> get weigthStream => _weightController.stream.transform(notEmptyValidator);
  Stream<String> get fightingStream => _fightingController.stream.transform(notEmptyValidator);
  Stream<String> get spStream => _standardPriceController.stream.transform(notEmptyValidator);
  Stream<String> get spCheckboxStream => _standardCheckboxController.stream.transform(notEmptyValidator);
  Stream<String> get statusStream => _statusController.stream.transform(notEmptyValidator);
  

  //add button
  Stream<bool> get addbtn => Observable.combineLatest4(sirecodeStream, breedercodeStream, priceStream, currencytypeStream,(sc,bc,p,ct)=>true);

  Stream<bool> get clickbtn => Observable.combineLatest6(animCodeStream, codeBreederStream, animaTypeStream, talentsStream, fightingStream,statusStream,(ac,cb,at,t,fr,s) => true);

  
  
  dispose(){
    _sireCodeController.close();
    _breedercodeController.close();
    _priceController.close();
    _currencytypeController.close();
   

    //---------------------//

    _animCodeController.close();
    _animAgeController.close();
    _animTypeController.close();
    _breedTypeController.close();
    _codeSireController.close();
    _codeBreederTypeController.close();
    _talentsController.close();
    _weightController.close();
    _fightingController.close();
    _standardPriceController.close();
    _standardCheckboxController.close();
    _statusController.close();

  
  }
}