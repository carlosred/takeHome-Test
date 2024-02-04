import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';
import 'package:takehometest/data/repositories/commit_repository.dart';
import 'package:takehometest/models/commit.dart';

class MockHttpClient extends Mock implements http.Client {}

class MockCommitRepository extends Mock implements CommitRepository {}

void main() {
  late MockCommitRepository repository;

  setUpAll(() {
    registerFallbackValue(MockHttpClient());
    repository = MockCommitRepository();
  });

  test('mockRepository returns a list of commits', () async {
    final fakeCommits = [
      {
        "sha": "asdsada",
        "node_id": "asdsad",
        "commit": {
          "author": {
            "name": "test dummy",
            "email": "test@hotmail.com",
            "date": "2024-02-04T19:26:03Z"
          },
          "committer": {
            "name": "test test",
            "email": "test@hotmail.com",
            "date": "2024-02-04T19:26:03Z"
          },
          "message": "feat: added detail page with a webView.",
          "tree": {
            "sha": "adasdsa",
            "url":
                "https://api.github.com/repos/test/takeHome-Test/git/trees/sdadasd"
          },
          "url":
              "https://api.github.com/repos/test/takeHome-Test/git/commits/asdasd",
          "comment_count": 0,
          "verification": {
            "verified": false,
            "reason": "unsigned",
            "signature": null,
            "payload": null
          }
        },
        "url": "https://api.github.com/repos/asd/asdas-Test/commits/asdasd",
        "html_url": "https://github.com/asdas/takeHome-Test/commit/sadas",
        "comments_url":
            "https://api.github.com/repos/asdstest/takeHome-Test/commits/asdas/comments",
        "author": {
          "login": "test",
          "id": 22422477,
          "node_id": "MDQ6VXNlcjIyNDIyNDc3",
          "avatar_url": "https://avatars.githubusercontent.com/u/22422477?v=4",
          "gravatar_id": "",
          "url": "https://api.github.com/users/test",
          "html_url": "https://github.com/test",
          "followers_url": "https://api.github.com/users/test/followers",
          "following_url":
              "https://api.github.com/users/test/following{/other_user}",
          "gists_url": "https://api.github.com/users/test/gists{/gist_id}",
          "starred_url":
              "https://api.github.com/users/test/starred{/owner}{/repo}",
          "subscriptions_url":
              "https://api.github.com/users/test/subscriptions",
          "organizations_url": "https://api.github.com/users/test/orgs",
          "repos_url": "https://api.github.com/users/test/repos",
          "events_url": "https://api.github.com/users/test/events{/privacy}",
          "received_events_url":
              "https://api.github.com/users/test/received_events",
          "type": "User",
          "site_admin": false
        },
        "committer": {
          "login": "test",
          "id": 12121,
          "node_id": "1sasadad",
          "avatar_url":
              "https://avatars.githubusercontent.com/u/22422asdas477?v=4",
          "gravatar_id": "",
          "url": "https://api.github.com/users/asdas",
          "html_url": "https://github.com/test",
          "followers_url": "https://api.github.com/users/asdas/followers",
          "following_url":
              "https://api.github.com/users/test/following{/other_user}",
          "gists_url": "",
          "starred_url": "",
          "subscriptions_url":
              "https://api.github.com/users/test/subscriptions",
          "organizations_url": "https://api.github.com/users/test/orgs",
          "repos_url": "https://api.github.com/users/test/repos",
          "events_url": "https://api.github.com/users/test/events{/privacy}",
          "received_events_url":
              "https://api.github.com/users/test/received_events",
          "type": "User",
          "site_admin": false
        },
        "parents": [
          {
            "sha": "0d76354909a961cde9a2b4cb6cb53517ef5bdc34",
            "url":
                "https://api.github.com/repos/test/takeHome-Test/commits/0d76354909a961cde9a2b4cb6cb53517ef5bdc34",
            "html_url":
                "https://github.com/test/takeHome-Test/commit/0d76354909a961cde9a2b4cb6cb53517ef5bdc34"
          }
        ]
      },
    ];

    List<Commit>? fakeCommitsList =
        List.from(fakeCommits).map((e) => Commit.fromJson(e)).toList();

    when(
      () => repository.getCommits(),
    ).thenAnswer(
      (_) => Future.value(fakeCommitsList),
    );

    final result = await repository.getCommits();

    expect(result?.length, 1);
    expect(result![0].commit!.author!.name, 'test dummy');
    expect(result[0].commit!.author!.email, 'test@hotmail.com');
  });
}
