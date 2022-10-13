import 'package:flutter/material.dart';
import 'package:flutter_application_finalodevi/constants/work_const.dart';
import 'package:flutter_application_finalodevi/views/login_page_view.dart';

class InfoPage extends StatefulWidget {
  const InfoPage({super.key});

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  final String skip = 'Skip';
  final String next = 'Next';
  final double bigContainerHeight = 1.1;
  final controller = PageController(initialPage: 0);
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
//SKİP BUTTONUNA BASILDIĞINDA FARKLI BİR SAYFAYA YÖNLENDİRİLİRKEN NEXT BUTTONU KULLANILDIĞINDA RESİM DEĞİŞMEKTEDİR.

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [
            MaterialButton(
              onPressed: () =>
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => LoginPage(),
              )),
              child: Text(
                skip,
                style: TextStyle(color: FinalWorkConst.colorBlue),
              ),
            )
          ],
        ),
        body: PageView(
          scrollDirection: Axis.horizontal,
          onPageChanged: (index) {
            Text('Page ${index + 1}');
          },
          controller: controller,
          children: [
            _firstBigCard(context),
            _secondBigCard(context),
            _thirdBigCard(context)
          ],
        ));
  }

  Padding _thirdBigCard(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 50),
      child: Container(
        height: MediaQuery.of(context).size.height / bigContainerHeight,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                SizedBox(
                    height: MediaQuery.of(context).size.height / 1.5,
                    width: MediaQuery.of(context).size.width,
                    child: Image.asset(FinalWorkConst.cardImageThree)),
                Text(
                  FinalWorkConst.textInfoTitle,
                  style: Theme.of(context).textTheme.headline5?.copyWith(
                      color: FinalWorkConst.colorBlack,
                      fontWeight: FontWeight.w600),
                  textAlign: TextAlign.center,
                ),
                FinalWorkConst.sizeboxHeight20,
                Text(
                  FinalWorkConst.textInfoContext,
                  style: TextStyle(
                    color: FinalWorkConst.contextColor,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MaterialButton(
                  onPressed: () => controller.nextPage(
                      duration: Duration(seconds: 1), curve: Curves.easeInOut),
                  child: Text(
                    next,
                    style: TextStyle(color: FinalWorkConst.colorBlue),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Padding _secondBigCard(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 50),
      child: Container(
        height: MediaQuery.of(context).size.height / bigContainerHeight,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                SizedBox(
                    height: MediaQuery.of(context).size.height / 1.5,
                    width: MediaQuery.of(context).size.width,
                    child: Image.asset(
                      FinalWorkConst.cardImageTwo,
                    )),
                Text(
                  FinalWorkConst.textInfoTitle,
                  style: Theme.of(context).textTheme.headline5?.copyWith(
                      color: Colors.black, fontWeight: FontWeight.w600),
                  textAlign: TextAlign.center,
                ),
                FinalWorkConst.sizeboxHeight20,
                Text(
                  FinalWorkConst.textInfoContext,
                  style: TextStyle(
                    color: FinalWorkConst.contextColor,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MaterialButton(
                  onPressed: () => controller.nextPage(
                      duration: Duration(seconds: 1), curve: Curves.easeInOut),
                  child: Text(
                    next,
                    style: TextStyle(color: FinalWorkConst.colorBlue),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Padding _firstBigCard(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 50),
      child: Container(
        height: MediaQuery.of(context).size.height / bigContainerHeight,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                SizedBox(
                    height: MediaQuery.of(context).size.height / 1.5,
                    width: MediaQuery.of(context).size.width,
                    child: Image.asset(
                      FinalWorkConst.cardImageOne,
                    )),
                Text(
                  FinalWorkConst.textInfoTitle,
                  style: Theme.of(context).textTheme.headline5?.copyWith(
                      color: FinalWorkConst.colorBlack,
                      fontWeight: FontWeight.w600),
                  textAlign: TextAlign.center,
                ),
                FinalWorkConst.sizeboxHeight20,
                Text(
                  FinalWorkConst.textInfoContext,
                  style: TextStyle(
                    color: FinalWorkConst.contextColor,
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MaterialButton(
                  onPressed: () => controller.nextPage(
                      duration: Duration(seconds: 1), curve: Curves.easeInOut),
                  child: Text(
                    next,
                    style: TextStyle(color: FinalWorkConst.colorBlue),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
