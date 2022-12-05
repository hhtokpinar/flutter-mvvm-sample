import 'dart:io';

import 'package:webview_flutter/webview_flutter.dart';

import '../../../app/global_imports.dart';

class NewsDetailsWebview extends ConsumerStatefulWidget {
  const NewsDetailsWebview({super.key, required this.url});
  final String url;
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _NewsDetailsWebviewState();
}

class _NewsDetailsWebviewState extends ConsumerState<NewsDetailsWebview> {
  @override
  void initState() {
    super.initState();
    // Enable virtual display.
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ref.watch(ProvidersNews.webViewLoading) ? const Center(child: CircularProgressIndicator()) : const SizedBox(),
        SizedBox(
          height: 15000,
          child: WebView(
            onPageStarted: (url) {
              debugPrint('webview onpage started');
              ref.read(ProvidersNews.webViewLoading.notifier).state = true;
            },
            onPageFinished: (url) {
              debugPrint('webview onpage finished');
              ref.read(ProvidersNews.webViewLoading.notifier).state = false;
            },
            initialUrl: widget.url,
          ),
        ),
      ],
    ));
  }
}
