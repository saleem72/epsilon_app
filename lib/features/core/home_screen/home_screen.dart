//

import 'package:epsilon_app/core/extensions/build_context_extension.dart';
import 'package:epsilon_app/core/utils/routing/app_screens.dart';
import 'package:epsilon_app/core/utils/styling/colors/app_colors.dart';
import 'package:epsilon_app/core/widgets/app_decoration_image.dart';
import 'package:epsilon_app/core/widgets/loading_view.dart';
import 'package:epsilon_app/dependancy_injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/helpers/database_communicator/domain/models/connection_params.dart';
import '../../../core/utils/styling/assets/app_icons.dart';
import '../../../core/widgets/app_nav_bar.dart';
import '../../../core/widgets/app_text_field.dart';
import '../../../core/widgets/error_view.dart';
import '../../../core/widgets/gradient_button.dart';
import 'presentation/connection_configuration_bloc/connection_configuration_bloc.dart';
import 'presentation/connection_configuration_monitor_bloc/connection_configuration_monitor_bloc.dart';
import 'presentation/widgets/companies_dropdown.dart';

class ConnectionConfigurationScreen extends StatelessWidget {
  const ConnectionConfigurationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => locator<ConnectionConfigurationBloc>(),
        ),
        BlocProvider(
          create: (_) => locator<ConnectionConfigurationMonitorBloc>()
            ..add(const ConnectionConfigurationMonitorEvent
                .fetchCachedConnection()),
        ),
      ],
      child: const ConnectionConfigurationContent(),
    );
  }
}

class ConnectionConfigurationContent extends StatelessWidget {
  const ConnectionConfigurationContent({super.key});

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
        AppNavBar(title: context.translate.pick_company),
        Expanded(
          child: BlocConsumer<ConnectionConfigurationBloc,
              ConnectionConfigurationState>(
            listenWhen: (previous, current) =>
                previous.connectSuccessfully != current.connectSuccessfully,
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
                    (f) => GeneralErrorView(
                      failure: f.map(
                        noInternt: (_) =>
                            context.translate.no_internet_connection,
                        portFailure: (_) =>
                            context.translate.fail_to_connect_db_port,
                        hostFailure: (_) =>
                            context.translate.fail_to_connect_db_host,
                        databaseFailure: (_) =>
                            context.translate.fail_to_connect_db_db,
                        usernameOrPasswordFailure: (_) =>
                            context.translate.fail_to_connect_db_username,
                        unExpected: (_) => context.translate.fail_to_connect_db,
                      ),
                      onAction: () {
                        context.read<ConnectionConfigurationBloc>().add(
                            const ConnectionConfigurationEvent.clearFailure());
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
    return BlocListener<ConnectionConfigurationMonitorBloc,
        ConnectionConfigurationMonitorState>(
      listenWhen: (previous, current) => current.when(
        initial: () => false,
        newParams: (_) => true,
      ),
      listener: (context, state) {
        state.maybeMap(
          newParams: (state) {
            _fillTextFields(state.params);
            context.read<ConnectionConfigurationBloc>().add(
                  ConnectionConfigurationEvent.paramHasChanged(
                      params: state.params),
                );
          },
          orElse: () {},
        );
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
            _loginButton(context),
          ],
        ),
      ),
    );
  }

  _fillTextFields(ConnectionParams params) {
    _host.text = params.host;
    _port.text = params.port;
    _database.text = params.database;
    _username.text = params.username;
    _password.text = params.password;
  }

  Widget _passwordTextField(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: LabledValidateTextFIeld(
        controller: _password,
        label: context.translate.password,
        hint: context.translate.password_hint,
        icon: AppIcons.lock,
        isSecure: true,
        onChange: (value) => context.read<ConnectionConfigurationBloc>().add(
            ConnectionConfigurationEvent.passwordHasChanged(password: value)),
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
        label: context.translate.user_name,
        hint: context.translate.user_name_hint,
        icon: AppIcons.user,
        onChange: (value) => context.read<ConnectionConfigurationBloc>().add(
            ConnectionConfigurationEvent.usernameHasChanged(username: value)),
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
        label: context.translate.database_port,
        hint: context.translate.database_port_hint,
        icon: AppIcons.database,
        iconSize: 26,
        onChange: (value) => context
            .read<ConnectionConfigurationBloc>()
            .add(ConnectionConfigurationEvent.portHasChanged(port: value)),
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
        label: context.translate.database_name,
        hint: context.translate.database_name_hint,
        icon: AppIcons.database,
        iconSize: 26,
        onChange: (value) => context.read<ConnectionConfigurationBloc>().add(
            ConnectionConfigurationEvent.databaseHasChanged(database: value)),
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
        label: context.translate.database_url,
        hint: context.translate.database_url_hint,
        icon: AppIcons.database,
        iconSize: 26,
        onChange: (value) => context
            .read<ConnectionConfigurationBloc>()
            .add(ConnectionConfigurationEvent.hostHasChanged(host: value)),
        onHasFocus: () {},
        onLoseFocus: () {},
      ),
    );
  }

  Widget _loginButton(BuildContext context) {
    return GradientButton(
      onPressed: () {
        FocusManager.instance.primaryFocus?.unfocus();
        context
            .read<ConnectionConfigurationBloc>()
            .add(const ConnectionConfigurationEvent.checkConnection());
      },
      isEnabled: context.watch<ConnectionConfigurationBloc>().state.isValid(),
      label: context.translate.ok_button,
    );
  }
}
