import 'package:flutter/material.dart';
import 'package:takehometest/Utils/contants.dart';

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
  bool _isLoading = true;

  @override
  void initState() {
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageFinished: (url) => setState(() {
            _isLoading = false;
          }),
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
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(65),
        child: TakeHomeTestAppBar(title: Contants.detailPageTitle),
      ),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : WebViewWidget(controller: _controller),
    );
  }
}
