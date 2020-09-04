/*
* This class keeps track of the user related data that the app needs to show
* constantly so it is more organized and scalable
*/

class UserData {
  UserData({this.authToken, this.selectedCharName, this.uName, this.id});
  final String uName;
  final String authToken;
  final String selectedCharName;
  final int id;
}
