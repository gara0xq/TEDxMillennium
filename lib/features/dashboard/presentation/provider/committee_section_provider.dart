import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/model/member_model.dart';
import '../../data/repo/dashboard_repo_impl.dart';
import '../../domain/entity/member_entity.dart';
import '../../domain/usecase/add_member_usecase.dart';
import '../../domain/usecase/fetch_member_usecase.dart';

class CommitteeSectionProvider extends GetxController {
  String committeeName = 'hr';
  final FetchMemberUseCase _fetchCommitteeMembersUseCase;
  final AddMemberUsecase _addMemberUsecase;

  CommitteeSectionProvider({required this.committeeName})
    : _fetchCommitteeMembersUseCase = FetchMemberUseCase(DashboardRepoImpl()),
      _addMemberUsecase = AddMemberUsecase(DashboardRepoImpl());

  TextEditingController nameController = TextEditingController();
  TextEditingController roleController = TextEditingController();

  List<MemberModel> committeeMembers = [];
  bool loading = true;
  @override
  void onInit() {
    super.onInit();

    Future.wait([fetchCommitteeMembers()]).then((e) {
      loading = false;
      update();
    });
  }

  void changeScreen(String screen) async {
    if (screen == committeeName) {
      return;
    }
    committeeName = screen;
    loading = true;
    update();
    await fetchCommitteeMembers();
    loading = false;
    update();
  }

  Future<void> fetchCommitteeMembers() async {
    try {
      committeeMembers = await _fetchCommitteeMembersUseCase.call(
        committeeName,
      );
      committeeMembers.sort((a, b) => a.role.compareTo(b.role));
    } catch (e) {
      log("Error fetching committee members: $e");
      committeeMembers = [];
    }
  }

  Future<void> addMember() async {
    try {
      await _addMemberUsecase.call(
        MemberEntity(name: nameController.text, role: roleController.text),
        committeeName,
      );
      nameController.clear();
      roleController.clear();
      Get.back();
      await fetchCommitteeMembers();
      update();
    } catch (e) {
      log("Error adding member: $e");
    }
  }
}
