import 'package:http/http.dart' as http;
import 'package:riverpod/riverpod.dart';
import 'package:takehometest/data/repositories/commit_repository.dart';

var commitRepositoryProvider = Provider<CommitRepository>(
  (ref) => CommitRepository(
    httpClient: http.Client(),
  ),
);
