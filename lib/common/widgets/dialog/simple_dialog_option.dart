import 'package:PiliPlus/utils/platform_utils.dart';
import 'package:material_ui/material_ui.dart';

final EdgeInsets _padding = PlatformUtils.isMobile
    ? const .symmetric(horizontal: 16, vertical: 14)
    : const .symmetric(horizontal: 16, vertical: 10);

class DialogOption extends StatelessWidget {
  const DialogOption({
    super.key,
    this.onPressed,
    this.onLongPress,
    this.child,
  });

  final VoidCallback? onPressed;
  final VoidCallback? onLongPress;

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      onLongPress: onLongPress,
      child: Padding(
        padding: _padding,
        child: child,
      ),
    );
  }
}
