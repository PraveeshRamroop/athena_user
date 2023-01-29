import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:firebase_core/firebase_core.dart';

const GOOGLE_MAPS_API_KEY = "AIzaSyC_MPgcB-GAIUYap_caF_lQdB1UqFIEhMg";
const COUNTRY = "country";

final Future<FirebaseApp> initialization = Firebase.initializeApp();

FirebaseFirestore firebaseFiretore = FirebaseFirestore.instance;
FirebaseAuth auth = FirebaseAuth.instance;
FirebaseMessaging fcm = FirebaseMessaging.instance;
GoogleMapsPlaces places = GoogleMapsPlaces(apiKey: GOOGLE_MAPS_API_KEY);
