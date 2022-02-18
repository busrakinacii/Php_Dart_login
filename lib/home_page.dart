import 'package:flutter/material.dart';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;
import 'package:test_proje/login_page.dart';
import 'package:test_proje/services/my_services.dart';

class Home_Page extends StatefulWidget {
  const Home_Page({Key? key}) : super(key: key);

  @override
  _Home_Page createState() => _Home_Page();
}

class _Home_Page extends State<Home_Page> {
  bool sifre = true;
  Color? sifrecolor = Colors.green;

  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _surnameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _sectionController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _birthdayController = TextEditingController();


  bool checkBoxState = false;

  bool isImageLoaded = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _surnameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _sectionController.dispose();
    _addressController.dispose();
    _phoneController.dispose();
    _birthdayController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('ÖĞRENCİ KAYIT FORMU'),
          backgroundColor: Colors.green,
          elevation: 20,
          shadowColor: Colors.green,
          centerTitle: true
          ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                   const SizedBox(
                height: 50,
              ),
              Text(
                "KAYIT SAYFASI",
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
                Align(
                  alignment: Alignment.center,
                  child: Stack(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.green,
                        ),

                        /*child: CircleAvatar(
                          backgroundColor: Colors.transparent,
                          radius: 70,
              
                        ),*/
                      ),
                    
                    ],
                  ),
                ),
                Padding(padding: const EdgeInsets.all(15.0)),
                TextFormField(
                    controller: _nameController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelStyle: TextStyle(
                        color: Colors.black,
                      ),
                      labelText: 'Adınız',
                      hintText: 'Adı',
                      prefixIcon: Icon(Icons.person_pin, color: Colors.green),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: BorderSide(
                            color: Colors.black,
                          )),
                    ),
                      
                    validator: (deger) {
                      if (deger != null && 
                      deger.isNotEmpty && 
                      deger.length > 20) if (deger.split(' ').length > 1)
                        return null;
                      else
                        return 'Zorunlu Alan';
                    }),
                   Padding(padding: const EdgeInsets.all(15.0)),
                   TextFormField(
                    controller: _surnameController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelStyle: TextStyle(
                        color: Colors.black,
                      ),
                      labelText: 'Soyadınız',
                      hintText: 'Soyad',
                      prefixIcon: Icon(Icons.person_pin, color: Colors.green),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: BorderSide(
                            color: Colors.black,
                          )),
                    ),
                      
                    validator: (deger) {
                      if (deger != null && 
                      deger.isNotEmpty && 
                      deger.length > 15) if (deger.split(' ').length > 1)
                        return null;
                      else
                        return 'Zorunlu Alan';
                    }),


                Padding(padding: const EdgeInsets.all(7.0)),
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelStyle: TextStyle(
                      color: Colors.black,
                    ),
                    labelText: 'Email',
                    hintText: 'Email',
                    prefixIcon: Icon(Icons.mail, color: Colors.green),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: BorderSide(
                          color: Colors.black,
                        )),
                  ),
                  validator: (mail) {
                    if (mail!.isEmpty) {
                      return null;
                    } else if (!EmailValidator.validate(mail)) {
                      return 'Geçerli Mail Giriniz.';
                    } else
                      return null;
                  },
                ),
                Padding(padding: const EdgeInsets.all(7.0)),
                TextFormField(
                  controller: _passwordController,
                  keyboardType: TextInputType.text,
                  obscureText: sifre,
                  decoration: InputDecoration(
                    labelStyle: TextStyle(
                      color: Colors.black,
                    ),
                    labelText: 'Şifre',
                    hintText: 'Şifre',
                    suffixIcon: IconButton(
                      icon: Icon(
                        Icons.remove_red_eye,
                        color: sifrecolor,
                      ),
                      onPressed: () {
                        setState(() {
                          sifre = !sifre;
                          sifre
                              ? sifrecolor = Colors.grey
                              : sifrecolor = Colors.green;
                        });
                      },
                    ),
                    prefixIcon: Icon(Icons.vpn_key, color: Colors.green),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: BorderSide(
                          color: Colors.black,
                        )),
                  ),
                   autocorrect: false,
                        validator: (deger) {
                          if (deger != null && deger.isNotEmpty) if (deger.length >= 6) {
                            return null;
                          } else
                            return 'Şifre en az 6 karakterden oluşmalıdır!';
                          else
                            return null;
                        },
                ),
            
              Padding(padding: const EdgeInsets.all(15.0)),
                TextFormField(
                    controller: _sectionController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelStyle: TextStyle(
                        color: Colors.black,
                      ),
                      labelText: 'Bölümünüz',
                      hintText: 'Bölüm',
                      prefixIcon: Icon(Icons.person_pin, color: Colors.green),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: BorderSide(
                            color: Colors.black,
                          )),
                    ),
                      
                    validator: (deger) {
                      if (deger != null && 
                      deger.isNotEmpty && 
                      deger.length > 20) if (deger.split(' ').length > 1)
                        return null;
                      else
                        return 'Zorunlu Alan';
                    }),
                      Padding(padding: const EdgeInsets.all(15.0)),
                   TextFormField(
                    controller: _addressController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelStyle: TextStyle(
                        color: Colors.black,
                      ),
                      labelText: 'Adresiniz',
                      hintText: 'Adres',
                      prefixIcon: Icon(Icons.person_pin, color: Colors.green),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: BorderSide(
                            color: Colors.black,
                          )),
                    ),
                      
                    validator: (deger) {
                      if (deger != null && 
                      deger.isNotEmpty && 
                      deger.length > 15) if (deger.split(' ').length > 1)
                        return null;
                      else
                        return 'Zorunlu Alan';
                    }),


                   Padding(padding: const EdgeInsets.all(7.0)),
                TextFormField(
                  controller: _phoneController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelStyle: TextStyle(
                      color: Colors.black,
                    ),
                    labelText: 'Telefon',
                    hintText: '0(___)___ __ __',
                    prefixIcon: Icon(Icons.phone, color: Colors.green),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: BorderSide(
                          color: Colors.black,
                        )),
                  ),
                  validator: (s) {
                    if (s != null && s.isNotEmpty && s.length == 11)
                      return null;
                    else
                      return 'Zorunlu Alan';
                  },
                ),

                   Padding(padding: const EdgeInsets.all(7.0)),
                TextFormField(
                  controller: _birthdayController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelStyle: TextStyle(
                      color: Colors.black,
                    ),
                    labelText: 'Doğum Tarihiniz',
                    hintText: 'Doğum Tarihi',
                    prefixIcon: Icon(Icons.backpack, color: Colors.green),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: BorderSide(
                          color: Colors.black,
                        )),
                  ),
                  validator: (s) {
                    if (s != null && s.isNotEmpty && s.length == 10)
                      return null;
                    else
                      return 'Zorunlu Alan';
                  },
                ),

                Padding(padding: const EdgeInsets.all(7.0)),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ElevatedButton(
                    child: Text(
                      "Kaydol",
                      style: TextStyle(color: Colors.black),
                    ),
                    onPressed: ()  {
                     if (_formKey.currentState!.validate()) {
                  registerServis(_nameController.text,_surnameController.text,_emailController.text, _passwordController.text,_sectionController.text,_addressController.text,_phoneController.text,_birthdayController.text)
                      .then<dynamic>((dynamic value) {         
                    if (value != null ) {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Home_Page()));
                           EasyLoading.showSuccess("Başarılı Giriş",
                          dismissOnTap: true);                      
                    } else {
                        showDialog(
                          barrierDismissible: false,
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text("HATA"),
                              content: Text("Bilgilerinizi Doğru Giriniz."),
                              actions: <Widget>[
                                MaterialButton(
                                  child: Text("Geri Dön"),
                                  onPressed: () => Navigator.pop(context),
                                )
                              ],
                            );
                          });
                    }
                  });
                }
                    },
                    style: ElevatedButton.styleFrom(
                        primary: Colors.green,
                        padding:
                            EdgeInsets.symmetric(horizontal: 50, vertical: 7),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0)),
                        textStyle: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
  Future<dynamic> registerServis(String username,String usersurname,String email,String password,String section,String address,String phone,String birthday) async {
    if (_formKey.currentState!.validate()) {
      dynamic response = await MyService.registerServis(username,usersurname,email,password,section,address,phone,birthday);
      return response;
    }
  }
}

