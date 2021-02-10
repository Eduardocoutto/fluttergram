import 'dart:async';

import 'package:fluttergram/app/modules/home/domain/entities/post.dart';

import 'package:flutter_modular/flutter_modular.dart';

import 'post_datasource.dart';

part 'post_datasource_impl.g.dart';

@Injectable(singleton: false)
class PostDataSourceFirebase implements PostDataSource {
  PostDataSourceFirebase(
      //this.mainStore,
      );

  // final Firestore firestore;

  // @override
  // Future<PaymentOperation> createPaymentOperation(
  //     int commandId, PaymentOperation paymentOperation) async {
  //   var send = json.encode(paymentOperation.toJson());
  //   String token = await mainStore.authStore.getToken();

  //   String urlPostOperation =
  //       apiBaseUrl + "/command/" + commandId.toString() + "/payment";

  //   var response = await http.post(urlPostOperation,
  //       headers: {
  //         "Content-Type": "application/json",
  //         'Accept': 'application/json',
  //         HttpHeaders.authorizationHeader: 'Bearer $token'
  //       },
  //       body: send);

  //   if (response.statusCode == 201) {
  //     // If server returns an OK response, parse the JSON.
  //     return PaymentOperation.fromJson(json.decode(response.body));
  //   } else {
  //     // If that response was not OK, throw an error.
  //     var error = json.decode(response.body);
  //     throw Exception(
  //       error['message'],
  //     );
  //   }
  // }

  @override
  Stream<List<PostModel>> getPosts() {
    // TODO: implement getPosts
    throw UnimplementedError();
  }
}
