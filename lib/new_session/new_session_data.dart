part of 'new_session_imports.dart';

class NewSessionData {
  final GenericBloc<List<TextEditingController>> playerContactBloc =
      GenericBloc([]);
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void pickContact(BuildContext context) async {
    final PhoneContact playerContact =
        await FlutterContactPicker.pickPhoneContact();
    if (playerContactBloc.state.data
        .any((element) => element.text == playerContact.phoneNumber!.number)) {
      playerContactBloc.onFailedResponse();
      return;
    }
    playerContactBloc.state.data.add(
      TextEditingController(text: playerContact.phoneNumber!.number),
    );

    playerContactBloc.onUpdateData(playerContactBloc.state.data);
  }

  void removeContactFromSessionList(int index) {
    playerContactBloc.state.data.removeAt(index);
    playerContactBloc.onUpdateData(playerContactBloc.state.data);
  }
}
