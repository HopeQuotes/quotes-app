import 'package:common/resources/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PendingQuoteState extends StatefulWidget {
  final Color backgroundColor;
  final String stateTitle;
  final Widget endWidget;
  final String? toolTipMessage;
  final int index;

  @override
  State<PendingQuoteState> createState() => _PendingQuoteStateState();

  const PendingQuoteState({
    super.key,
    required this.backgroundColor,
    required this.stateTitle,
    required this.endWidget,
    required this.index,
    this.toolTipMessage,
  });
}

class _PendingQuoteStateState extends State<PendingQuoteState> with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    value: 0.9,
    duration: const Duration(milliseconds: 1000),
    vsync: this,
  )..repeat(reverse: true);
  late GlobalKey key;

  final Tween<double> _tween = Tween(begin: 0.7, end: 1);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    key = GlobalKey();

    return Align(
      alignment: Alignment.topRight,
      child: InkWell(
        onTap: () {
          showPopupMenu(context, message: widget.toolTipMessage, color: widget.backgroundColor);
        },
        child: Container(
          key: key,
          height: 32,
          padding: const EdgeInsets.only(left: 8, right: 8),
          margin: const EdgeInsets.only(right: 16, top: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: widget.backgroundColor,
            boxShadow: [
              BoxShadow(
                color: Colors.black12.withOpacity(0.05),
                blurRadius: 18,
                spreadRadius: 10,
                offset: const Offset(0, 0), // shadow direction: bottom right
              )
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                  style: GoogleFonts.nunito(
                      fontWeight: FontWeight.w600, fontSize: 14, color: AppColors.white),
                  textAlign: TextAlign.center,
                  widget.stateTitle),
              const Padding(
                padding: EdgeInsets.all(4),
              ),
              ScaleTransition(
                  scale: _tween.animate(CurvedAnimation(parent: _controller, curve: Curves.ease)),
                  child: widget.endWidget),
            ],
          ),
        ),
      ),
    );
  }

  void showPopupMenu(BuildContext context, {required String? message, required Color color}) async {
    if (message != null) {
      var box = key.currentContext?.findRenderObject() as RenderBox;
      Offset position = box.localToGlobal(Offset.zero); //this is global position

      await showMenu(
        color: color,
        useRootNavigator: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(16),
          ),
        ),
        context: context,
        position: RelativeRect.fromLTRB(position.dy, position.dy + 52, 120, position.dx),
        items: [
          _buildSyncReceiptsPopup(context, message: message, color: color),
        ],
        elevation: 8.0,
      );
    }
  }

  PopupMenuItem _buildSyncReceiptsPopup(BuildContext context,
      {required String message, required Color color}) {
    return PopupMenuItem(
      height: 28,
      padding: const EdgeInsets.only(left: 12, right: 12),
      onTap: () {},
      child: GestureDetector(
          child: Text(
        message,
        style:
            GoogleFonts.nunito(fontWeight: FontWeight.w600, fontSize: 14, color: AppColors.white),
      )),
    );
  }
}
