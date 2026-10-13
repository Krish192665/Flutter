import 'package:flutter/foundation.dart';

/// Supplier Profile Data Model & Global State Store
class SupplierProfileData {
  String fullName;
  String email;
  String phoneNumber;
  String companyName;

  SupplierProfileData({
    this.fullName = 'Georgia Alfaro',
    this.email = 'abc@gmail.com',
    this.phoneNumber = '1234567890',
    this.companyName = 'Excel Machinery pvt.ltd',
  });
}

class SupplierDataStore {
  static final ValueNotifier<SupplierProfileData> current =
      ValueNotifier<SupplierProfileData>(SupplierProfileData());

  static void update({
    String? fullName,
    String? email,
    String? phoneNumber,
    String? companyName,
  }) {
    final prev = current.value;
    current.value = SupplierProfileData(
      fullName: fullName ?? prev.fullName,
      email: email ?? prev.email,
      phoneNumber: phoneNumber ?? prev.phoneNumber,
      companyName: companyName ?? prev.companyName,
    );
  }
}

/// Business Profile Data Model & Global State Store
class BusinessProfileData {
  String workshopName;
  String ownerName;
  String email;
  String phone;
  Set<String> machineCapabilities;

  BusinessProfileData({
    this.workshopName = 'Excel Machinery pvt.ltd',
    this.ownerName = 'Dhruv Patel',
    this.email = 'excelmachinery@gmail.com',
    this.phone = '1234567890',
    Set<String>? machineCapabilities,
  }) : machineCapabilities = machineCapabilities ?? {'CNC', 'Lathe'};
}

class BusinessDataStore {
  static final ValueNotifier<BusinessProfileData> current =
      ValueNotifier<BusinessProfileData>(BusinessProfileData());

  static void update({
    String? workshopName,
    String? ownerName,
    String? email,
    String? phone,
    Set<String>? machineCapabilities,
  }) {
    final prev = current.value;
    current.value = BusinessProfileData(
      workshopName: workshopName ?? prev.workshopName,
      ownerName: ownerName ?? prev.ownerName,
      email: email ?? prev.email,
      phone: phone ?? prev.phone,
      machineCapabilities: machineCapabilities ?? Set.from(prev.machineCapabilities),
    );
  }
}
