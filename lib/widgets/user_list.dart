import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_network_example/bloc/user_bloc.dart';
import 'package:flutter_bloc_network_example/bloc/user_state.dart';

class UserList extends StatelessWidget {
  const UserList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        if (state is UserEmptyState) {
          return Center(child: Text('no data'));
        }
        if (state is UserLoadingState) {
          return Center(child: CircularProgressIndicator());
        }
        if (state is UserLoadedState) {
          return ListView.builder(
            itemCount: state.loadedUser.length,
            itemBuilder: (context, index) {
              final userData = state.loadedUser[index];

              return ListTile(
                tileColor: index % 2 == 0 ? Colors.white : Colors.grey,
                leading: Text('ID:${userData.id}'),
                title: Column(
                  children: [
                    Text('${userData.name}'),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('Email: ${userData.email}'),
                        Text('Phone: ${userData.phone}')
                      ],
                    ),
                  ],
                ),
              );
            },
          );
        }
        if (state is UserErrorState) {
          return Center(child: Text('error'));
        }
        return null;
      },
    );
  }
}
