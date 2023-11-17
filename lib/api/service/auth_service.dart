
import 'package:ocean_hack/api/model/response.dart' as model;
import 'package:ocean_hack/api/dio_client.dart';

class LoginService {
  static final DioClient client = DioClient(port: '8080');

  static Future<model.Response> login(res) async {
    final response = await client.post(
      '/api/mobile/auth/login',
      data: res,
    );

    return model.Response.fromJson(response);
  }
}

// export async function verifyToken(db, res, token) {
//   let userObj = null;

//   try {
//     const ret = await aggregateToArray(db, "user", [
//       { $match: { token: token } },
//       {
//         $lookup: {
//           from: "role",
//           localField: "roles",
//           foreignField: "_id",
//           as: "rolesObj",
//         },
//       },
//       {
//         $lookup: {
//           from: "department",
//           localField: "departments",
//           foreignField: "_id",
//           as: "departmentsObj",
//         },
//       },
//     ]);

//     if (ret && ret.length) {
//       userObj = ret[0];
//     } else {
//       return null;
//     }
//   } catch (error) {
//     return null;
//   }

//   userObj.api = [];

//   if ("rolesObj" in userObj && userObj.rolesObj.length) {
//     for (let i = 0; i < userObj.rolesObj.length; i++) {
//       for (let j = 0; j < userObj.rolesObj[i].api.length; j++) {
//         userObj.api.push(userObj.rolesObj[i].api[j]);
//       }
//     }
//   }

//   if ("departmentsObj" in userObj && userObj.departmentsObj.length) {
//     for (let i = 0; i < userObj.departmentsObj.length; i++) {
//       for (let j = 0; j < userObj.departmentsObj[i].api.length; j++) {
//         userObj.api.push(userObj.departmentsObj[i].api[j]);
//       }
//     }
//   }

//   delete userObj.rolesObj;
//   delete userObj.departmentsObj;

//   const update = {
//     lastLoginTime: new Date().getTime(),
//   };
//   await db.collection("user").findOneAndUpdate(
//     {
//       token: { $in: [token] },
//     },
//     { $set: update }
//   );

//   return userObj;
// }

// export async function verifyPermission(db, res, url, userData) {
//   try {
//     if (userData.api.length) {
//       let arr = [];
//       for (var i = 0; i < userData.api.length; i++) {
//         arr.push(new mongoose.Types.ObjectId(userData.api[i]));
//       }

//       const ret = await db
//         .collection("api")
//         .findOne({ path: url, _id: { $in: arr } });

//       if (ret !== null) {
//         return 0;
//       } else {
//         return -1;
//       }
//     } else {
//       return -1;
//     }
//   } catch (error) {
//     HTTPRESPONSE.httpResponseBadRequest(res);
//   }
//   return 0;
// }
