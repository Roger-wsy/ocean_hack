// // ignore: depend_on_referenced_packages
// import 'package:bloc/bloc.dart';
// import 'package:equatable/equatable.dart';

// import '../../../api/model/response.dart';
// import '../constant.dart';

// part 'medical_info_event.dart';
// part 'medical_info_state.dart';

// class MedicalInfoBloc extends Bloc<MedicalInfoEvent, MedicalInfoState> {
//   MedicalInfoBloc() : super(MedicalInfoInitial()) {
//     on<CreateMedicalInfo>(_createMedicalInfo);
//     on<LoadMedicalInfo>(_loadMedicalInfo);
//     on<UpdateMedicalInfo>(_updateMedicalInfo);
//   }

//   void _createMedicalInfo(CreateMedicalInfo event, Emitter emit) async {
//     emit(CreateMedicalInfoLoading());
//     String name = event.data?[MedicalInfoFormConstant.name] ?? "";
//     String gender = event.data?[MedicalInfoFormConstant.gender] ?? "";
//     int age = int.parse(event.data?[MedicalInfoFormConstant.age] ?? "0");
//     double weight =
//         double.parse(event.data?[MedicalInfoFormConstant.weight] ?? "0");
//     double height =
//         double.parse(event.data?[MedicalInfoFormConstant.height] ?? "0");
//     double bmi = double.parse(event.data?[MedicalInfoFormConstant.bmi] ?? "0");
//     int systolicBloodPressure = int.parse(
//         event.data?[MedicalInfoFormConstant.systolicBloodPressure] ?? "0");
//     int diastolicBloodPressure = int.parse(
//         event.data?[MedicalInfoFormConstant.diastolicBloodPressure] ?? "0");
//     List<String> allergyList =
//         event.data?[MedicalInfoFormConstant.allergyList] ?? "";
//     bool isVegeterian =
//         event.data?[MedicalInfoFormConstant.isVegeterian] ?? false;
//     bool isSmoker = event.data?[MedicalInfoFormConstant.isSmoker] ?? false;
//     bool isAlcoholicDrinker =
//         event.data?[MedicalInfoFormConstant.isAlcoholicDrinker] ?? false;

//     Response response = await MedicalInfoService.createMedicalInfo(
//       name: name,
//       gender: gender,
//       age: age,
//       weight: weight,
//       height: height,
//       bmi: bmi,
//       systolicBloodPressure: systolicBloodPressure,
//       diastolicBloodPressure: diastolicBloodPressure,
//       allergyList: allergyList,
//       isVegeterian: isVegeterian,
//       isSmoker: isSmoker,
//       isAlcoholicDrinker: isAlcoholicDrinker,
//     );

//     if (response.success ?? false) {
//       emit(CreateMedicalInfoSuccess(message: response.data!['message']!));
//     } else {
//       emit(CreateMedicalInfoError(message: response.message!));
//     }
//   }

//   void _loadMedicalInfo(
//     LoadMedicalInfo event,
//     Emitter<MedicalInfoState> emit,
//   ) async {
//     emit(MedicalInfoListLoading());
//     Response response = await MedicalInfoService.loadMedicalInfo(
//       search: event.search,
//       currentIndex: event.currentIndex,
//     );
//     // ignore: unnecessary_null_comparison
//     if (response != null) {
//       // Check if the response is not null
//       if (response.success ?? false) {
//         if (response.data != null) {
//           // Check if the data is not null
//           MedicalInfo medicalInfo = MedicalInfo.fromJson(response.data!);
//           emit(MedicalInfoListLoaded(medicalInfoList: medicalInfo, bmi: 0));
//         } else {
//           emit(const MedicalInfoListError(message: "Response data is null."));
//         }
//       } else {
//         emit(MedicalInfoListError(
//             message: response.message ?? "Unknown error."));
//       }
//     } else {
//       emit(const MedicalInfoListError(message: "Response is null."));
//     }
//   }

//   void _updateMedicalInfo(
//     UpdateMedicalInfo event,
//     Emitter<MedicalInfoState> emit,
//   ) async {
//     emit(MedicalInfoListLoading());
//     Response response = await MedicalInfoService.updateMedicalInfo(
//       userId: event.userId,
//       medicalInfoUpdateList: event.medicalInfoUpdateList ?? {},
//     );

//     if (response.success ?? false) {
//       emit(UpdateMedicalInfoSuccess(message: response.data!['message']!));
//     } else {
//       emit(UpdateMedicalInfoError(message: response.message!));
//     }
//   }
// }
