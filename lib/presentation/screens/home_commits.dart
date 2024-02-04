import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:takehometest/Utils/Contants.dart';
import 'package:takehometest/data/controllers/commit_controller.dart';
import 'package:takehometest/presentation/screens/commit_detail.dart';

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
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('takeHome-Test'),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        width: width,
        height: height,
        child: homeCommitController.when(
          data: (data) {
            if (data != null) {
              return RefreshIndicator(
                onRefresh: () =>
                    ref.read(commitControllerProvider.notifier).getCommitList(),
                child: ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: SizedBox(
                          width: width,
                          height: height * 0.25,
                          child: Theme(
                            data: ThemeData(
                              cardColor: Contants.cardColor,
                            ),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => CommitDetailPage(
                                      urlCommit: data[index].commit!.url!,
                                    ),
                                  ),
                                );
                              },
                              child: CommitCard(
                                commit: data[index],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => const SizedBox(
                          height: 20,
                        ),
                    itemCount: data.length),
              );
            } else {
              return const ErrorCommitWidget(
                message: "Error: The repository don't exist",
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
