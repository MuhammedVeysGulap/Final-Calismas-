import 'package:flutter/material.dart';
import 'package:flutter_application_finalodevi/api/get/appointment_page_view.dart';
import 'package:flutter_application_finalodevi/api/insert/sign_up.dart';
import 'package:flutter_application_finalodevi/constants/work_const.dart';
import 'package:flutter_application_finalodevi/views/info_page_view.dart';
import 'package:flutter_application_finalodevi/widgets/sizedbox_elevatedbutton.dart';
import 'package:flutter_application_finalodevi/widgets/tabbarlearn_bottomnavigation.dart';
import 'package:flutter_application_finalodevi/widgets/text_caption.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late String username;
  late String password;
  final _formKey = GlobalKey<FormState>();
  final double imageElevatedButtonHeightWidth=30;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //TEXT FORM FİELDLARIMDA EMAİL ŞİFRE GİRİLMEYİP ELEVATED BUTTONA TIKLANMASI HALİNDE FARKLI,
      //YANLIŞ EMAİL VE ŞİFRE GİRİLMESİ DURUMUNDA FARKLI SENARYO VARDIR
      //AYRICA SİGN UP BUTTONUNUN KULLANILMASI DURUMUNDA YENİ BİR KAYIT PANELİNE YÖNLENDİRİLECEKSİNİZ
      //YÖNLENDİRİLECEĞİNİZ SAYFADA APİ INSERT KULLANILMIŞTIR
      //EMAİL ADRESİ VE ŞİFREYİ DOĞRU GİRMENİZ HALİNDE İSE FARKLI BİR SAYFAYA GÖNDERİLECEKSİNİZ BU SAYFADA İSE GET KULLANILMIŞTIR
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _titleimage(context),
                _title(context),
                FinalWorkConst.sizeboxHeight10,
                _context(),
                FinalWorkConst.sizeboxHeight30,
                _textFormFieldEmail(),
                FinalWorkConst.sizeboxHeight10,
                _textFormFieldPassword(),
                FinalWorkConst.sizeboxHeight10,
                _forgotPasswordText(),
                 FinalWorkConst.sizeboxHeight10,
                _clipRectSizedBoxElevatedButton(context),
               FinalWorkConst.sizeboxHeight30,
                _connectUsingTest(),
                FinalWorkConst.sizeboxHeight20,
                _rowFacebookAndGoogle(),
                FinalWorkConst.sizeboxHeight20,
                _rowTextAndMaterialButton(context)
              ],
            ),
          )),
    );
  }

  Row _rowTextAndMaterialButton(BuildContext context) {
    return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextCaption(
                      text: FinalWorkConst.textAccount, color: FinalWorkConst.colorBlack),
                  FinalWorkConst.sizeboxWidth3,
                  MaterialButton(
                      onPressed: () {
                        Navigator.of(context)
                            .pushReplacement(MaterialPageRoute(
                          builder: (context) => NewAccountPage(),
                        ));
                      },
                      child: TextCaption(text: FinalWorkConst.textSignUp, color: FinalWorkConst.colorBlue))
                ],
              );
  }

  Row _rowFacebookAndGoogle() {
    return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBoxElevatedButton(
                      text: FinalWorkConst.textFacebook,
                      color: FinalWorkConst.colorWhite,
                      backgroundcolor: FinalWorkConst.colorFacebook,
                      image: Image.asset(
                        FinalWorkConst.imageFacebook,
                        height: imageElevatedButtonHeightWidth,
                        width: imageElevatedButtonHeightWidth,
                      )),
                  SizedBox(
                    width: 10,
                  ),
                  SizedBoxElevatedButton(
                    text: FinalWorkConst.textGoogle,
                    color:FinalWorkConst.colorWhite,
                    backgroundcolor: FinalWorkConst.colorGoogle,
                    image: Image.asset(
                      FinalWorkConst.imageGoogle,
                      height: imageElevatedButtonHeightWidth,
                      width: imageElevatedButtonHeightWidth,
                    ),
                  )
                ],
              );
  }

  TextCaption _connectUsingTest() {
    return TextCaption(
                  text: FinalWorkConst.connect,
                  color: FinalWorkConst.colorConnect);
  }

  ClipRRect _clipRectSizedBoxElevatedButton(BuildContext context) {
    return ClipRRect(
                borderRadius: FinalWorkConst.borderRadiusCircular100,
                child: SizedBox(
                    height: MediaQuery.of(context).size.height / 15,
                    width: MediaQuery.of(context).size.width / 3,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          if (username == 'abc@mail.com' &&
                              password == '123456') {
                            debugPrint('Login succesful');
                            Navigator.of(context)
                                .pushReplacement(MaterialPageRoute(
                              builder: (context) => BottomNavigationBarView(),
                            ));
                          } else {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.crisis_alert,
                                          color: FinalWorkConst.colorRed,
                                        ),
                                        FinalWorkConst.sizeboxWidth10,
                                        Text(
                                          'Error',
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline6
                                              ?.copyWith(
                                                  color: FinalWorkConst.colorBlack,
                                                  fontWeight:
                                                      FontWeight.bold),
                                          textAlign: TextAlign.left,
                                        )
                                      ],
                                    ),
                                    content: Row(
                                      children: [
                                        Icon(
                                          Icons.diamond_sharp,
                                          color: FinalWorkConst.colorBlue,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          'You entered your email address or \npassword incorrectly,\nplease try again.',
                                          style: Theme.of(context)
                                              .textTheme
                                              .overline
                                              ?.copyWith(
                                                  color: FinalWorkConst.colorBlack,
                                                  fontWeight:
                                                      FontWeight.bold),
                                          textAlign: TextAlign.left,
                                        )
                                      ],
                                    ),
                                  );
                                });
                          }
                        }
                      },
                      child: Text('LOG IN'),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: FinalWorkConst.colorLoginElevatedButton,
                    ))),
              );
  }

  Row _forgotPasswordText() {
    return Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  MaterialButton(
                      onPressed: () {},
                      child: TextCaption(
                          text: 'Forgot Password?', color: FinalWorkConst.colorBlack))
                ],
              );
  }

  TextFormField _textFormFieldPassword() {
    return TextFormField(
                maxLength: 6,
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FinalWorkConst.colorBlue,
                        ),
                        borderRadius: FinalWorkConst.borderRadiusCircular50),
                    prefixIcon: Icon(
                      Icons.lock,
                    ),
                    labelText: 'Password',
                    border: OutlineInputBorder(
                        borderRadius: FinalWorkConst.borderRadiusCircular100
                        )),
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                validator: ((passwordValidatorvalue) {
                  if (passwordValidatorvalue!.isEmpty) {
                    return 'Please enter your password';
                  } else {
                    return null;
                  }
                }),
                onSaved: (passwordSaveValue) {
                  password = passwordSaveValue!;
                },
              );
  }

  TextFormField _textFormFieldEmail() {
    return TextFormField(
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color:FinalWorkConst.colorBlue,
                      ),
                      borderRadius: FinalWorkConst.borderRadiusCircular50,
                    ),
                    prefixIcon: Icon(
                      Icons.person,
                    ),
                    labelText: 'E-mail Address',
                    border: OutlineInputBorder(
                        borderRadius: FinalWorkConst.borderRadiusCircular100)),
                keyboardType: TextInputType.emailAddress,
                validator: ((mailValidatorValue) {
                  if (mailValidatorValue!.isEmpty) {
                    return 'Please enter your email address';
                  } else {
                    return null;
                  }
                }),
                onSaved: (mailSaveValue) {
                  username = mailSaveValue!;
                },
              );
  }

  TextCaption _context() {
    return TextCaption(
                  text: FinalWorkConst.textLoginContext,
                  color: FinalWorkConst.colorGrey);
  }

  Text _title(BuildContext context) {
    return Text(
                FinalWorkConst.textLogintitle,
                style: Theme.of(context).textTheme.headline5?.copyWith(
                    color: Colors.black, fontWeight: FontWeight.bold),
              );
  }

  Container _titleimage(BuildContext context) {
    return Container(
                  height: MediaQuery.of(context).size.height / 4,
                  width: MediaQuery.of(context).size.width,
                  child: Image.asset(
                    FinalWorkConst.titleImage,
                    fit: BoxFit.cover,
                  ));
  }
}
