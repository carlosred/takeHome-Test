import 'author.dart';
import 'tree.dart';
import 'verification.dart';

class CommitDetail {
  Author? author;
  Author? committer;
  String? message;
  Tree? tree;
  String? url;
  int? commentCount;
  Verification? verification;

  CommitDetail(
      {this.author,
      this.committer,
      this.message,
      this.tree,
      this.url,
      this.commentCount,
      this.verification});

  CommitDetail.fromJson(Map<String, dynamic> json) {
    author = json['author'] != null ? Author.fromJson(json['author']) : null;
    committer =
        json['committer'] != null ? Author.fromJson(json['committer']) : null;
    message = json['message'];
    tree = json['tree'] != null ? Tree.fromJson(json['tree']) : null;
    url = json['url'];
    commentCount = json['comment_count'];
    verification = json['verification'] != null
        ? Verification.fromJson(json['verification'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (author != null) {
      data['author'] = author!.toJson();
    }
    if (committer != null) {
      data['committer'] = committer!.toJson();
    }
    data['message'] = message;
    if (tree != null) {
      data['tree'] = tree!.toJson();
    }
    data['url'] = url;
    data['comment_count'] = commentCount;
    if (verification != null) {
      data['verification'] = verification!.toJson();
    }
    return data;
  }
}
