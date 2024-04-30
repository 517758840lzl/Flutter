import 'package:flutter/material.dart';

/// 缓存页面 https://blog.csdn.net/qq_14876133/article/details/125393405
class AutoKeepAliveWrapper extends StatefulWidget {
  final Widget child;
  final bool keepAlive;

  const AutoKeepAliveWrapper({
    super.key,
    required this.child,
    this.keepAlive = true,
  });

  @override
  State<AutoKeepAliveWrapper> createState() => _AutoKeepAliveWrapperState();
}

class _AutoKeepAliveWrapperState extends State<AutoKeepAliveWrapper>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return widget.child;
  }

  @override
  void didUpdateWidget(covariant AutoKeepAliveWrapper oldWidget) {
    if (widget.keepAlive != oldWidget.keepAlive) {
      updateKeepAlive();
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  bool get wantKeepAlive => widget.keepAlive;
}
