import 'package:flutter/material.dart';
import 'package:flutter_widgets/base/base_scaffold.dart';
import 'package:oktoast/oktoast.dart';

/// @author：yongfeng
/// @data：2024/9/22 9:59
/// TapRegion实现自定义Toast
class TapRegionTest extends StatefulWidget {
  const TapRegionTest({super.key});

  @override
  State<TapRegionTest> createState() => _TapRegionTestState();
}

class _TapRegionTestState extends State<TapRegionTest> with SingleTickerProviderStateMixin {
  AnimationController? animationController;
  OverlayEntry? lastOverlayEntry;
  final double popMenuWidth = 150;
  final double popMenuHeight = 150;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      titleWidget: const Text('TapRegion实现自定义PopMenu'),
      bodyWidget: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(width: double.infinity),
          TextButton(
            onPressed: () {
              hidePopWin(context);
            },
            child: const Text('点击测试取消PopWin'),
          ),
          const Text('TapRegion实现自定义PopMenu'),
          Builder(builder: (ctx) {
            return TextButton(
              onPressed: () {
                showPopWin(ctx);
              },
              child: const Text('点击测试弹出PopWin'),
            );
          })
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    hidePopWin(context);
    animationController?.dispose();
  }

  void showPopWin(BuildContext context) {
    if (lastOverlayEntry != null) {
      return;
    }
    if (animationController == null || animationController?.isAnimating == true) {
      return;
    }
    animationController?.reset();
    final animRect = _buildShowAnimRect(context);

    final child = TapRegion(
      child: Container(
        color: Colors.brown,
        width: popMenuWidth,
        height: popMenuHeight,
        alignment: Alignment.center,
        child: const Text("text"),
      ),
      onTapInside: (e) {
        showToast('onTapInside');
      },
      onTapOutside: (e) {
        showToast('onTapOutside');
      },
    );
    lastOverlayEntry = OverlayEntry(
      builder: (BuildContext context) {
        return AnimatedBuilder(
          animation: animationController!,
          builder: (ctx, child) {
            return Positioned.fromRect(
              rect: animRect!.value!,
              child: child!,
            );
          },
          child: child,
        );
      },
    );
    Overlay.of(context, rootOverlay: true, debugRequiredFor: widget).insert(lastOverlayEntry!);
    animationController?.forward();
  }

  Animation<Rect?> _buildShowAnimRect(BuildContext context) {
    final RenderBox renderBoxContainer = context.findRenderObject()! as RenderBox;
    final boxPaintBounds = renderBoxContainer.paintBounds;
    final boxSize = renderBoxContainer.size;
    final boxRect = Rect.fromPoints(
      renderBoxContainer.localToGlobal(boxPaintBounds.topLeft),
      renderBoxContainer.localToGlobal(boxPaintBounds.bottomRight),
    );

    final beginRect = Rect.fromLTWH(boxRect.left + (boxSize.width - popMenuWidth) / 2,
        boxRect.top + boxSize.height + 6, popMenuWidth, 0);

    final endRect = Rect.fromLTWH(boxRect.left + (boxSize.width - popMenuWidth) / 2,
        boxRect.top + boxSize.height + 6, popMenuWidth, popMenuHeight);

    final Animation<Rect?> animRect = RectTween(
      begin: beginRect,
      end: endRect,
    ).chain(CurveTween(curve: Curves.easeIn)).animate(animationController!);
    return animRect;
  }

  void hidePopWin(BuildContext context) {
    lastOverlayEntry?.remove();
    lastOverlayEntry?.dispose();
    lastOverlayEntry = null;
  }
}
