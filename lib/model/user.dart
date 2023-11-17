class AuthUser {
  String? sId;
  String? firstName;
  String? lastName;
  String? ic;
  String? remarks;
  String? email;
  String? mobile;
  String? address;
  int? status;
  String? healthStatus;
  List<String>? roles;
  int? lastLoginTime;
  String? token;
  List<Departments>? departments;
  List<DepartmentDetails>? departmentDetails;
  List<String>? api;

  AuthUser(
      {sId,
      firstName,
      lastName,
      ic,
      remarks,
      email,
      mobile,
      address,
      status,
      healthStatus,
      roles,
      lastLoginTime,
      token,
      departments,
      departmentDetails,
      api});

  AuthUser.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    ic = json['ic'];
    remarks = json['remarks'];
    email = json['email'];
    mobile = json['mobile'];
    address = json['address'];
    status = json['status'];
    healthStatus = json['healthStatus'];
    roles = json['roles']?.cast<String>() ?? [];
    lastLoginTime = json['lastLoginTime'];
    token = json['token'];
    if (json['departments'] != null) {
      departments = <Departments>[];
      json['departments'].forEach((v) {
        departments!.add(Departments.fromJson(v));
      });
    }
    if (json['departmentDetails'] != null) {
      departmentDetails = <DepartmentDetails>[];
      json['departmentDetails'].forEach((v) {
        departmentDetails!.add(DepartmentDetails.fromJson(v));
      });
    }
    api = json['api'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['ic'] = ic;
    data['remarks'] = remarks;
    data['email'] = email;
    data['mobile'] = mobile;
    data['address'] = address;
    data['status'] = status;
    data['healthStatus'] = healthStatus;
    data['roles'] = roles;
    data['lastLoginTime'] = lastLoginTime;
    data['token'] = token;
    if (departments != null) {
      data['departments'] = departments!.map((v) => v.toJson()).toList();
    }
    if (departmentDetails != null) {
      data['departmentDetails'] =
          departmentDetails!.map((v) => v.toJson()).toList();
    }
    data['api'] = api;
    return data;
  }
}

class Departments {
  String? departmentId;
  List<Services>? services;

  Departments({departmentId, services});

  Departments.fromJson(Map<String, dynamic> json) {
    departmentId = json['departmentId'];
    if (json['services'] != null) {
      services = <Services>[];
      json['services'].forEach((v) {
        services!.add(Services.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['departmentId'] = departmentId;
    if (services != null) {
      data['services'] = services!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Services {
  String? service;
  List<String>? modules;

  Services({service, modules});

  Services.fromJson(Map<String, dynamic> json) {
    service = json['service'];
    modules = json['modules'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['service'] = service;
    data['modules'] = modules;
    return data;
  }
}

class DepartmentDetails {
  String? sId;
  List<Services>? services;
  int? createDate;
  String? createBy;
  int? modifyDate;
  String? modifyBy;
  String? name;
  String? description;

  DepartmentDetails(
      {sId,
      services,
      createDate,
      createBy,
      modifyDate,
      modifyBy,
      name,
      description});

  DepartmentDetails.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    if (json['services'] != null) {
      services = <Services>[];
      json['services'].forEach((v) {
        services!.add(Services.fromJson(v));
      });
    }
    createDate = json['createDate'];
    createBy = json['createBy'];
    modifyDate = json['modifyDate'];
    modifyBy = json['modifyBy'];
    name = json['name'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    if (services != null) {
      data['services'] = services!.map((v) => v.toJson()).toList();
    }
    data['createDate'] = createDate;
    data['createBy'] = createBy;
    data['modifyDate'] = modifyDate;
    data['modifyBy'] = modifyBy;
    data['name'] = name;
    data['description'] = description;
    return data;
  }
}
