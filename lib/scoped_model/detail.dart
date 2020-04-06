import 'package:covidata/model/travel.dart';
import 'package:scoped_model/scoped_model.dart';

class Detail extends Model {
  String gender;
  Travel travel = Travel();

  bool travelComingHome = false;
  int placesTravelComingHome = 0;
  int peopleAcrossComingHome = 0;

  List<Travel> comingHomeTravel;

  int fever = 0;
  int cold = 0;
  int cough = 0;
  int bodyPain = 0;
  int soreThrote = 0;
  int breathingDifficulty = 0;


  
}
