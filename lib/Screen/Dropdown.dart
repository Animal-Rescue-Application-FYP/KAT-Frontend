// import 'package:flutter/material.dart';
// import 'genderList.dart';
//
// bool typeVisible = false;
// String dropDownValue;
//
// class DropDown extends StatefulWidget {
//   const DropDown({
//     Key key,
//   }) : super(key: key);
//
//   @override
//   _DropDownState createState() => _DropDownState();
// }
//
// class _DropDownState extends State<DropDown> {
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Container(
//             width: double.infinity,
//             decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(10),
//                 border: Border.all(
//                   color: Colors.blue[900],
//                 )),
//             child: Padding(
//               padding: const EdgeInsets.all(10.0),
//               child: DropdownButton(
//                   isExpanded: true,
//                   hint: Text('Select gender'),
//                   value: dropDownValue,
//                   items: gender.map((gender) {
//                     return DropdownMenuItem(
//                       child: new Text(gender),
//                       value: gender,
//                     );
//                   }).toList(),
//                   onChanged: (String newValue) {
//                     setState(() {
//                       dropDownValue = newValue;
//                       typeVisible = false;
//                     });
//                   }),
//             ),
//           ),
//           Visibility(
//             visible: typeVisible,
//             child: Text(
//               'Please select a gender',
//               style: TextStyle(color: Colors.red),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
// }
//
