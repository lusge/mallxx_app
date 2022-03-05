import '/app/models/response_model.dart';

import '/app/models/address_model.dart';

import '../../../providers/base_provider.dart';

class AddressProvider extends BaseProvider {
  static const String addressListUrl = "/member/address/list";
  static const String setDefaultUrl = "/member/address/default";
  static const String deleteAddressUrl = "/member/address/delete";
  static const String addAddressUrl = "/member/address/add";
  static const String updateAddressUrl = "/member/address/update";
  @override
  void onInit() {
    super.onInit();
  }

  Future<AddressList> getAddressList() async {
    final response = await get(addressListUrl);
    return AddressList.fromJson(response.body);
  }

  Future<ResponseData> setDefaultStatus(int id) async {
    final response = await post(setDefaultUrl, {"id": id});

    return ResponseData.fromJson(response.body);
  }

  Future<ResponseData> deleteAddress(int id) async {
    final response = await post(deleteAddressUrl, {"id": id});

    return ResponseData.fromJson(response.body);
  }

  Future<ResponseData> addAddrss(Address address) async {
    final response = await post(addAddressUrl, address.toJson());
    return ResponseData.fromJson(response.body);
  }

  Future<ResponseData> updateAddress(Address address) async {
    final response = await post(updateAddressUrl, address.toJson());
    return ResponseData.fromJson(response.body);
  }
}
