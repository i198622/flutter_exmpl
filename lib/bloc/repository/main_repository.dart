
abstract class MainRepositoryInterface {
  Future<String> getData();
}

class MainRepository implements MainRepositoryInterface {
  @override
  Future<String> getData() async {
    await Future.delayed(
      const Duration(seconds: 2),
    );

    return DateTime.now().toIso8601String();
  }
}