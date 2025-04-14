import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  Map<String, dynamic> userInfo = {
    "user_id": "rostom1234",
    "name": "Rostom ALi",
    "email": "rostom826@gmail.com",
    "image":
        "https://media.istockphoto.com/id/1682296067/photo/happy-studio-portrait-or-professional-man-real-estate-agent-or-asian-businessman-smile-for.jpg?s=612x612&w=0&k=20&c=9zbG2-9fl741fbTWw5fNgcEEe4ll-JegrGlQQ6m54rg=",
  };

  Future<void> getProfileData() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      throw Exception("No User Credential");
    }
    userInfo["name"] = user?.displayName;
    userInfo["email"] = user?.email;
    userInfo["image"] = user?.photoURL;
    userInfo["user_id"] = user?.uid;

    print(userInfo);
    update();
  }
}
