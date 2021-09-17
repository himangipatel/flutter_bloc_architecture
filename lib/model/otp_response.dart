class OTPResponse {
 OTPResponseData? data;
 int? success;
 String? message;

  OTPResponse({this.data, this.success, this.message});

  OTPResponse.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new OTPResponseData.fromJson(json['data']) : null;
    success = json['success'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data?.toJson();
    }
    data['success'] = this.success;
    data['message'] = this.message;
    return data;
  }
}

class OTPResponseData {
  String? otp;

  OTPResponseData({this.otp});

  OTPResponseData.fromJson(Map<String, dynamic> json) {
    otp = json['otp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['otp'] = this.otp;
    return data;
  }
}