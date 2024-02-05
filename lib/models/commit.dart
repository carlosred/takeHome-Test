import 'author.dart';
import 'author_detail.dart';
import 'commit_detail.dart';
import 'parents.dart';

class Commit {
  String? sha;
  String? nodeId;
  CommitDetail? commit;
  String? url;
  String? htmlUrl;
  String? commentsUrl;
  Author? author;
  AuthorDetail? committer;
  List<Parents>? parents;

  Commit(
      {this.sha,
      this.nodeId,
      this.commit,
      this.url,
      this.htmlUrl,
      this.commentsUrl,
      this.author,
      this.committer,
      this.parents});

  Commit.fromJson(Map<String, dynamic> json) {
    sha = json['sha'];
    nodeId = json['node_id'];
    commit =
        (json['commit'] != null ? CommitDetail.fromJson(json['commit']) : null);
    url = json['url'];
    htmlUrl = json['html_url'];
    commentsUrl = json['comments_url'];
    author = json['author'] != null ? Author.fromJson(json['author']) : null;
    committer = json['committer'] != null
        ? AuthorDetail.fromJson(json['committer'])
        : null;
    if (json['parents'] != null) {
      parents = <Parents>[];
      json['parents'].forEach((v) {
        parents!.add(Parents.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['sha'] = sha;
    data['node_id'] = nodeId;
    if (commit != null) {
      data['commit'] = commit!.toJson();
    }
    data['url'] = url;
    data['html_url'] = htmlUrl;
    data['comments_url'] = commentsUrl;
    if (author != null) {
      data['author'] = author!.toJson();
    }
    if (committer != null) {
      data['committer'] = committer!.toJson();
    }
    if (parents != null) {
      data['parents'] = parents!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
