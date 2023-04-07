//

import 'package:epsilon_app/core/extensions/build_context_extension.dart';
import 'package:epsilon_app/core/extensions/num_extension.dart';
import 'package:epsilon_app/core/utils/styling/assets/app_icons.dart';
import 'package:epsilon_app/core/utils/styling/colors/app_colors.dart';
import 'package:epsilon_app/core/utils/styling/topology/topology.dart';
import 'package:epsilon_app/core/widgets/app_nav_bar.dart';
import 'package:flutter/material.dart';

import '../../../../core/widgets/app_decoration_image.dart';
import 'presentation/widgets/customer_search_bar.dart';

class CustomerSearch extends StatelessWidget {
  const CustomerSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          AppNavBar(
            title: context.translate.customer_account_statement,
          ),
          const Padding(
            padding: EdgeInsets.only(top: 30, left: 20, right: 20, bottom: 20),
            child: CustomerSearchBar(),
          ),
          Expanded(
            child: Stack(
              fit: StackFit.expand,
              children: [
                _decorationImage(),
                _decorationImage2(context),
                _content(context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _content(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Expanded(child: _oldSearch(context)),
        ],
      ),
    );
  }

  Widget _oldSearch(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              context.translate.old_research,
            ),
            TextButton(
              onPressed: () {},
              child: Text(context.translate.clear_all),
            ),
          ],
        ),
        Expanded(
          child: ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: 3,
            itemBuilder: (BuildContext context, int index) {
              return OldSearchTile(
                onClear: () {},
                name: 'خالد أحمد',
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _decorationImage2(BuildContext context) {
    return Transform.translate(
      offset: Offset((MediaQuery.of(context).size.width / 2) + 90, 0),
      child: Transform.rotate(
        angle: -12.toRadians(),
        child: const AppDecorationImage(),
      ),
    );
  }

  Widget _decorationImage() {
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

class OldSearchTile extends StatelessWidget {
  const OldSearchTile({
    super.key,
    required this.name,
    required this.onClear,
  });
  final String name;
  final Function onClear;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 64,
      child: Row(
        children: [
          Image.asset(
            AppIcons.userImage,
            width: 40,
            height: 40,
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Text(
              name,
              style: Topology.body.copyWith(
                color: AppColors.primaryDark,
              ),
            ),
          ),
          IconButton(
            onPressed: () => onClear(),
            icon: const Icon(
              Icons.close,
              size: 16,
              color: AppColors.primaryLight,
            ),
          ),
        ],
      ),
    );
  }
}
