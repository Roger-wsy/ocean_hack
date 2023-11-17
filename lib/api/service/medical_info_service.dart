// import 'package:mobile_frontend/api/dio_client.dart';
// import 'package:mobile_frontend/api/model/response.dart';

// class MedicalInfoService {
//   static DioClient dio = DioClient(port: '8080');

//   static Future<Response> createMedicalInfo({
//     String? name,
//     String? gender,
//     int? age,
//     double? weight,
//     double? height,
//     double? bmi,
//     int? systolicBloodPressure,
//     int? diastolicBloodPressure,
//     List<String>? allergyList,
//     bool? isVegeterian,
//     bool? isSmoker,
//     bool? isAlcoholicDrinker,
//   }) async {
//     return Response.fromJson(
//       await dio.post('/api/mobile/medicalInfo/create', data: {
//         'name': name,
//         'gender': gender,
//         'age': age,
//         'weight': weight,
//         'height': height,
//         'bmi': bmi,
//         'systolicBloodPressure': systolicBloodPressure,
//         'diastolicBloodPressure': diastolicBloodPressure,
//         'allergyList': allergyList,
//         'isVegeterian': isVegeterian,
//         'isSmoker': isSmoker,
//         'isAlcoholicDrinker': isAlcoholicDrinker,
//       }),
//     );
//   }

//   static Future<Response> loadMedicalInfo({
//     search,
//     currentIndex,
//     sizePerPage = 5,
//   }) async {
//     final response = await dio.post('/api/mobile/medicalInfo/list', data: {
//       'search': search ?? '',
//       'currentIndex': currentIndex,
//       'sizePerPage': sizePerPage,
//     });

//     return Response.fromJson(response);
//   }

//   static Future<Response> updateMedicalInfo({
//     String? userId,
//     required Map<String, dynamic> medicalInfoUpdateList,
//   }) async {
//     return Response.fromJson(
//       await dio.post('/api/mobile/medicalInfo/update', data: {
//         'patientId': userId,
//         'medicalInfoUpdateList': medicalInfoUpdateList,
//       }),
//     );
//   }
// }
