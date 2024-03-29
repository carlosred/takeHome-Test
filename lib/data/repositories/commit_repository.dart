import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:takehometest/Utils/contants.dart';
import 'package:takehometest/models/commit.dart';

class CommitRepository {
  final http.Client httpClient;

  CommitRepository({required this.httpClient});

  Future<List<Commit>?> getCommits() async {
    List<Commit>? commits;

    try {
      var url = Uri.parse(Contants.commitUrl);

      var response = await httpClient.get(
        url,
      );

      var res = jsonDecode(utf8.decode(response.bodyBytes));
      if (response.statusCode == 200) {
        commits = List.from(res).map((e) => Commit.fromJson(e)).toList();
      }
    } catch (e) {
      commits = null;
    }

    return commits;
  }
}
