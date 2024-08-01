import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:sazzon/feature/address/data/models/address_models.dart';

abstract class AddressApiDataSource {
  Future<void> PoshAddres(AddressModel addressModel);
  Future<List<AddressModel>> getAddress(String id);
  Future<void> updateAddress(AddressModel addressModel);
}

class AddressApiDataSourceImp implements AddressApiDataSource {
  final String _baseUrl = 'https://users.sazzon.site/api/v2/directions';
  final String _baseUrl2 = 'https://users.sazzon.site/api/v3/users';

  @override
  Future<List<AddressModel>> getAddress(id) async {
    var response = await http.get(
        Uri.parse('$_baseUrl2/$id/directions'));

    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      print(body);

      if (body != null) {
        List<dynamic> data = body;
        List<AddressModel> addresses = data
            .map<AddressModel>((address) => AddressModel.fromJson(address))
            .toList();
        return addresses;
      } else {
        throw Exception('Response body is empty');
      }
    } else {
      throw Exception('Failed to load addresses');
    }
  }

  @override
  Future<void> PoshAddres(AddressModel addressModel) async {
    final url = Uri.parse(_baseUrl);
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(addressModel.toJson()),
    );

    if (response.statusCode == 201) {
      // Handle success
      print('Address successfully added');
    } else {
      // Handle error
      throw Exception('Failed to add address');
    }
  }

  @override
  Future<void> updateAddress(AddressModel addressModel) {
    // TODO: implement updateAddress
    throw UnimplementedError();
  }
}
