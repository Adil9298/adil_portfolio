class RoleModel {
  final String title;
  final String subtitle;
  final String summary;
  final String gifPath;

  final List<String> certifications;

  final List<Map<String, dynamic>> services;

  final List<Map<String, dynamic>> skills;

  final List<Map<String, dynamic>> experience;

  final List<Map<String, dynamic>> featuredProjects;

  RoleModel({
    required this.title,
    required this.subtitle,
    required this.summary,
    required this.gifPath,
    required this.certifications,
    required this.services,
    required this.skills,
    required this.experience,
    required this.featuredProjects,
  });
}