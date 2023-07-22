//TODO: add your view model class here
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:know_our_school/Model/model.dart';
import 'package:know_our_school/ViewModel/states.dart';

class CubitClass extends Cubit<SchoolStates>{

  CubitClass():super(InitialStates());

  static CubitClass get(context)=>BlocProvider.of(context);

  String schoolName = "School Name";
  String schoolAddress = "School Address";
  String studentsNo = "Number of Students";
  String teachersNo = "Number of Teachers";

  DataModel? dataModel;

  getDataFromModel()async{
    await rootBundle.loadString("lib/JSONdata/SchoolData.json").then((value){
      dataModel = DataModel.fromjson(json.decode(value)[0]);
      loadDataToUiScreen();
    });

  }

  loadDataToUiScreen(){

    if(dataModel!=null){
      this.schoolName = dataModel!.schoolName!;
      this.schoolAddress = dataModel!.schoolAddress!;
      this.studentsNo = dataModel!.numberOfStudents!;
      this.teachersNo = dataModel!.numberOfTeachers!;
    }

    emit(LoadingDataModel());
  }
}