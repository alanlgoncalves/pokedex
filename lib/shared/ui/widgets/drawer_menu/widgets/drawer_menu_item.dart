import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/shared/ui/widgets/pokeball.dart';
import 'package:pokedex/theme/app_theme.dart';

class DrawerMenuItemWidget extends StatelessWidget {
  final Color color;
  final String text;
  final double height;
  final double width;
  final VoidCallback? onTap;

  const DrawerMenuItemWidget(
      {Key? key,
      required this.color,
      required this.text,
      this.height = 60,
      this.width = 155,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.all(5),
      child: InkWell(
        onTap: onTap != null
            ? onTap
            : () {
                BotToast.showText(text: "Not implemented yet");
              },
        child: Container(
          decoration: BoxDecoration(
            color: onTap != null
                ? color
                : AppTheme.getColors(context).drawerDisabled,
            borderRadius: BorderRadius.circular(15),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Stack(
              children: [
                Positioned(
                  top: -12,
                  right: -14,
                  child: PokeballWidget(
                    size: 83,
                    color: Colors.white.withOpacity(0.2),
                  ),
                ),
                Positioned(
                  top: -60,
                  left: -50,
                  child: PokeballWidget(
                    size: 83,
                    color: Colors.white.withOpacity(0.2),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        text,
                        style:
                            textTheme.bodyText1?.copyWith(color: Colors.white),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
