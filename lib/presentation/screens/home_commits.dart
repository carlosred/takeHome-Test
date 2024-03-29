import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:takehometest/Utils/contants.dart';
import 'package:takehometest/data/controllers/commit_controller.dart';

import '../widgets/appbar_widget.dart';
import '../widgets/commit_card.dart';
import '../widgets/error_widget.dart';

class HomeCommits extends ConsumerStatefulWidget {
  const HomeCommits({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeCommitsState();
}

class _HomeCommitsState extends ConsumerState<HomeCommits> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(commitControllerProvider.notifier).getCommitList();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;
    var height = MediaQuery.sizeOf(context).height;
    var homeCommitController = ref.watch(commitControllerProvider);
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(65),
        child: TakeHomeTestAppBar(title: Contants.appTitle),
      ),
      body: Container(
        height: height,
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        width: width,
        child: homeCommitController.when(
          data: (data) {
            if (data != null) {
              return RefreshIndicator(
                onRefresh: () =>
                    ref.read(commitControllerProvider.notifier).getCommitList(),
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return CommitCard(
                      commit: data[index],
                    );
                  },
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 20,
                  ),
                  itemCount: data.length,
                ),
              );
            } else {
              return ErrorCommitWidget(
                message: Contants.errorMessage,
              );
            }
          },
          error: (error, stackTrace) => ErrorCommitWidget(
            message: 'Error: $error',
          ),
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}
