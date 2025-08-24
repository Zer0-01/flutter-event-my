import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_my_event/config/app_secure_storage.dart';
import 'package:flutter_my_event/data/repository/auth_repository.dart';
import 'package:flutter_my_event/presentation/common_widgets/app_loading_dialog_widget.dart';
import 'package:flutter_my_event/presentation/screen/login/bloc/login_bloc.dart';
import 'package:flutter_my_event/presentation/screen/login/login_screen.dart';

@RoutePage()
class LoginSetupScreen extends StatelessWidget {
  const LoginSetupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) => LoginBloc(
            authRepository: AuthRepository(),
            appSecureStorage: AppSecureStorage(),
          ),
      child: BlocListener<LoginBloc, LoginState>(
        listenWhen:
            (previous, current) =>
                previous.postLoginStatus != current.postLoginStatus,
        listener: (context, state) {
          if (state.postLoginStatus == PostLoginStatus.loading) {
            showDialog(
              barrierDismissible: false,
              context: context,
              builder: (context) => const AppLoadingDialogWidget(),
            );
            return;
          }

          if (state.postLoginStatus == PostLoginStatus.error) {
            Navigator.pop(context);
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(const SnackBar(content: Text("Error")));
            return;
          }

          if (state.postLoginStatus == PostLoginStatus.success) {
            Navigator.pop(context);
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(const SnackBar(content: Text("Success")));
            return;
          }
        },
        child: const LoginScreen(),
      ),
    );
  }
}
