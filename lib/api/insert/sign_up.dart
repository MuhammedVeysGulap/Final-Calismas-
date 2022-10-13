import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_finalodevi/api/insert/insert_model.dart';
import 'package:flutter_application_finalodevi/constants/work_const.dart';
import 'package:flutter_application_finalodevi/views/login_page_view.dart';
import 'package:flutter_application_finalodevi/widgets/tabbarlearn_bottomnavigation.dart';

class NewAccountPage extends StatefulWidget {
  const NewAccountPage({super.key});

  @override
  State<NewAccountPage> createState() => _NewAccountPageState();
}

class _NewAccountPageState extends State<NewAccountPage> {
  TextEditingController _textEditingController = TextEditingController();
  TextEditingController _bodyEditingController = TextEditingController();
  TextEditingController _sifreEditingController = TextEditingController();
  late final Dio _dio;
  String _baseUrl = 'https://jsonplaceholder.typicode.com/';
  bool _isLoading = false;

  /// Dio'nun baseUrl'ni tanımlama işlemini burada yaptık.
  @override
  void initState() {
    super.initState();
    _dio = Dio(BaseOptions(baseUrl: _baseUrl));
  }

  void _isLoadingChek() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  Future<void> insertApi(PostModel model) async {
    _isLoadingChek();
    final response = await _dio.post('posts', data: model);
    if (response.statusCode == HttpStatus.created) {
      print('Registration successful');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: 
      AppBar(backgroundColor: Colors.transparent,elevation: 0,
        leading: IconButton(onPressed: (){ Navigator.of(context)
                                  .pushReplacement(MaterialPageRoute(
                                builder: (context) => LoginPage(),
                              ));}, icon: Icon(Icons.keyboard_backspace_rounded,color: Colors.black,)),),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

        TextField(
          
        decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FinalWorkConst.colorBlue,
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
          controller: _textEditingController,
        ),
        FinalWorkConst.sizeboxHeight10,
        TextField(
       decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FinalWorkConst.colorBlue,
                        ),
                        borderRadius: FinalWorkConst.borderRadiusCircular50,
                      ),
                      prefixIcon: Icon(
                        Icons.phone,
                      ),
                      labelText: 'Phone Number',
                      border: OutlineInputBorder(
                          borderRadius: FinalWorkConst.borderRadiusCircular100)),
                  keyboardType: TextInputType.number,
          controller: _bodyEditingController,
        ),
        FinalWorkConst.sizeboxHeight10,
        TextField(
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
                          borderRadius: FinalWorkConst.borderRadiusCircular100)),
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
          controller: _sifreEditingController,
        ),
        FinalWorkConst.sizeboxHeight5,
         TextField(
          maxLength: 6,
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.blue,
                          ),
                          borderRadius: BorderRadius.circular(50)),
                      prefixIcon: Icon(
                        Icons.lock_reset_sharp,
                      ),
                      labelText: 'Confirm Password',
                      border: OutlineInputBorder(
                          borderRadius: FinalWorkConst.borderRadiusCircular100)),
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
          controller: _sifreEditingController,
        ),
       FinalWorkConst.sizeboxHeight10,
        ClipRRect(
          borderRadius: FinalWorkConst.borderRadiusCircular100,
          child: SizedBox(
             height: MediaQuery.of(context).size.height / 15,
                        width: MediaQuery.of(context).size.width / 3,
            child: ElevatedButton(
                 style: ElevatedButton.styleFrom(
                            backgroundColor: FinalWorkConst.colorLoginElevatedButton,),
                onPressed: _isLoading
                    ? null
                    : () {
                        if (_textEditingController.text.isNotEmpty &&
                            _bodyEditingController.text.isNotEmpty &&
                            _sifreEditingController.text.isNotEmpty) {
                          final model = PostModel(
                              title: _textEditingController.text,
                              body: _bodyEditingController.text,
                              userId: int.tryParse(_sifreEditingController.text));
        
                          insertApi(model);
                        }
                         Navigator.of(context)
                                  .pushReplacement(MaterialPageRoute(
                                builder: (context) => BottomNavigationBarView(),
                              ));
                      },
              
                child: Text('Create')),
          ),
        )
      ]),
    );
  }
}
