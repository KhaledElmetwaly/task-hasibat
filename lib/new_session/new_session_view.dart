part of 'new_session_imports.dart';

class NewSessionView extends StatefulWidget {
  const NewSessionView({super.key});

  @override
  State<NewSessionView> createState() => _NewSessionViewState();
}

class _NewSessionViewState extends State<NewSessionView> {
  final NewSessionData newSessionData = NewSessionData();
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      hasAppBar: true,
      title: AppStrings.new_session,
      body: NewSessionsBody(newSessionData: newSessionData),
    );
  }
}
