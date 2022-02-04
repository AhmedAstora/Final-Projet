class ViewPager {
  String title;

  String image;

  ViewPager({this.title, this.image});

  static List<ViewPager> data = [
    ViewPager(
        title: 'Empowering Artisans, Farmers & Micro Business',
        image: 'assets/images/photo1.png'),
    ViewPager(
        title: 'Connecting NGOs, Social Enterprises with Communities',
        image: 'assets/images/photo2.png'),
    ViewPager(
        title: ' Donate, Invest & Support infrastructure projects',
        image: 'assets/images/photo3.png'),
  ];
}
