part of 'new_session_widgets_imports.dart';

class SessionForm extends StatelessWidget {
  final NewSessionData newSessionData;
  const SessionForm({super.key, required this.newSessionData});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: ListView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Row(
            children: [
              Text(
                AppStrings.pick_number_from_contact,
                style: TextStyleManager.primaryStyle.copyWith(
                  decoration: TextDecoration.underline,
                  color: ColorManager.black,
                ),
              ),
              IconButton(
                onPressed: () => newSessionData.pickContact(context),
                iconSize: AppSize.sH14,
                icon: const Icon(Icons.arrow_back_ios_new),
              ),
            ],
          ),
          BlocBuilder<GenericBloc<List<TextEditingController>>,
              GenericState<List<TextEditingController>>>(
            bloc: newSessionData.playerContactBloc,
            builder: (context, state) {
              return Form(
                key: newSessionData.formKey,
                child: ListView(
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  children: state.data
                      .map((e) => CustomTextField(
                            prefixWidget: Text(
                              " ${AppStrings.player_number} ${state.data.indexOf(e) + 1} :",
                              style: TextStyleManager.titleStyle
                                  .copyWith(color: ColorManager.black),
                            ),
                            margin: EdgeInsets.only(top: AppMargin.mH10),
                            // enableBorderColor: ColorManager.primary,
                            // focusBorderColor: ColorManager.primary,
                            // autoFocus: true,
                            fieldTypes: FieldTypes.normal,
                            suffixWidget: IconButton(
                              visualDensity: VisualDensity.compact,
                              padding: EdgeInsets.zero,
                              color: ColorManager.black,
                              onPressed: () {
                                newSessionData.removeContactFromSessionList(
                                    state.data.indexOf(e));
                              },
                              icon: const Icon(
                                Icons.clear_sharp,
                                size: 15,
                              ),
                            ),
                            type: TextInputType.number,
                            controller: e,
                            action: TextInputAction.next,
                            validate: (value) => value!.validateUniqueNumber(
                                contact: value,
                                usedNumbers:
                                    state.data.map((e) => e.text).toList()),
                          ))
                      .toList(),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
