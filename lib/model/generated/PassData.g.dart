//This is autogenerated file. All changes will be lost after code generation.
import 'package:nsg_data/nsg_data.dart';
import '../dataControllerModel.dart';
class PassDataGenerated extends NsgDataItem {
 static const name_number = 'number';
 static const name_issueDate = 'issueDate';
 static const name_issueBy = 'issueBy';
 static const name_firstName = 'firstName';
 static const name_secondName = 'secondName';
 static const name_lastName = 'lastName';

  @override
  void initialize() {
   addfield(NsgDataStringField(name_number), primaryKey: true);
   addfield(NsgDataDateField(name_issueDate), primaryKey: false);
   addfield(NsgDataStringField(name_issueBy), primaryKey: false);
   addfield(NsgDataStringField(name_firstName), primaryKey: false);
   addfield(NsgDataStringField(name_secondName), primaryKey: false);
   addfield(NsgDataStringField(name_lastName), primaryKey: false);
  }

  @override
  NsgDataItem getNewObject() => PassData();

String get number => getFieldValue(name_number).toString();
set number(String value) => setFieldValue(name_number, value);
DateTime get issueDate => getFieldValue(name_issueDate) as DateTime;
set issueDate(DateTime value) => setFieldValue(name_issueDate, value);
String get issueBy => getFieldValue(name_issueBy).toString();
set issueBy(String value) => setFieldValue(name_issueBy, value);
String get firstName => getFieldValue(name_firstName).toString();
set firstName(String value) => setFieldValue(name_firstName, value);
String get secondName => getFieldValue(name_secondName).toString();
set secondName(String value) => setFieldValue(name_secondName, value);
String get lastName => getFieldValue(name_lastName).toString();
set lastName(String value) => setFieldValue(name_lastName, value);

  @override
  String get apiRequestItems {
    return 'Api/Data/GetPassData';
  }
}