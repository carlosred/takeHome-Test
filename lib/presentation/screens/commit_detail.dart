import 'package:flutter/material.dart';
import 'package:takehometest/Utils/contants.dart';
import 'package:webview_flutter/webview_flutter.dart';

class CommitDetailPage extends StatefulWidget {
  const CommitDetailPage({super.key, required this.urlCommit});
  final String urlCommit;
  @override
  State<CommitDetailPage> createState() => _CommitDetailPageState();
}

class _CommitDetailPageState extends State<CommitDetailPage> {
  late final WebViewController _controller;

  @override
  void initState() {
    var url = widget.urlCommit
        .replaceFirst(Contants.apiGithubStr, Contants.urlGithubStr);
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {},
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith(url)) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(url));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Commit Detail Page'),
        centerTitle: true,
      ),
      body: WebViewWidget(controller: _controller),
    );
  }
}
