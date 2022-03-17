class TutorialsRequestParams {
  final bool? published;
  final int? page;
  final int? pageSize;

  const TutorialsRequestParams({
    this.published = false,
    this.page = 1,
    this.pageSize = 5,
  });
}
