//

import 'package:epsilon_app/core/utils/styling/assets/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/helpers/localization/language_constants.dart';
import '../../../../../core/utils/styling/colors/app_colors.dart';
import '../../../../../core/utils/styling/topology/topology.dart';
import '../../domain/models/companies.dart';
import '../connection_manager/database_provider/database_provider.dart';

class CompaniesDropDown extends StatefulWidget {
  const CompaniesDropDown({super.key});

  @override
  State<CompaniesDropDown> createState() => _CompaniesDropDownState();
}

class _CompaniesDropDownState extends State<CompaniesDropDown> {
  Companies? _value;
  final double itemHeight = 58;
  @override
  Widget build(BuildContext context) {
    return BlocListener<DatabaseProvider, DatabaseProviderState>(
      listenWhen: (previous, current) => current is DatabaseProviderSetParams,
      listener: (context, state) {
        if (state is DatabaseProviderSetParams) {
          setState(() {
            _value = state.company;
          });
        }
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            Translator.translation(context).company,
            style: Topology.subTitle,
          ),
          const SizedBox(height: 10),
          _moreMenu(context),
        ],
      ),
    );
  }

  Container _contaner(BuildContext context) {
    return Container(
      height: itemHeight,
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: AppColors.neutral95,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            offset: const Offset(0, -0.5),
            spreadRadius: 0.5,
          ),
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            offset: const Offset(0, 1),
            spreadRadius: 0.5,
          ),
        ],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Stack(
          alignment: Alignment.center,
          children: [
            _value == null
                ? IgnorePointer(
                    child: Row(
                      children: [
                        Text(
                          Translator.translation(context).company_hint,
                          style: Topology.subTitle.copyWith(
                            color: AppColors.secondary,
                          ),
                        ),
                        const Icon(
                          Icons.arrow_drop_down,
                          color: AppColors.secondary,
                        ),
                      ],
                    ),
                  )
                : Row(
                    children: [
                      Text(
                        _value!.title(context),
                        style: Topology.subTitle.copyWith(
                          color: AppColors.textDark,
                        ),
                      ),
                      // const SizedBox(width: 8),
                      const Icon(
                        Icons.arrow_drop_down,
                        color: AppColors.textDark,
                      ),
                    ],
                  ),
          ],
        ),
      ),
    );
  }

  PopupMenuButton<Companies> _moreMenu(BuildContext context) {
    return PopupMenuButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      constraints: BoxConstraints(
        minWidth: 200,
        maxWidth: MediaQuery.of(context).size.width - 32,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      offset: Offset(0, itemHeight + 8),
      onSelected: (item) {
        setState(() {
          _value = item;
          context
              .read<DatabaseProvider>()
              .add(DatabaseProviderCompanyHasChange(company: item));
        });
      }, // => _actionForMenuItem(context, item: item),
      itemBuilder: (context) => Companies.values
          .map((e) => PopupMenuItem(
              value: e,
              child: PopupMenuItemCard(
                title: e.title(context),
                isActive: e == _value,
              )))
          .toList(),
      child: _contaner(context),
    );
  }
}

class PopupMenuItemCard extends StatelessWidget {
  const PopupMenuItemCard({
    Key? key,
    required this.title,
    required this.isActive,
  }) : super(key: key);
  final String title;
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width - 32,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Image.asset(
            AppIcons.company,
            height: 26,
            width: 26,
          ),
          const SizedBox(width: 8),
          Expanded(child: Text(title)),
          isActive
              ? Container(
                  width: 28,
                  height: 28,
                  decoration: BoxDecoration(
                      color: AppColors.green.withOpacity(0.1),
                      shape: BoxShape.circle),
                  child: const Icon(
                    Icons.check,
                    size: 18,
                    color: AppColors.green,
                  ),
                )
              : const SizedBox.shrink()
        ],
      ),
    );
  }
}
