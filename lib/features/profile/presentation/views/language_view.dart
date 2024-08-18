import '../../data/models/static/language_list.dart';
import '../widgets/settings/search_language_text_field.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../onBorading/presentation/widgets/auth_brn.dart';
import '../../../home/presentation/widgets/notification/notifaction_app_bar.dart';

class LanguageView extends StatefulWidget {
  const LanguageView({super.key});

  @override
  State<LanguageView> createState() => _LanguageViewState();
}

class _LanguageViewState extends State<LanguageView> {
  String selectedLanguage = 'English';
  List<String> filteredLanguages = [];

  @override
  void initState() {
    super.initState();
    filteredLanguages = languagesList;
  }

  void _filterLanguages(String query) {
    setState(() {
      filteredLanguages = languagesList
          .where((language) =>
              language.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, title: "Language"),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsetsDirectional.symmetric(
              horizontal: 16, vertical: 10),
          child: Column(
            children: [
              SearchForLanguageTextField(
                onChanged: _filterLanguages,
              ),
              const SizedBox(height: 26),
              Expanded(
                child: Padding(
                  padding: const EdgeInsetsDirectional.symmetric(horizontal: 8),
                  child: ListView.builder(
                    itemCount: filteredLanguages.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          ListTile(
                            contentPadding: EdgeInsets.zero,
                            visualDensity: VisualDensity.compact,
                            title: Text(filteredLanguages[index]),
                            trailing: Radio<String>(
                              materialTapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap,
                              activeColor: AppColors.primary,
                              fillColor: WidgetStateProperty.resolveWith<Color>(
                                (Set<WidgetState> states) {
                                  if (states.contains(WidgetState.selected)) {
                                    return AppColors.primary;
                                  }
                                  return AppColors.rememberMe;
                                },
                              ),
                              value: filteredLanguages[index],
                              groupValue: selectedLanguage,
                              onChanged: (String? value) {
                                if (value != null) {
                                  setState(() {
                                    selectedLanguage = value;
                                  });
                                }
                              },
                            ),
                          ),
                          const Divider(
                            color: AppColors.textFieldBorder,
                          )
                        ],
                      );
                    },
                  ),
                ),
              ),
              CustomAuthBtn(
                onPressed: () {
                  context.pop();
                },
                text: "Save",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
