class OnboardingContents {
  final String title;
  final String image;
  final String desc;

  OnboardingContents({
    required this.title,
    required this.image,
    required this.desc,
  });
}

List<OnboardingContents> contents = [
  OnboardingContents(
    title: "Stop wishing. Start doing",
    image: "assets/images/SS2.PNG",
    desc: "",
  ),
  OnboardingContents(
    title: "Tidak ada jalan pintas ke tempat yang layak dituju",
    image: "assets/images/SS3.PNG",
    desc: "",
  ),
  OnboardingContents(
    title: "If we never try, we will never know",
    image: "assets/images/SS1.PNG",
    desc: "",
  ),
];
