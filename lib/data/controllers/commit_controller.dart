import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:takehometest/data/repositories/commit_repository.dart';
import 'package:takehometest/models/commit.dart';
import 'package:takehometest/providers/providers_core.dart';

part 'commit_controller.g.dart';

@riverpod
class CommitController extends _$CommitController {
  @override
  Future<List<Commit>?> build() async {
    return null;
  }

  Future<void> getCommitList() async {
    state = const AsyncLoading();
    try {
      var commitList = await ref.read(commitRepositoryProvider).getCommits();

      state = AsyncData(commitList);
    } catch (error, stack) {
      state = AsyncError(error, stack);
    }
  }
}
