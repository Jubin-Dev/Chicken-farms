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

  //Stream data to variable
  //farm profile Screen
  Stream<String> get farmStream => _farmNameController.stream.transform(farmNameValidator);
  Stream<String> get farmAdressStream => _farmAdressController.stream.transform(farmAdressValidator);
  Stream<String> get mobileStreem => _mobileController.stream.transform(mobileValidator);
  Stream<String> get alternumberStream => _alternumberController.stream.transform(alternatemobileValidator);
  Stream<String> get lineIdStream => _lineidController.stream.transform(lineIdValidator);
  Stream<String> get anyWebStream => _anyWebController.stream.transform(anyWebValidator);
  Stream<String> get socialPageStream => _socialPageController.stream.transform(socialValidator);
  Stream<String> get aboutusStream => _aboutusController.stream.transform(aboutUsValidator);
  //Submit Button
  Stream<bool> get submitbutton => Observable.combineLatest8(
    farmStream, farmAdressStream, mobileStreem, alternumberStream, lineIdStream, anyWebStream, socialPageStream, aboutusStream,
     (n,a,m,an,l,w,s,u) => true);


  void dispose() {
      _farmNameController?.close();
      _farmAdressController?.close();
      _mobileController?.close();
      _alternumberController?.close();
      _lineidController?.close();
      _anyWebController?.close();
      _socialPageController?.close();
      _aboutusController?.close();
  }
}