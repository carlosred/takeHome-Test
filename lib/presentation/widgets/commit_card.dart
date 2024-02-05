import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:takehometest/Utils/Contants.dart';

import '../../Utils/Utils.dart';
import '../../models/commit.dart';
import '../screens/commit_detail.dart';

class CommitCard extends StatelessWidget {
  const CommitCard({
    super.key,
    required this.commit,
  });

  final Commit commit;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;
    var height = MediaQuery.sizeOf(context).height;
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
                    urlCommit: commit.htmlUrl!,
                  ),
                ),
              );
            },
            child: InkWell(
              child: Card(
                  surfaceTintColor: Contants.cardColor,
                  color: Colors.white,
                  elevation: 3,
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
                                fit: BoxFit.fitHeight,
                                imageBuilder: (context, imageProvider) {
                                  return Container(
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: imageProvider,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  );
                                },
                                imageUrl: commit.committer!.avatarUrl!,
                                progressIndicatorBuilder:
                                    (context, url, downloadProgress) =>
                                        CircularProgressIndicator(
                                            value: downloadProgress.progress),
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              flex: 6,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 3,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(
                                      height: 20.0,
                                    ),
                                    Text(
                                      commit.commit!.message!,
                                      style: Contants.cardTittleTexStyle,
                                    ),
                                    const SizedBox(
                                      height: 5.0,
                                    ),
                                    Text(
                                        Utils.formatDate(
                                            commit.commit!.committer!.date!),
                                        style: Contants.cardSubtittleTexStyle),
                                    const SizedBox(
                                      height: 5.0,
                                    ),
                                    Text(commit.commit!.committer!.name!,
                                        style: Contants.cardSubtittleTexStyle)
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  )),
            ),
          ),
        ),
      ),
    );
  }
}
