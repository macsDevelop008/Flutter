import 'package:flutter/material.dart';

class SliverCustomImageDelegateUI extends SliverPersistentHeaderDelegate {
  final double minHeight;
  final double maxHeight;
  final Widget child;

  SliverCustomImageDelegateUI(
      {required this.minHeight, required this.maxHeight, required this.child});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(
      child: child,
    );
  }

  @override
  double get maxExtent => (maxHeight > minHeight) ? maxHeight : minHeight;

  @override
  double get minExtent => (maxHeight < minHeight) ? maxHeight : minHeight;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxExtent || minHeight != minExtent;
  }
}
