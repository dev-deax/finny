import 'dart:developer';

import 'package:equatable/equatable.dart';

import 'applied_skill_model.dart';
import 'certification_model.dart';
import 'course_model.dart';
import 'exam_model.dart';
import 'learning_path_model.dart';
import 'level_product_role_subject_model.dart';
import 'merged_certification_model.dart';
import 'module_model.dart';
import 'unit_model.dart';

class ApiResponseModel extends Equatable {
  final List<ModuleModel> modules;
  final List<UnitModel> units;
  final List<LearningPathModel> learningPaths;
  final List<AppliedSkillModel> appliedSkills;
  final List<CertificationModel> certifications;
  final List<MergedCertificationModel> mergedCertifications;
  final List<ExamModel> exams;
  final List<CourseModel> courses;
  final List<LevelProductRoleSubjectModel> levels;
  final List<LevelProductRoleSubjectModel> roles;
  final List<LevelProductRoleSubjectModel> products;
  final List<LevelProductRoleSubjectModel> subjects;

  const ApiResponseModel({
    required this.modules,
    required this.units,
    required this.learningPaths,
    required this.appliedSkills,
    required this.certifications,
    required this.mergedCertifications,
    required this.exams,
    required this.courses,
    required this.levels,
    required this.roles,
    required this.products,
    required this.subjects,
  });

  factory ApiResponseModel.fromJson(Map<String, dynamic> json) {
    log('ApiResponseModel fromJson: $json');

    final modulesList = json['modules'] as List<dynamic>? ?? [];
    final unitsList = json['units'] as List<dynamic>? ?? [];
    final learningPathsList = json['learningPaths'] as List<dynamic>? ?? [];
    final appliedSkillsList = json['appliedSkills'] as List<dynamic>? ?? [];
    final certificationsList = json['certifications'] as List<dynamic>? ?? [];
    final mergedCertificationsList = json['mergedCertifications'] as List<dynamic>? ?? [];
    final examsList = json['exams'] as List<dynamic>? ?? [];
    final coursesList = json['courses'] as List<dynamic>? ?? [];
    final levelsList = json['levels'] as List<dynamic>? ?? [];
    final rolesList = json['roles'] as List<dynamic>? ?? [];
    final productsList = json['products'] as List<dynamic>? ?? [];
    final subjectsList = json['subjects'] as List<dynamic>? ?? [];

    return ApiResponseModel(
      modules: modulesList.map((moduleJson) => ModuleModel.fromJson(moduleJson as Map<String, dynamic>)).toList(),
      units: unitsList.map((unitJson) => UnitModel.fromJson(unitJson as Map<String, dynamic>)).toList(),
      learningPaths: learningPathsList.map((pathJson) => LearningPathModel.fromJson(pathJson as Map<String, dynamic>)).toList(),
      appliedSkills: appliedSkillsList.map((skillJson) => AppliedSkillModel.fromJson(skillJson as Map<String, dynamic>)).toList(),
      certifications: certificationsList.map((certJson) => CertificationModel.fromJson(certJson as Map<String, dynamic>)).toList(),
      mergedCertifications: mergedCertificationsList.map((mergedCertJson) => MergedCertificationModel.fromJson(mergedCertJson as Map<String, dynamic>)).toList(),
      exams: examsList.map((examJson) => ExamModel.fromJson(examJson as Map<String, dynamic>)).toList(),
      courses: coursesList.map((courseJson) => CourseModel.fromJson(courseJson as Map<String, dynamic>)).toList(),
      levels: levelsList.map((levelJson) => LevelProductRoleSubjectModel.fromJson(levelJson as Map<String, dynamic>)).toList(),
      roles: rolesList.map((roleJson) => LevelProductRoleSubjectModel.fromJson(roleJson as Map<String, dynamic>)).toList(),
      products: productsList.map((productJson) => LevelProductRoleSubjectModel.fromJson(productJson as Map<String, dynamic>)).toList(),
      subjects: subjectsList.map((subjectJson) => LevelProductRoleSubjectModel.fromJson(subjectJson as Map<String, dynamic>)).toList(),
    );
  }

  @override
  List<Object?> get props => [
        modules,
        units,
        learningPaths,
        appliedSkills,
        certifications,
        mergedCertifications,
        exams,
        courses,
        levels,
        roles,
        products,
        subjects,
      ];

  Map<String, dynamic> toJson() {
    return {
      'modules': modules.map((module) => module.toJson()).toList(),
      'units': units.map((unit) => unit.toJson()).toList(),
      'learningPaths': learningPaths.map((path) => path.toJson()).toList(),
      'appliedSkills': appliedSkills.map((skill) => skill.toJson()).toList(),
      'certifications': certifications.map((cert) => cert.toJson()).toList(),
      'mergedCertifications': mergedCertifications.map((mergedCert) => mergedCert.toJson()).toList(),
      'exams': exams.map((exam) => exam.toJson()).toList(),
      'courses': courses.map((course) => course.toJson()).toList(),
      'levels': levels.map((level) => level.toJson()).toList(),
      'roles': roles.map((role) => role.toJson()).toList(),
      'products': products.map((product) => product.toJson()).toList(),
      'subjects': subjects.map((subject) => subject.toJson()).toList(),
    };
  }
}
