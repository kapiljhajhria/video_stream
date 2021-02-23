class Video {
  final String title;
  final String videoUrl;
  final String thumbnailUrl;

  Video(this.title, this.thumbnailUrl, this.videoUrl);

  String getSource(url) {
    RegExp sourceRegex = new RegExp(r"\/{2}.+?\/");
    return sourceRegex.firstMatch(url).group(0).replaceAll("/", "");
  }
}
