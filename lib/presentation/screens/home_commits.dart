import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:takehometest/Utils/Contants.dart';
import 'package:takehometest/Utils/Utils.dart';
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
                        padding: const EdgeInsets.all(3.0),
                        child: SizedBox(
                          width: width,
                          height: height * 0.30,
                          child: Theme(
                            data: ThemeData(
                              cardColor: Contants.cardColor,
                            ),
                            child: Card(
                                surfaceTintColor: Contants.cardColor,
                                color: Colors.white,
                                elevation: 5,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                child: Column(
                                  children: [
                                    Expanded(
                                      flex: 8,
                                      child: Row(
                                        children: [
                                          Expanded(
                                            flex: 4,
                                            child: CachedNetworkImage(
                                              imageUrl: data[index]
                                                  .committer!
                                                  .avatarUrl!,
                                              progressIndicatorBuilder:
                                                  (context, url,
                                                          downloadProgress) =>
                                                      CircularProgressIndicator(
                                                          value:
                                                              downloadProgress
                                                                  .progress),
                                              errorWidget:
                                                  (context, url, error) =>
                                                      const Icon(Icons.error),
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Expanded(
                                            flex: 6,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                horizontal: 3,
                                              ),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  const SizedBox(
                                                    height: 20.0,
                                                  ),
                                                  Text(
                                                    data[index]
                                                        .commit!
                                                        .message!,
                                                    style: const TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 18.0,
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 5.0,
                                                  ),
                                                  Text(
                                                    Utils.formatDate(data[index]
                                                        .commit!
                                                        .committer!
                                                        .date!),
                                                  ),
                                                  const SizedBox(
                                                    height: 5.0,
                                                  ),
                                                  Text(
                                                    data[index]
                                                        .commit!
                                                        .committer!
                                                        .name!,
                                                    style: const TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 14.0,
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    const Expanded(flex: 1, child: SizedBox())
                                  ],
                                )),
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
