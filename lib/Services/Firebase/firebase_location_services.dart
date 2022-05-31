import 'package:kids_tracking_app/Constants/network_objects.dart';

updateUserLocationToFirebase({required currentLocation}) async {
  try {
    if (firebaseAuth.currentUser != null)
      await firebaseFirestore
          .collection("Coordinates")
          .doc(firebaseAuth.currentUser!.email)
          .set({
        "latitude": currentLocation.latitude,
        "longitude": currentLocation.longitude,
      });
  } catch (e) {
    print("generating error from updateUserLocationToFirebase method");
    print(e.toString());
  }
}
