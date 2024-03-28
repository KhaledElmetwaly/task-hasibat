part of 'new_session_widgets_imports.dart';

class NewSessionsBody extends StatelessWidget {
  final NewSessionData newSessionData;

  const NewSessionsBody({
    super.key,
    required this.newSessionData,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(shrinkWrap: true, children: [
      NewSessionCard(
        newSessionData: newSessionData,
      ),
    ]);
  }
}
