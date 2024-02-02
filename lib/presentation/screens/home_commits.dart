import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:takehometest/data/controllers/commit_controller.dart';

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
      appBar: AppBar(
        title: const Text('takeHome-Test'),
        centerTitle: true,
      ),
      body: SizedBox(
        width: width,
        height: height,
        child: homeCommitController.when(
          data: (data) {
            if (data != null) {
              return ListView.separated(
                  itemBuilder: (context, index) {
                    return Text(
                      data[index].commit!.message!,
                      style: const TextStyle(
                        color: Colors.black,
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => const SizedBox(
                        height: 20,
                      ),
                  itemCount: data.length);
            } else {
              return const Center(
                child: Text(
                  "Error: The repository don't exist",
                ),
              );
            }
          },
          error: (error, stackTrace) => Center(
            child: Text(
              'Error:$error',
            ),
          ),
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}
