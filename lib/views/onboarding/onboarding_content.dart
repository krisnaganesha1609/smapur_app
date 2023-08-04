class OnboardingContent {
  String image;
  String title;
  String description;

  OnboardingContent(
      {required this.image, required this.title, required this.description});
}

List<OnboardingContent> contents = [
  OnboardingContent(
      title: 'Manage Your Plan',
      image: 'assets/img/onboarding1.svg',
      description:
          "With SCHEDUS Planner Features, you can create and manage your own plan. "
          "Set your very own deadline so you didn't missed any tasks in any related lessons!"),
  OnboardingContent(
      title: '360° Room View with Activity Viewer',
      image: 'assets/img/onboarding2.svg',
      description:
          "Find the attractiveness of your desired room environment before you visit them. "
          "With SCHEDUS Rooms Features, you can also check any SCHEDULED OR ONGOING ACTIVITY in any ROOM!"),
  OnboardingContent(
      title: 'See Your Schedule!',
      image: 'assets/img/onboarding3.svg',
      description:
          "Last but not least, you can check up your own lessons schedule based on what class you choose when you're registering. "
          "You can also see other class lessons schedule on any lesson blocks too!"),
];
