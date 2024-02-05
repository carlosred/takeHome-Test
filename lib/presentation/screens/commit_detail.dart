import 'package:flutter/material.dart';

import 'package:webview_flutter/webview_flutter.dart';

import '../widgets/appbar_widget.dart';

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
            if (request.url.startsWith(widget.urlCommit)) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.urlCommit));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(65),
        child: TakeHomeTestAppBar(title: 'Commit Detail Page'),
      ),
      body: WebViewWidget(controller: _controller),
    );
  }
}
