// import 'dart:async';
// bool _saving = false;
// void _submit() {
//     print('submit called...');

//     setState(() {
//       _saving = true;
//     });

//     //Simulate a service call
//     print('submitting to backend...');
//     new Future.delayed(new Duration(seconds: 4), () {
//       setState(() {
//         _saving = false;
//       });
//     });
//   }
//   if (_saving) {
//       var modal = new Stack(
//         children: [
//           new Opacity(
//             opacity: 0.3,
//             child: const ModalBarrier(dismissible: false, color: Colors.grey),
//           ),
//           new Center(
//             child: new CircularProgressIndicator(),
//           ),
//         ],
//       );
//       l.add(modal);
//     }