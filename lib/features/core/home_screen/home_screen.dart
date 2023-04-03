//

import 'package:epsilon_app/core/helpers/localization/language_constants.dart';
import 'package:epsilon_app/core/utils/routing/app_screens.dart';
import 'package:epsilon_app/core/utils/styling/colors/app_colors.dart';
import 'package:epsilon_app/core/widgets/app_decoration_image.dart';
import 'package:epsilon_app/core/widgets/loading_view.dart';
import 'package:epsilon_app/dependancy_injection.dart';
import 'package:epsilon_app/features/core/home_screen/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils/styling/assets/app_icons.dart';
import '../../../core/widgets/app_nav_bar.dart';
import '../../../core/widgets/app_text_field.dart';
import '../../../core/widgets/error_view.dart';
import '../../../core/widgets/gradient_button.dart';
import 'widgets/companies_dropdown.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          locator<HomeBloc>()..add(const HomeEvent.fetchCachedConnection()),
      child: const HomeScreenContent(),
    );
  }
}

class HomeScreenContent extends StatelessWidget {
  const HomeScreenContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          _decorationImage(),
          Scaffold(
            resizeToAvoidBottomInset: true,
            backgroundColor: Colors.transparent,
            body: _content(context),
          ),
        ],
      ),
    );
  }

  Widget _content(BuildContext context) {
    return Column(
      children: [
        AppNavBar(title: Translator.translation(context).pick_company),
        Expanded(
          child: BlocConsumer<HomeBloc, HomeState>(
            listener: (context, state) {
              if (state.connectSuccessfully) {
                Navigator.of(context).pushNamed(AppScreens.operationsScreen);
              }
            },
            builder: (context, state) {
              return Stack(
                children: [
                  const HomeScreenTextFIelds(),
                  state.isLoading
                      ? const LoadingView(
                          isLoading: true,
                          color: AppColors.primaryDark,
                        )
                      : const SizedBox.shrink(),
                  state.failure.fold(
                    () => const SizedBox.shrink(),
                    (f) => ErrorView(
                      failure: f,
                      onAction: () {
                        context
                            .read<HomeBloc>()
                            .add(const HomeEvent.clearFailure());
                      },
                    ),
                  ),
                ],
              );
            },
          ),
        )
      ],
    );
  }

  Positioned _decorationImage() {
    return Positioned(
      bottom: 0,
      left: 0,
      child: Transform.translate(
        offset: const Offset(-110, 0),
        child: const AppDecorationImage(),
      ),
    );
  }
}

class HomeScreenTextFIelds extends StatefulWidget {
  const HomeScreenTextFIelds({super.key});

  @override
  State<HomeScreenTextFIelds> createState() => _HomeScreenTextFIeldsState();
}

class _HomeScreenTextFIeldsState extends State<HomeScreenTextFIelds> {
  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _host = TextEditingController();
  final TextEditingController _port = TextEditingController();
  final TextEditingController _database = TextEditingController();

  @override
  void dispose() {
    _username.dispose();
    _password.dispose();
    _host.dispose();
    _port.dispose();
    _database.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeBloc, HomeState>(
      listener: (context, state) {
        if (state.forceUpdate) {
          _fillTextFields(state);
        }
      },
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 30),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: CompaniesDropDown(),
            ),
            const SizedBox(height: 30),
            _usernameTextField(context),
            const SizedBox(height: 30),
            _passwordTextField(context),
            const SizedBox(height: 30),
            _databaseURl(context),
            const SizedBox(height: 30),
            _databasePort(context),
            const SizedBox(height: 30),
            _databaseName(context),
            const SizedBox(height: 30),
            _loginButton(context, true),
          ],
        ),
      ),
    );
  }

  _fillTextFields(HomeState state) {
    _host.text = state.host;
    _port.text = state.port;
    _database.text = state.database;
    _username.text = state.username;
    _password.text = state.password;
  }

  Widget _passwordTextField(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: LabledValidateTextFIeld(
        controller: _password,
        label: Translator.translation(context).password,
        hint: Translator.translation(context).password_hint,
        icon: AppIcons.lock,
        isSecure: true,
        onChange: (value) => context
            .read<HomeBloc>()
            .add(HomeEvent.passwordHasChanged(password: value)),
        onHasFocus: () {},
        onLoseFocus: () {},
      ),
    );
  }

  Widget _usernameTextField(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: LabledValidateTextFIeld(
        controller: _username,
        label: Translator.translation(context).user_name,
        hint: Translator.translation(context).user_name_hint,
        icon: AppIcons.user,
        onChange: (value) => context
            .read<HomeBloc>()
            .add(HomeEvent.usernameHasChanged(username: value)),
        onHasFocus: () {},
        onLoseFocus: () {},
      ),
    );
  }

  Widget _databasePort(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: LabledValidateTextFIeld(
        controller: _port,
        label: Translator.translation(context).database_port,
        hint: Translator.translation(context).database_port_hint,
        icon: AppIcons.database,
        iconSize: 26,
        onChange: (value) =>
            context.read<HomeBloc>().add(HomeEvent.portHasChanged(port: value)),
        onHasFocus: () {},
        onLoseFocus: () {},
      ),
    );
  }

  Widget _databaseName(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: LabledValidateTextFIeld(
        controller: _database,
        label: Translator.translation(context).database_name,
        hint: Translator.translation(context).database_name_hint,
        icon: AppIcons.database,
        iconSize: 26,
        onChange: (value) => context
            .read<HomeBloc>()
            .add(HomeEvent.databaseHasChanged(database: value)),
        onHasFocus: () {},
        onLoseFocus: () {},
      ),
    );
  }

  Widget _databaseURl(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: LabledValidateTextFIeld(
        controller: _host,
        label: Translator.translation(context).database_url,
        hint: Translator.translation(context).database_url_hint,
        icon: AppIcons.database,
        iconSize: 26,
        onChange: (value) =>
            context.read<HomeBloc>().add(HomeEvent.hostHasChanged(host: value)),
        onHasFocus: () {},
        onLoseFocus: () {},
      ),
    );
  }

  Widget _loginButton(BuildContext context, bool isEnabled) {
    return GradientButton(
      onPressed: () {
        FocusManager.instance.primaryFocus?.unfocus();
        context.read<HomeBloc>().add(const HomeEvent.checkConnection());
      },
      isEnabled: context.watch<HomeBloc>().state.isValid(),
      label: Translator.translation(context).ok_button,
    );
  }
}
