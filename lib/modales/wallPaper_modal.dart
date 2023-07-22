class WallModal {
  final int id;
  final int userid;
  final String title;
  final String body;

  WallModal({
    required this.id,
    required this.userid,
    required this.title,
    required this.body,
  });

  factory WallModal.fromMap({required Map data}){
    return WallModal(id: data['id'], userid: data['userid'], title: data['title'], body: data['body']);
  }
}
