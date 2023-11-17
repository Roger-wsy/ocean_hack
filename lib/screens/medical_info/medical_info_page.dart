// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_form_builder/flutter_form_builder.dart';
// import 'package:form_builder_validators/form_builder_validators.dart';
// import 'package:mobile_frontend/components/_index.dart';
// import 'package:mobile_frontend/screens/auth/login/bloc/auth_bloc.dart';
// import 'package:mobile_frontend/screens/medical_info/bloc/medical_info_bloc.dart';
// import 'package:mobile_frontend/screens/medical_info/constant.dart';
// import '../../constant/constant.dart';
// import '../../model/medical_info.dart';

// class MedicalInfoPage extends StatelessWidget {
//   const MedicalInfoPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const MedicalInfoWidget();
//   }
// }

// class MedicalInfoWidget extends StatefulWidget {
//   const MedicalInfoWidget({super.key});

//   @override
//   State<MedicalInfoWidget> createState() => _MedicalInfoWidgetState();
// }

// class _MedicalInfoWidgetState extends State<MedicalInfoWidget> {
//   @override
//   void initState() {
//     super.initState();
//     BlocProvider.of<MedicalInfoBloc>(context).add(
//       const LoadMedicalInfo(),
//     );
//   }

//   final _formKey = GlobalKey<FormBuilderState>();
//   bool isMedicalInfoLoaded = false;
//   MedicalInfo medicalInfoList = MedicalInfo();
//   double _weight = 0.0;
//   double _height = 0.0;
//   bool changed = false;
//   bool _isVegeterianChanged = false;
//   bool _isSmokerChanged = false;
//   bool _isAlcoholicDrinkerChanged = false;
//   bool isVegeterian = false;
//   bool isSmoker = false;
//   bool isAlcoholicDrinker = false;
//   double _bmi = 0.0;
//   String selectedGenderValue = 'male';
//   List<String> allergyList = [];

//   double _calculateBMIValue(double weight, double height) {
//     if (weight > 0 && height > 0) {
//       return weight / ((height / 100) * (height / 100));
//     } else {
//       return 0;
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BlocListener<MedicalInfoBloc, MedicalInfoState>(
//       listener: (context, state) {
//         if (state is MedicalInfoListError) {
//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(
//               content: EhpText(
//                 state.message,
//                 color: Colors.white,
//               ),
//               backgroundColor: Colors.red,
//             ),
//           );
//         }
//         if (state is MedicalInfoListLoaded) {
//           setState(() {
//             medicalInfoList = state.medicalInfoList;
//             isMedicalInfoLoaded =
//                 true; // Set the flag to true when data is loaded
//           });
//         }
//         if (state is UpdateMedicalInfoSuccess) {
//           showDialog(
//             context: context,
//             barrierDismissible: false,
//             builder: (_) => EhpMessageDialog(
//               title: 'Success',
//               content: state.message,
//               onTap: () {
//                 Navigator.of(context).pop();
//               },
//             ),
//           );
//         }
//       },
//       child: Builder(
//         builder: (context) {
//           if (!isMedicalInfoLoaded) {
//             // Render a loading indicator while waiting for data
//             return Container(
//               color: Colors.white,
//               child: const Center(
//                 child: CircularProgressIndicator(),
//               ),
//             );
//           } else {
//             _weight =
//                 double.tryParse(medicalInfoList.weight.toString()) ?? _weight;
//             _height =
//                 double.tryParse(medicalInfoList.height.toString()) ?? _height;
//             isVegeterian = !_isVegeterianChanged
//                 ? medicalInfoList.isVegeterian ?? isVegeterian
//                 : isVegeterian;
//             isSmoker = !_isSmokerChanged
//                 ? medicalInfoList.isSmoker ?? isSmoker
//                 : isSmoker;
//             isAlcoholicDrinker = !_isAlcoholicDrinkerChanged
//                 ? medicalInfoList.isAlcoholicDrinker ?? isAlcoholicDrinker
//                 : isAlcoholicDrinker;
//             allergyList = medicalInfoList.allergyList ?? allergyList;
//             _bmi = !changed
//                 ? double.tryParse(medicalInfoList.bmi.toString()) ?? _bmi
//                 : _bmi;
//             selectedGenderValue = !changed
//                 ? medicalInfoList.gender ?? selectedGenderValue
//                 : selectedGenderValue;
//             return GestureDetector(
//               onTap: () {
//                 FocusScope.of(context).unfocus();
//               },
//               child: Scaffold(
//                 body: CustomScrollView(
//                   slivers: [
//                     EhpSliverAppBar(
//                       appBarTitle: 'Medical Info',
//                     ),
//                     SliverToBoxAdapter(
//                       child: Padding(
//                         padding: EhpPadding.h8,
//                         child: FormBuilder(
//                           key: _formKey,
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               EhpTextFieldTitle(
//                                 onChanged: (_) {},
//                                 name: MedicalInfoFormConstant.name,
//                                 titleName: 'Name',
//                                 initialValue: medicalInfoList.name?.toString(),
//                                 placeHolder: 'Please enter your full name',
//                                 keyboardType: TextInputType.number,
//                                 validator: FormBuilderValidators.required(),
//                               ),
//                               EhpDropDownTitle(
//                                 titleName: 'Gender',
//                                 name: MedicalInfoFormConstant.gender,
//                                 initialValue: selectedGenderValue,
//                                 items: [
//                                   DropdownMenuItem(
//                                     value: 'male',
//                                     child: EhpText('Male'),
//                                   ),
//                                   DropdownMenuItem(
//                                     value: 'female',
//                                     child: EhpText('Female'),
//                                   ),
//                                   DropdownMenuItem(
//                                     value: 'preferedNotToSay',
//                                     child: EhpText('Preferred not to say'),
//                                   ),
//                                 ],
//                                 onChanged: (value) {
//                                   setState(() {
//                                     changed = true;
//                                     selectedGenderValue = value!;
//                                   });
//                                 },
//                               ),
//                               EhpTextFieldTitle(
//                                 onChanged: (_) {},
//                                 name: MedicalInfoFormConstant.age,
//                                 keyboardType: TextInputType.number,
//                                 titleName: 'Age',
//                                 initialValue: medicalInfoList.age?.toString(),
//                                 placeHolder: 'Tell us your current age',
//                                 validator: FormBuilderValidators.required(),
//                               ),
//                               EhpTextFieldTitle(
//                                 onChanged: (value) {
//                                   setState(() {
//                                     var weight =
//                                         double.tryParse(value) ?? _weight;
//                                     _weight = weight;
//                                     changed = true;
//                                     _bmi = _calculateBMIValue(_weight, _height);
//                                   });
//                                 },
//                                 name: MedicalInfoFormConstant.weight,
//                                 keyboardType: TextInputType.number,
//                                 titleName: 'Weight (kg)',
//                                 placeHolder: 'Weight in kg',
//                                 initialValue:
//                                     medicalInfoList.weight?.toString(),
//                                 validator: FormBuilderValidators.required(),
//                               ),
//                               EhpTextFieldTitle(
//                                 onChanged: (value) {
//                                   setState(() {
//                                     var height =
//                                         double.tryParse(value) ?? _height;
//                                     _height = height;
//                                     changed = true;
//                                     _bmi = _calculateBMIValue(_weight, _height);
//                                   });
//                                 },
//                                 name: MedicalInfoFormConstant.height,
//                                 titleName: 'Height (cm)',
//                                 placeHolder: 'Height in cm',
//                                 keyboardType: TextInputType.number,
//                                 initialValue:
//                                     medicalInfoList.height?.toString(),
//                                 validator: FormBuilderValidators.required(),
//                               ),
//                               if (_weight > 0 && _height > 0)
//                                 Padding(
//                                   padding:
//                                       const EdgeInsets.fromLTRB(18, 16, 16, 16),
//                                   child: Row(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.center,
//                                     mainAxisAlignment:
//                                         MainAxisAlignment.spaceBetween,
//                                     children: [
//                                       EhpText(
//                                         'BMI: ${_bmi.toStringAsFixed(2)}',
//                                         textStyle: EhpTextStyle.b2,
//                                       ),
//                                       Container(
//                                         height: 35,
//                                         decoration: BoxDecoration(
//                                           color: _bmi < 18.5
//                                               ? Colors.red
//                                               : 18.5 <= _bmi && _bmi < 25
//                                                   ? Colors.green
//                                                   : 25 <= _bmi && _bmi < 30
//                                                       ? Colors.yellow
//                                                       : 30 <= _bmi && _bmi < 35
//                                                           ? Colors.yellow
//                                                           : Colors.red,
//                                           borderRadius:
//                                               BorderRadius.circular(8),
//                                         ),
//                                         child: Center(
//                                           child: EhpText(
//                                             _bmi < 18.5
//                                                 ? 'Underweight'
//                                                 : 18.5 <= _bmi && _bmi < 25
//                                                     ? 'Normal Weight'
//                                                     : 25 <= _bmi && _bmi < 30
//                                                         ? 'Overweight'
//                                                         : 30 <= _bmi &&
//                                                                 _bmi < 35
//                                                             ? 'Obese (Level I)'
//                                                             : 'Obese (Level II)',
//                                             padding: EhpPadding.containerCenter,
//                                             textStyle: const TextStyle(
//                                               color: Colors.white,
//                                               fontSize: 14,
//                                               fontWeight: FontWeight.bold,
//                                             ),
//                                           ),
//                                         ),
//                                       )
//                                     ],
//                                   ),
//                                 ),
//                               Row(
//                                 children: [
//                                   Expanded(
//                                     flex: 1,
//                                     child: EhpTextFieldTitle(
//                                       onChanged: (_) {},
//                                       maxLength: 3,
//                                       name: MedicalInfoFormConstant
//                                           .systolicBloodPressure,
//                                       titleName: 'Systolic pressure',
//                                       placeHolder: 'Systolic pressure',
//                                       keyboardType: TextInputType.number,
//                                       initialValue: medicalInfoList
//                                           .systolicBloodPressure
//                                           ?.toString(),
//                                       validator:
//                                           FormBuilderValidators.required(),
//                                     ),
//                                   ),
//                                   Expanded(
//                                     flex: 1,
//                                     child: EhpTextFieldTitle(
//                                       onChanged: (_) {},
//                                       maxLength: 3,
//                                       name: MedicalInfoFormConstant
//                                           .diastolicBloodPressure,
//                                       titleName: 'Diastolic Pressure',
//                                       placeHolder: 'Diastolic Pressure',
//                                       keyboardType: TextInputType.number,
//                                       initialValue: medicalInfoList
//                                           .diastolicBloodPressure
//                                           ?.toString(),
//                                       validator:
//                                           FormBuilderValidators.required(),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               EhpSizedBox.h8,
//                               Padding(
//                                 padding: EhpPadding.h16,
//                                 child: EhpText(
//                                   "Allergy List",
//                                   textStyle: EhpTextStyle.b2,
//                                 ),
//                               ),
//                               ...List.generate(
//                                 allergyList.length,
//                                 (index) => Padding(
//                                   padding: EhpPadding.h16,
//                                   child: Row(
//                                     children: [
//                                       Expanded(
//                                         child: Row(
//                                           children: [
//                                             CircleAvatar(
//                                               backgroundColor: ehpPrimaryColor,
//                                               radius: 12,
//                                               child: EhpText(
//                                                 '${index + 1}',
//                                                 color: ehpSecondaryColor,
//                                                 fontSize: 14,
//                                                 fontWeight: FontWeight.bold,
//                                               ),
//                                             ),
//                                             EhpSizedBox.w8,
//                                             Expanded(
//                                               child: EhpText(
//                                                 allergyList[index],
//                                                 maxLines: 2,
//                                                 fontSize: 18,
//                                                 overflow: TextOverflow.ellipsis,
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                       TextButton(
//                                         style: ButtonStyle(
//                                           shape: MaterialStateProperty.all<
//                                                   RoundedRectangleBorder>(
//                                               RoundedRectangleBorder(
//                                             borderRadius:
//                                                 BorderRadius.circular(8),
//                                           )),
//                                           backgroundColor:
//                                               MaterialStateProperty.all<Color>(
//                                                   ehpPrimaryColor),
//                                         ),
//                                         onPressed: () {
//                                           setState(() {
//                                             allergyList.removeAt(index);
//                                           });
//                                         },
//                                         child: EhpText(
//                                           'Remove',
//                                           color: Colors.white,
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                               EhpTextFieldTitle(
//                                 onChanged: (_) {},
//                                 padding: EhpPadding.containerCenter4,
//                                 name: MedicalInfoFormConstant.allergyList,
//                                 suffixIcon: IconButton(
//                                   color: ehpPrimaryColor,
//                                   splashRadius: 0.1,
//                                   icon: const Icon(Icons.add),
//                                   onPressed: () {
//                                     var currentValue = _formKey
//                                         .currentState
//                                         ?.fields[
//                                             MedicalInfoFormConstant.allergyList]
//                                         ?.value
//                                         ?.toString();
//                                     setState(() {
//                                       if (currentValue != null &&
//                                           currentValue != '' &&
//                                           currentValue.isNotEmpty) {
//                                         allergyList.add(currentValue);
//                                       }
//                                       _formKey
//                                           .currentState
//                                           ?.fields[MedicalInfoFormConstant
//                                               .allergyList]
//                                           ?.didChange('');
//                                     });
//                                   },
//                                 ),
//                                 onSubmitted: (result) {
//                                   if (result != null &&
//                                       result != "" &&
//                                       result.isNotEmpty) {
//                                     setState(() {
//                                       allergyList.add(result);
//                                       _formKey
//                                           .currentState
//                                           ?.fields[MedicalInfoFormConstant
//                                               .allergyList]
//                                           ?.didChange('');
//                                     });
//                                   }
//                                 },
//                                 placeHolder: 'Please enter food/drug allergy',
//                               ),
//                               EhpSizedBox.h16,
//                               FormBuilderField(
//                                 name: MedicalInfoFormConstant.isVegeterian,
//                                 builder: (field) {
//                                   return EhpToggleSwitchTitle(
//                                     title: "Are you vegeterian?",
//                                     initialPosition: isVegeterian,
//                                     values: const ["Yes", "No"],
//                                     onToggleCallback: (value) {
//                                       _isVegeterianChanged = true;
//                                       isVegeterian = !isVegeterian;
//                                     },
//                                   );
//                                 },
//                               ),
//                               FormBuilderField(
//                                 name: MedicalInfoFormConstant.isSmoker,
//                                 builder: (field) {
//                                   return EhpToggleSwitchTitle(
//                                     title: "Are you a smoker?",
//                                     initialPosition: isSmoker,
//                                     values: const ["Yes", "No"],
//                                     onToggleCallback: (value) {
//                                       _isSmokerChanged = true;
//                                       isSmoker = !isSmoker;
//                                     },
//                                   );
//                                 },
//                               ),
//                               FormBuilderField(
//                                 name:
//                                     MedicalInfoFormConstant.isAlcoholicDrinker,
//                                 builder: (field) {
//                                   return EhpToggleSwitchTitle(
//                                     title: "Do you drink alcohol?",
//                                     initialPosition: isAlcoholicDrinker,
//                                     values: const ["Yes", "No"],
//                                     onToggleCallback: (value) {
//                                       _isAlcoholicDrinkerChanged = true;
//                                       isAlcoholicDrinker = !isAlcoholicDrinker;
//                                     },
//                                   );
//                                 },
//                               ),
//                               EhpSizedBox.h16,
//                               EhpSingleButton(
//                                 onPressed: () {
//                                   if (_formKey.currentState
//                                           ?.saveAndValidate() ??
//                                       false) {
//                                     var userId = (context.read<AuthBloc>().state
//                                             as AuthLoginSuccess)
//                                         .user
//                                         .sId;
//                                     var medicalInfoUpdateList =
//                                         Map<String, dynamic>.from(
//                                       _formKey.currentState?.value ??
//                                           {
//                                             MedicalInfoFormConstant.name: '',
//                                             MedicalInfoFormConstant.age: '',
//                                             MedicalInfoFormConstant.weight: '',
//                                             MedicalInfoFormConstant.height: '',
//                                             MedicalInfoFormConstant.gender: '',
//                                             MedicalInfoFormConstant
//                                                 .systolicBloodPressure: '',
//                                             MedicalInfoFormConstant
//                                                 .diastolicBloodPressure: '',
//                                           },
//                                     );
//                                     medicalInfoUpdateList[
//                                         MedicalInfoFormConstant
//                                             .allergyList] = allergyList;
//                                     medicalInfoUpdateList[
//                                             MedicalInfoFormConstant.bmi] =
//                                         _bmi.toStringAsFixed(2);
//                                     medicalInfoUpdateList[
//                                         MedicalInfoFormConstant
//                                             .isVegeterian] = isVegeterian;
//                                     medicalInfoUpdateList[
//                                             MedicalInfoFormConstant.isSmoker] =
//                                         isSmoker;
//                                     medicalInfoUpdateList[
//                                             MedicalInfoFormConstant
//                                                 .isAlcoholicDrinker] =
//                                         isAlcoholicDrinker;
//                                     context.read<MedicalInfoBloc>().add(
//                                           UpdateMedicalInfo(
//                                             userId: userId,
//                                             medicalInfoUpdateList:
//                                                 medicalInfoUpdateList,
//                                           ),
//                                         );
//                                   }
//                                 },
//                                 text: 'Submit',
//                               ),
//                               EhpSizedBox.h32,
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             );
//           }
//         },
//       ),
//     );
//   }
// }
