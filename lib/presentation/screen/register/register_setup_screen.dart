import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_my_event/data/repository/auth_repository.dart';
import 'package:flutter_my_event/presentation/common_widgets/app_loading_dialog_widget.dart';
import 'package:flutter_my_event/presentation/screen/register/bloc/register_bloc.dart';
import 'package:flutter_my_event/presentation/screen/register/register_screen.dart';

@RoutePage()
class RegisterSetupScreen extends StatelessWidget {
  const RegisterSetupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterBloc(authRepository: AuthRepository()),
      child: BlocListener<RegisterBloc, RegisterState>(
        listenWhen:
            (previous, current) =>
                previous.postRegisterStatus != current.postRegisterStatus,
        listener: (context, state) {
          if (state.postRegisterStatus == PostRegisterStatus.loading) {
            showDialog(
              barrierDismissible: false,
              context: context,
              builder: (context) => const AppLoadingDialogWidget(),
            );

            return;
          }

          if (state.postRegisterStatus == PostRegisterStatus.error) {
            Navigator.pop(context);
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(const SnackBar(content: Text("Error")));
            return;
          }

          if (state.postRegisterStatus == PostRegisterStatus.success) {
            Navigator.pop(context);
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(const SnackBar(content: Text("Success")));
          }
        },
        child: const RegisterScreen(),
      ),
    );
  }
}
