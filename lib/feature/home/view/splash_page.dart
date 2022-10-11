import '../../../core/_core_exports.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 3), () {
      Go.to.pageAndRemoveUntil(PageRoutes.bottomNavigationPage);
    });
  }

  @override
  Widget build(BuildContext context) {
    ScreenSize().screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(AssetsPath().logoSVG),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 36),
            child: Text(
              'Get News!',
              style: TextStyle(fontSize: 24),
            ),
          ),
          const SpinKitThreeBounce(color: Colors.grey),
        ],
      ),
    );
  }
}
