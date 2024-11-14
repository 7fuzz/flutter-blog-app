class Biography {
  final String username;
  String? bio;
  String? profilePicture;
  String? website;
  String? location;
  String? aboutMe;
  Biography({
    required this.username,
    this.bio,
    this.profilePicture,
    this.location,
    this.website,
    this.aboutMe,
  });
  static List<Biography> biography = [
    Biography(
      username: 'yusril',
      bio: 'Sedang mengerjakan UTS PM2',
      profilePicture: 'assets/profilepic/yusril.jpg',
      location: 'Bandung',
      website: 'tak punya',
      aboutMe: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'
    ),
  ];
  static Biography? getBio(String? username) {
    for (var user in biography) {
      if (user.username == username) {
        return user;
      }
    }
    return null;
  }
}