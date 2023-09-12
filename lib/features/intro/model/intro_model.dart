
class Items {
  final String img;
  final String title;
  final String subTitle;

  ///
  Items({
    required this.img,
    required this.title,
    required this.subTitle,
  });
}

List<Items> listOfItems = [
  Items(
    img: "assets/images/animation_lm3xmbbt.json",
    title:"Explore",
    subTitle:
    "Explore,Learn and Save \n Read across categories and save your favourites to your library",
  ),
  Items(
    img: "assets/images/animation_lm3zhm1m.json",
    title: "Stay Updated",
    subTitle:
    "Get Latest Updates on Books,Authors and Favourite Categories",
  ),
  Items(
    img: "assets/images/animation_lm3zq7hl.json",
    title:"Preview Books Links",
    subTitle: "Get Details of any book that you want ",
  ),
];