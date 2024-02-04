import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:takehometest/data/controllers/commit_controller.dart';

class ErrorCommitWidget extends ConsumerWidget {
  const ErrorCommitWidget({
    super.key,
    required this.message,
  });
  final String message;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AspectRatio(
            aspectRatio: 12 / 6,
            child: Image.asset('assets/error.png'),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            message,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
            onPressed: () {
              ref.read(commitControllerProvider.notifier).getCommitList();
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: const Text(
              'Retry',
              style: TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
