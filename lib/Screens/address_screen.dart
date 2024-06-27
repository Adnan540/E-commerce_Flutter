
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Components/text_form.dart';
import '../Providers/address_provider.dart';


class AddressScreen extends StatefulWidget {
  const AddressScreen({Key? key}) : super(key: key);

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}
final _formKey = GlobalKey<FormState>();

class _AddressScreenState extends State<AddressScreen> {
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController addLine1 = TextEditingController();
  TextEditingController addLine2 = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController state = TextEditingController();
  TextEditingController country = TextEditingController();
  TextEditingController zipCode = TextEditingController();

  @override
  Widget build(BuildContext context) {
    AddressProvider _addressProvider = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Row(
          children: [
            Icon(Icons.location_on_outlined,color: Color(0xff232476)),
            SizedBox(width: 10,),
            Text("Add your address",style: TextStyle(color: Colors.black)),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(23.0),
        child: Form(
          key: _formKey,

          child: ListView(
            children: [
              /**First name**/
              TextForm(
                validator:(value){
                  if(value!.isEmpty){
                    return "please enter your first name";
                  }
                  return null;
                },
                hintText: "First name",
                controller:firstName ,
              ),
              SizedBox(height: 10,),
              /**Last name***/
              TextForm(
                validator:(value){
                  if(value!.isEmpty){
                    return "please enter your last name";
                  }
                  return null;
                },
                hintText: "Last name",
                controller:lastName ,
              ),
              SizedBox(height: 10,),
              /**Add line1**/
              TextForm(
                validator:(value){
                  if(value!.isEmpty){
                    return "please enter address line1";
                  }
                  return null;
                },
                hintText: "Address line1",
                controller:addLine1 ,
              ),
              SizedBox(height: 10,),
              /**Add line2**/
              TextForm(
                validator:(value){
                  if(value!.isEmpty){
                    return "please enter your first name";
                  }
                  return null;
                },
                hintText: "Address line2",
                controller:addLine2 ,
              ),
              SizedBox(height: 10,),
              /**Country**/
              TextForm(
                validator:(value){
                  if(value!.isEmpty){
                    return "please enter your first name";
                  }
                  return null;
                },
                hintText: "Country",
                controller:country,
              ),
              SizedBox(height: 10,),
              /**City**/
              TextForm(
                validator:(value){
                  if(value!.isEmpty){
                    return "please enter your first name";
                  }
                  return null;
                },
                hintText: "City",
                controller:city ,
              ),
              SizedBox(height: 10,),
              /***State**/
              TextForm(
                validator:(value){
                  if(value!.isEmpty){
                    return "please enter your first name";
                  }
                  return null;
                },
                hintText: "State",
                controller:state ,
              ),
              SizedBox(height: 10,),
              /**zipCode**/
              TextForm(
                validator:(value){
                  if(value!.isEmpty){
                    return "please enter your first name";
                  }
                  return null;
                },
                hintText: "ZipCode",
                controller:zipCode ,
              ),
              SizedBox(height: 13,),
              ElevatedButton(
                child: Text("Add address"),
                onPressed: () async {
                  if(_formKey.currentState!.validate()){
                    _addressProvider.addAddress(
                        firstName.text,
                        lastName.text,
                        addLine1.text,
                        addLine2.text,
                        city.text,
                        state.text,
                        zipCode.text,
                        country.text
                    );
                  }

                },
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Color(0xff232476))
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
