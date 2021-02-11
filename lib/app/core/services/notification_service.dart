import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:oktoast/oktoast.dart';

enum NOTIFICATION_TYPE {
  primary,
  info,
  sucess,
  danger,
  warning,
  error,
}

class NotificationService {
  static Color _getColorForType(NOTIFICATION_TYPE type) {
    switch (type) {
      case NOTIFICATION_TYPE.info:
        return Colors.lightBlue;
      case NOTIFICATION_TYPE.sucess:
        return Colors.green;
      case NOTIFICATION_TYPE.warning:
        return Colors.orange;
      case NOTIFICATION_TYPE.danger:
        return Colors.red;
      case NOTIFICATION_TYPE.error:
        return Colors.red[400];

      case NOTIFICATION_TYPE.primary:
      default:
        return Colors.lightBlue[800];
    }
  }

  static IconData _getIconDataForType(NOTIFICATION_TYPE type) {
    // Fonts do site
    // https://fontawesome.com/icons?d=gallery&c=interfaces&m=free
    switch (type) {
      case NOTIFICATION_TYPE.info:
        return FontAwesomeIcons.info;
      case NOTIFICATION_TYPE.sucess:
        return FontAwesomeIcons.check;
      case NOTIFICATION_TYPE.warning:
        return FontAwesomeIcons.exclamation;
      case NOTIFICATION_TYPE.danger:
        return FontAwesomeIcons.exclamationTriangle;
      case NOTIFICATION_TYPE.error:
        return FontAwesomeIcons.meh;

      case NOTIFICATION_TYPE.primary:
      default:
        return FontAwesomeIcons.check;
    }
  }

  static void notify({
    String title,
    @required String msg,
    FaIcon icon,
    NOTIFICATION_TYPE type = NOTIFICATION_TYPE.primary,
    Color textColor = Colors.white,
    Function function,
    Duration duration = const Duration(seconds: 3),
    NotificationAction action,
  }) {
    icon ??= FaIcon(
      _getIconDataForType(type),
      color: textColor,
    );

    showToastWidget(
        Material(
          color: Colors.transparent,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: InkWell(
                onTap: () {
                  if (function != null) function();
                  dismissAllToast(showAnim: true);
                },
                child: Container(
                  padding: EdgeInsets.all(10),
                  color: _getColorForType(type),
                  height: 70,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      icon,
                      Container(width: 10),
                      Expanded(
                          child: Text(
                        msg,
                        maxLines: 2,
                        style: TextStyle(color: textColor),
                      )),
                      action ?? Container(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        handleTouch: true,
        duration: duration);
    //
  }
}

class NotificationAction extends StatelessWidget {
  const NotificationAction({
    Key key,
    @required this.title,
    @required this.onPressed,
  }) : super(key: key);

  final String title;
  final Color textColor = Colors.white;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      color: Colors.black26,
      onPressed: onPressed,
      child: Text(
        title,
        style: TextStyle(color: textColor),
      ),
    );
  }
}
