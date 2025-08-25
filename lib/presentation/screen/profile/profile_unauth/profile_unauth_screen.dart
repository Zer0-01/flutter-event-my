import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_my_event/presentation/screen/profile/widgets/profile_app_bar_widget.dart';
import 'package:flutter_my_event/routes/app_auto_route.dart';
import 'package:flutter_my_event/utils/extensions.dart';
import 'package:flutter_my_event/utils/vector_constants.dart';
import 'package:flutter_svg/svg.dart';

class ProfileUnauthScreen extends StatelessWidget {
  const ProfileUnauthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ProfileAppBarWidget(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 32,
          children: [
            Align(
              alignment: Alignment.center,
              child: Text(
                context.l10n.welcome,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.3,
              child: SvgPicture.asset(VectorConstants.vectorWelcome),
            ),

            FilledButton(
              style: FilledButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () => context.router.pushPath(RoutePath.login),
              child: Text(context.l10n.login),
            ),
          ],
        ),
      ),
    );
  }
}
