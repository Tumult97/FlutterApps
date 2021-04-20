import '../Tasks/ListGroup.dart';

class ClientModel{
  List<ListGroup> groups;

  double onHold;
  double waitingOnClient;
  double pendingRelease;
  double needsScheduling;
  double scheduled;
  double allocated;
  double remaining;
  double other;

  String name;

  ClientModel(
      {this.groups,
      this.onHold,
      this.waitingOnClient,
      this.pendingRelease,
      this.needsScheduling,
      this.scheduled,
      this.allocated,
      this.remaining,
      this.other,
      this.name});
}