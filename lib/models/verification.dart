class Verification {
  bool? verified;
  String? reason;

  Verification({
    this.verified,
    this.reason,
  });

  Verification.fromJson(Map<String, dynamic> json) {
    verified = json['verified'];
    reason = json['reason'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['verified'] = verified;
    data['reason'] = reason;

    return data;
  }
}
