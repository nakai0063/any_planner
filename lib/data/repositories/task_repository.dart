import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:uuid/uuid.dart';
import '../../domain/models/task.dart';
import '../../domain/models/task_status.dart';
import '../../domain/models/task_type.dart';

class TaskRepository {
  final FirebaseFirestore _firestore;
  static const _uuid = Uuid();

  TaskRepository(this._firestore);

  String? get _uid => FirebaseAuth.instance.currentUser?.uid;

  CollectionReference<Map<String, dynamic>> _tasksRef(String uid) =>
      _firestore.collection('users/$uid/tasks');

  Stream<List<Task>> watchScheduledTasks(DateTime date) {
    final uid = _uid;
    if (uid == null) return Stream.value([]);

    final start = Timestamp.fromDate(DateTime(date.year, date.month, date.day));
    final end =
        Timestamp.fromDate(DateTime(date.year, date.month, date.day + 1));

    return _tasksRef(uid)
        .where('targetDate', isGreaterThanOrEqualTo: start)
        .where('targetDate', isLessThan: end)
        .snapshots()
        .map((snap) {
      final tasks = snap.docs
          .map(_fromDoc)
          .where((t) => t.type != TaskType.later)
          .toList();
      tasks.sort(_compareScheduled);
      return tasks;
    });
  }

  Stream<List<Task>> watchLaterTasks(DateTime date) {
    final uid = _uid;
    if (uid == null) return Stream.value([]);

    final start = Timestamp.fromDate(DateTime(date.year, date.month, date.day));
    final end =
        Timestamp.fromDate(DateTime(date.year, date.month, date.day + 1));

    return _tasksRef(uid)
        .where('targetDate', isGreaterThanOrEqualTo: start)
        .where('targetDate', isLessThan: end)
        .snapshots()
        .map((snap) => snap.docs
            .map(_fromDoc)
            .where((t) =>
                t.type == TaskType.later && t.status != TaskStatus.done)
            .toList());
  }

  Stream<List<Task>> watchTasksForDate(DateTime date) {
    final uid = _uid;
    if (uid == null) return Stream.value([]);

    final start = Timestamp.fromDate(DateTime(date.year, date.month, date.day));
    final end =
        Timestamp.fromDate(DateTime(date.year, date.month, date.day + 1));

    return _tasksRef(uid)
        .where('targetDate', isGreaterThanOrEqualTo: start)
        .where('targetDate', isLessThan: end)
        .snapshots()
        .map((snap) => snap.docs.map(_fromDoc).toList());
  }

  Future<void> createTask({
    required String title,
    required TaskType type,
    required DateTime targetDate,
    DateTime? scheduledStart,
    int? durationMinutes,
    String? memo,
    String? iconName,
    int? colorValue,
  }) async {
    final uid = _uid;
    if (uid == null) return;

    final now = DateTime.now();
    final id = _uuid.v4();
    await _tasksRef(uid).doc(id).set({
      'id': id,
      'title': title,
      'type': type.name,
      'status': TaskStatus.pending.name,
      'targetDate': Timestamp.fromDate(
          DateTime(targetDate.year, targetDate.month, targetDate.day)),
      'scheduledStart':
          scheduledStart != null ? Timestamp.fromDate(scheduledStart) : null,
      'durationMinutes': durationMinutes,
      'memo': memo,
      'iconName': iconName,
      'colorValue': colorValue,
      'isPinned': false,
      'routineId': null,
      'snoozeCount': 0,
      'snoozedUntil': null,
      'sortOrder': 0,
      'deadline': null,
      'completedAt': null,
      'images': <String>[],
      'moveToLaterWhenOverdue': false,
      'createdAt': Timestamp.fromDate(now),
      'updatedAt': Timestamp.fromDate(now),
    });
  }

  Future<void> updateTaskStatus(String id, TaskStatus status) async {
    final uid = _uid;
    if (uid == null) return;

    await _tasksRef(uid).doc(id).update({
      'status': status.name,
      'completedAt':
          status == TaskStatus.done ? Timestamp.now() : null,
      'updatedAt': Timestamp.now(),
    });
  }

  Future<void> scheduleTask(String id, DateTime startTime,
      {int? durationMinutes}) async {
    final uid = _uid;
    if (uid == null) return;

    final update = <String, dynamic>{
      'type': TaskType.scheduled.name,
      'targetDate': Timestamp.fromDate(
          DateTime(startTime.year, startTime.month, startTime.day)),
      'scheduledStart': Timestamp.fromDate(startTime),
      'updatedAt': Timestamp.now(),
    };
    if (durationMinutes != null) {
      update['durationMinutes'] = durationMinutes;
    }

    await _tasksRef(uid).doc(id).update(update);
  }

  Future<void> moveToLater(String id) async {
    final uid = _uid;
    if (uid == null) return;

    await _tasksRef(uid).doc(id).update({
      'type': TaskType.later.name,
      'scheduledStart': null,
      'updatedAt': Timestamp.now(),
    });
  }

  Future<void> deleteTask(String id) async {
    final uid = _uid;
    if (uid == null) return;
    await _tasksRef(uid).doc(id).delete();
  }

  // --- Mapping ---

  static Task _fromDoc(QueryDocumentSnapshot<Map<String, dynamic>> doc) {
    final data = doc.data();
    return Task(
      id: data['id'] as String,
      title: data['title'] as String,
      type: TaskType.values.byName(data['type'] as String? ?? 'later'),
      status: TaskStatus.values
          .byName(data['status'] as String? ?? 'pending'),
      targetDate: (data['targetDate'] as Timestamp).toDate(),
      scheduledStart: (data['scheduledStart'] as Timestamp?)?.toDate(),
      durationMinutes: data['durationMinutes'] as int?,
      memo: data['memo'] as String?,
      iconName: data['iconName'] as String?,
      colorValue: data['colorValue'] as int?,
      isPinned: data['isPinned'] as bool? ?? false,
      routineId: data['routineId'] as String?,
      snoozeCount: data['snoozeCount'] as int? ?? 0,
      snoozedUntil: (data['snoozedUntil'] as Timestamp?)?.toDate(),
      sortOrder: data['sortOrder'] as int? ?? 0,
      deadline: (data['deadline'] as Timestamp?)?.toDate(),
      completedAt: (data['completedAt'] as Timestamp?)?.toDate(),
      images: List<String>.from(data['images'] as List? ?? []),
      moveToLaterWhenOverdue:
          data['moveToLaterWhenOverdue'] as bool? ?? false,
      createdAt: (data['createdAt'] as Timestamp).toDate(),
      updatedAt: (data['updatedAt'] as Timestamp).toDate(),
    );
  }

  static int _compareScheduled(Task a, Task b) {
    if (a.isPinned && !b.isPinned) return -1;
    if (!a.isPinned && b.isPinned) return 1;
    if (a.scheduledStart != null && b.scheduledStart != null) {
      return a.scheduledStart!.compareTo(b.scheduledStart!);
    }
    if (a.scheduledStart != null) return -1;
    if (b.scheduledStart != null) return 1;
    return a.sortOrder.compareTo(b.sortOrder);
  }
}
