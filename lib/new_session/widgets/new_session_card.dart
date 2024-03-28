part of 'new_session_widgets_imports.dart';

class NewSessionCard extends StatelessWidget {
  final NewSessionData newSessionData;
  const NewSessionCard({
    super.key,
    required this.newSessionData,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<GenericBloc<List<TextEditingController>>,
        GenericState<List<TextEditingController>>>(
      bloc: newSessionData.playerContactBloc,
      listener: (context, state) {
        if (state is GenericFailedState) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: ColorManager.primary,
            content: const Text(AppStrings.cant_choose_same_number_more_than_once),
          ));
        }
      },
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: AppPadding.pW14,
            vertical: AppPadding.pH20,
          ),
          margin: EdgeInsets.symmetric(vertical: AppMargin.mH10),
          width: MediaQuery.of(context).size.width * .92,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppPadding.pW14,
              vertical: AppPadding.pH20,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //---------------------------- logo ---------------------------------------
                Image.asset(
                  AssetsManager.logo,
                  width: MediaQuery.of(context).size.width * .4,
                  height: MediaQuery.of(context).size.height * .15,
                ),
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: Row(
                    children: [
                      Text(
                        AppStrings.new_session,
                        style: TextStyleManager.titleStyle,
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        "/ ${AppStrings.add_players_contact}",
                        style: TextStyleManager.titleStyle,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                // --------------------------session form-------------------------
                SessionForm(
                  newSessionData: newSessionData,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
