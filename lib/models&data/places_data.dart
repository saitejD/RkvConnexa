class PlacesModel {
  final String title;
  final String status;
  final String time;

  PlacesModel({this.title, this.status, this.time});
}

class PlacesList {
  final List<PlacesModel> placesList = [
    PlacesModel(
        status: "Open", time: "12:05:00 pm 1-3-2021", title: "Super Market"),
    PlacesModel(status: "Closed", time: "10:25:00 am", title: "Canteen"),
    PlacesModel(status: "Open", time: "08:15:00 am", title: "Bank"),
    PlacesModel(status: "Closed", time: "11:30:00 am", title: "Post Office"),
    PlacesModel(status: "Closed", time: "05:00:00 pm", title: "Sports Complex"),
    PlacesModel(status: "Open", time: "07:20:30 pm", title: "Hospital"),
    PlacesModel(status: "Closed", time: "9:29:00 am", title: "Saloon"),
    PlacesModel(status: "Closed", time: "01:45:50 pm", title: "Atm"),
    PlacesModel(status: "Open", time: "12:05:00 pm", title: "Gym"),
    PlacesModel(status: "Open", time: "02:03:00 pm", title: "Server Room"),
    PlacesModel(
        status: "Closed", time: "11:35:00 am", title: "Director Office"),
  ];
}
