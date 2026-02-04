import 'package:cliniq/core/api/end_points.dart';

class DummyResponses {
  static dynamic getResponse(
    String path, {
    Map<String, dynamic>? queryParameters,
  }) {
    switch (path) {
      case EndPoints.login:
        return {
          "success": true,
          "message": "Login successful",
          "data": {
            "token": "dummy_access_token_123",
            "refreshToken": "dummy_refresh_token_456",
            "user": {
              "id": 1,
              "name": "Mohamed Ahmed",
              "email": "test@test.com",
              "role": "customer",
            },
          },
        };

      case EndPoints.getMe:
        return {
          "success": true,
          "data": {
            "id": 1,
            "name": "Mohamed Ahmed",
            "email": "test@test.com",
            "role": "customer",
          },
        };

      case EndPoints.userSignUp:
      case EndPoints.doctorSignUp:
        return {
          "success": true,
          "message": "Account created successfully",
          "data": {"email": "test@test.com"},
        };

      case EndPoints.verifyEmail:
      case EndPoints.resendVerifyEmail:
        return {"success": true, "message": "Verification email sent"};

      case EndPoints.forgetPassword:
      case EndPoints.resendResetCode:
        return {"success": true, "message": "Reset code sent"};

      case EndPoints.verifyResetCode:
        return {"success": true, "message": "Code verified"};

      case EndPoints.resetPassword:
        return {"success": true, "message": "Password reset successfully"};

      case EndPoints.logOut:
        return {"success": true, "message": "Logged out"};

      case EndPoints.specializations:
        return {
          "success": true,
          "message": "Specializations fetched successfully",
          "data": [
            {
              "id": "1",
              "name": "Cardiology",
              "image":
                  "https://img.freepik.com/free-vector/heart-attack-concept-illustration_114360-1014.jpg",
            },
            {
              "id": "2",
              "name": "Dermatology",
              "image":
                  "https://img.freepik.com/free-vector/skin-layer-diagram-medical-educational-poster_1308-59648.jpg",
            },
            {
              "id": "3",
              "name": "Neurology",
              "image":
                  "https://img.freepik.com/free-vector/brain-anatomy-concept-illustration_114360-1049.jpg",
            },
          ],
        };

      case EndPoints.suggestedDoctors:
        return {
          "success": true,
          "message": "Doctors fetched successfully",
          "data": [
            {
              "id": "1",
              "name": "Dr. Mohamed Ahmed",
              "image":
                  "https://img.freepik.com/free-photo/doctor-with-his-arms-crossed-white-background_1368-5790.jpg",
              "speciality": "Cardiology",
              "experience": "10 years",
              "rating": "4.5",
              "numberOfAppointments": "100",
              "city": "Cairo",
            },
            {
              "id": "2",
              "name": "Dr. Ahmed Mohamed",
              "image":
                  "https://img.freepik.com/free-photo/portrait-successful-mid-adult-doctor-with-crossed-arms_1262-12865.jpg",
              "speciality": "Dermatology",
              "experience": "5 years",
              "rating": "4.0",
              "numberOfAppointments": "50",
              "city": "Alexandria",
            },
          ],
        };

      case EndPoints.news:
        return {
          "success": true,
          "message": "News fetched successfully",
          "data": [
            {
              "id": "1",
              "title": "New COVID-19 Variant",
              "image":
                  "https://img.freepik.com/free-vector/virus-strain-model-novel-coronavirus-2019-ncov-covid-19-wuhan-china-vector_53876-85750.jpg",
              "description": "A new variant of COVID-19 has been discovered.",
            },
            {
              "id": "2",
              "title": "Healthy Eating Habits",
              "image":
                  "https://img.freepik.com/free-photo/flat-lay-health-still-life-with-copy-space_23-2148854031.jpg",
              "description": "Tips for maintaining a healthy diet.",
            },
          ],
        };

      case EndPoints.examinationAppointments:
      case EndPoints.availableDoctors:
        List<Map<String, dynamic>> selectedDoctors = [];
        String? requestedDate = queryParameters?['date'];

        // Use a consistent seed based on the date string to make results stable per day
        int seed = 0;
        if (requestedDate != null) {
          // A simple hash of the date string
          for (int i = 0; i < requestedDate.length; i++) {
            seed += requestedDate.codeUnits[i];
          }
        } else {
          // Fallback to today's date format
          DateTime now = DateTime.now();
          requestedDate =
              "${now.year}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')}";
          for (int i = 0; i < requestedDate.length; i++) {
            seed += requestedDate.codeUnits[i];
          }
        }

        List<Map<String, String>> doctorsPool = [
          {
            "name": "Dr. Sarah Johnson",
            "spec": "Pediatrician",
            "img":
                "https://img.freepik.com/free-photo/woman-doctor-wearing-lab-coat-with-stethoscope-isolated_1303-29791.jpg",
          },
          {
            "name": "Dr. Mohamed Ahmed",
            "spec": "Cardiology",
            "img":
                "https://img.freepik.com/free-photo/doctor-with-his-arms-crossed-white-background_1368-5790.jpg",
          },
          {
            "name": "Dr. Emily Davis",
            "spec": "Dermatology",
            "img":
                "https://img.freepik.com/free-photo/portrait-successful-mid-adult-doctor-with-crossed-arms_1262-12865.jpg",
          },
          {
            "name": "Dr. James Wilson",
            "spec": "Neurology",
            "img":
                "https://img.freepik.com/free-photo/smiling-doctor-with-stethoscope-isolated-on-white_651396-974.jpg",
          },
          {
            "name": "Dr. Maria Garcia",
            "spec": "Dentist",
            "img":
                "https://img.freepik.com/free-photo/female-doctor-hospital-with-stethoscope_23-2148827715.jpg",
          },
          {
            "name": "Dr. Robert Chen",
            "spec": "Orthopedic",
            "img":
                "https://img.freepik.com/free-photo/portrait-successful-mid-adult-doctor-with-crossed-arms_1262-12865.jpg",
          },
          {
            "name": "Dr. Sophia Miller",
            "spec": "Oncology",
            "img":
                "https://img.freepik.com/free-photo/doctor-with-his-arms-crossed-white-background_1368-5790.jpg",
          },
          {
            "name": "Dr. William Taylor",
            "spec": "Urology",
            "img":
                "https://img.freepik.com/free-photo/smiling-doctor-with-stethoscope-isolated-on-white_651396-974.jpg",
          },
          {
            "name": "Dr. Olivia Brown",
            "spec": "ENT Specialist",
            "img":
                "https://img.freepik.com/free-photo/woman-doctor-wearing-lab-coat-with-stethoscope-isolated_1303-29791.jpg",
          },
          {
            "name": "Dr. David Martinez",
            "spec": "Psychiatrist",
            "img":
                "https://img.freepik.com/free-photo/doctor-with-his-arms-crossed-white-background_1368-5790.jpg",
          },
          {
            "name": "Dr. Isabella Ross",
            "spec": "Opthalmologist",
            "img":
                "https://img.freepik.com/free-photo/female-doctor-hospital-with-stethoscope_23-2148827715.jpg",
          },
          {
            "name": "Dr. Michael Lee",
            "spec": "Gastroenterologist",
            "img":
                "https://img.freepik.com/free-photo/smiling-doctor-with-stethoscope-isolated-on-white_651396-974.jpg",
          },
          {
            "name": "Dr. Ava Thompson",
            "spec": "Endocrinologist",
            "img":
                "https://img.freepik.com/free-photo/woman-doctor-wearing-lab-coat-with-stethoscope-isolated_1303-29791.jpg",
          },
          {
            "name": "Dr. Lucas Scott",
            "spec": "Pulmonologist",
            "img":
                "https://img.freepik.com/free-photo/doctor-with-his-arms-crossed-white-background_1368-5790.jpg",
          },
          {
            "name": "Dr. Mia White",
            "spec": "Rheumatologist",
            "img":
                "https://img.freepik.com/free-photo/female-doctor-hospital-with-stethoscope_23-2148827715.jpg",
          },
          {
            "name": "Dr. Ethan Green",
            "spec": "Nephrologist",
            "img":
                "https://img.freepik.com/free-photo/smiling-doctor-with-stethoscope-isolated-on-white_651396-974.jpg",
          },
          {
            "name": "Dr. Chloe Hall",
            "spec": "Gynecologist",
            "img":
                "https://img.freepik.com/free-photo/woman-doctor-wearing-lab-coat-with-stethoscope-isolated_1303-29791.jpg",
          },
          {
            "name": "Dr. Mason Hill",
            "spec": "General Surgeon",
            "img":
                "https://img.freepik.com/free-photo/doctor-with-his-arms-crossed-white-background_1368-5790.jpg",
          },
        ];

        for (int j = 0; j < 5; j++) {
          // Use the seed to pick 5 different doctors each day
          int doctorIndex = (seed + j) % doctorsPool.length;
          var doc = doctorsPool[doctorIndex];

          // Hours also vary by seed
          int hour = 9 + (seed % 3) + j;

          selectedDoctors.add({
            "id": "${seed}_${j}",
            "doctorName": doc["name"],
            "doctorSpeciality": doc["spec"],
            "doctorImage": doc["img"],
            "appointmentDate": requestedDate,
            "appointmentTime":
                "${hour % 12 == 0 ? 12 : hour % 12}:00 ${hour >= 12 ? 'PM' : 'AM'}",
            "appointmentStatus": path == EndPoints.availableDoctors
                ? "Available"
                : "Upcoming",
          });
        }

        return {
          "success": true,
          "message": "Data fetched successfully",
          "data": selectedDoctors,
        };

      default:
        return {
          "success": false,
          "message": "No dummy response for this endpoint",
        };
    }
  }
}
