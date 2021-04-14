import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_network_example/bloc/user_bloc.dart';
import 'package:flutter_bloc_network_example/bloc/user_event.dart';

class ActionButtons extends StatelessWidget {
  const ActionButtons({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final UserBloc userBloc = BlocProvider.of<UserBloc>(context);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ElevatedButton(
            child: Text('Load'),
            onPressed: () {
              userBloc.add(UserLoadEvent());
            },
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateColor.resolveWith((states) => Colors.green))),
        SizedBox(width: 8.0),
        ElevatedButton(
            child: Text('Clear'),
            onPressed: () {
              userBloc.add(UserClearEvent());
            },
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateColor.resolveWith((states) => Colors.red))),
      ],
    );
  }
}
