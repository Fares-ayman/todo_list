import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WrapperWidget extends StatelessWidget {
  final Widget child;
  const WrapperWidget({
    super.key,
    required this.child,
  });
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      context,
      minTextAdapt: true,
      designSize: const Size(390, 500),
    );
    return child;
  }
}

class ParentWrapperWidget extends StatelessWidget {
  final Widget child;
  const ParentWrapperWidget({super.key, required this.child});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WrapperWidget(
        child: Scaffold(body: child),
      ),
    );
  }
}
