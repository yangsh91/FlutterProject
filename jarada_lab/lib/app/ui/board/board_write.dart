import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jarada_lab/app/controller/board/board_write_controller.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:textfield_tags/textfield_tags.dart';
import 'package:jarada_lab/app/ui/widget/side_menu.dart';

class Animal {
  final int? id;
  final String? name;

  Animal({
    this.id,
    this.name,
  });
}

class BoardWrite extends GetView<BoardWriteController> {
  static List<Animal> _animals = [
    Animal(id: 1, name: "친환경 포트"),
    Animal(id: 2, name: "셔틀콕"),
    Animal(id: 3, name: "나무숟가락"),
    Animal(id: 4, name: "코스프레이 공병"),
    Animal(id: 5, name: "비즈롤"),
    Animal(id: 6, name: "톰슨 3호"),
    Animal(id: 7, name: "캔 PET"),
    Animal(id: 8, name: "팝튜브"),
    Animal(id: 9, name: "PE폼"),
    Animal(id: 10, name: "제본링"),
    Animal(id: 11, name: "루바망"),
    Animal(id: 12, name: "트레싱지"),
    Animal(id: 13, name: "우드락볼"),
    Animal(id: 14, name: "핸디코트"),
    Animal(id: 15, name: "특수합지 크래프트"),
    Animal(id: 16, name: "갈대빨대"),
    Animal(id: 17, name: "용수철"),
    Animal(id: 18, name: "에어호스"),
    Animal(id: 19, name: "히어로단추"),
    Animal(id: 20, name: "메탈골판지"),
    Animal(id: 21, name: "천"),
    Animal(id: 22, name: "테이프"),
    Animal(id: 23, name: "폼보드"),
    Animal(id: 24, name: "금속"),
    Animal(id: 25, name: "목재"),
    Animal(id: 26, name: "지류"),
    Animal(id: 27, name: "박스"),
  ];

  @override
  Widget build(BuildContext context) {
    List<Widget> _boxContents = [
      IconButton(
          onPressed: () {
            controller.pickImg(context);
          },
          icon: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.grey.shade200, shape: BoxShape.circle),
              child: Icon(
                CupertinoIcons.camera,
                color: Theme.of(context).colorScheme.primary,
              ))),
      Container(),
      Container(),
      Obx(
        () => controller.pickedImgs.length <= 4
            ? Container()
            : FittedBox(
                child: Container(
                    padding: EdgeInsets.all(6),
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.6),
                        shape: BoxShape.circle),
                    child: Text(
                      '+${(controller.pickedImgs.length - 4).toString()}',
                      style: Theme.of(context)
                          .textTheme
                          .subtitle2
                          ?.copyWith(fontWeight: FontWeight.w800),
                    ))),
      ),
    ];

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Colors.grey.shade200,
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(26, 28, 28, 1),
          iconTheme: IconThemeData(
            color: Colors.yellow,
          ),
          leading: GestureDetector(
            onTap: () => Get.back(),
            child: const Icon(
              Icons.arrow_back_ios_new_outlined,
              color: Colors.yellow,
            ),
          ),
          toolbarHeight: 50.0,
          centerTitle: false,
          title: Container(
            alignment: Alignment.center,
            width: 100.0,
            child: Image.asset(
              'assets/images/logo.png',
              fit: BoxFit.contain,
            ),
          ),
        ),
        endDrawer: SideMenu(),
        body: SingleChildScrollView(
          child: Obx(
            () => Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    width: double.infinity,
                    height: 50.0,
                    alignment: Alignment.centerLeft,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          '교안 업로드',
                          style: TextStyle(
                            fontSize: 28.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Container(
                          width: 80.0,
                          height: 30.0,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: const Text(
                            '연구작 뽐내기',
                            style: TextStyle(
                              fontSize: 13.0,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      '주제 *',
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
                  child: Container(
                    width: double.infinity,
                    child: InputDecorator(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(5.0),
                          ),
                        ),
                      ),
                      child: SizedBox(
                        height: 20.0,
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            isDense: true,
                            isExpanded: false,
                            value: controller.subject.value,
                            menuMaxHeight: 20.0,
                            style: const TextStyle(
                              fontSize: 14.0,
                              color: Colors.black,
                            ),
                            itemHeight: null,
                            items: const [
                              DropdownMenuItem(
                                  child: Text('주제를 선택해 주세요.'), value: ''),
                              DropdownMenuItem(
                                  child: Text('자라다'), value: 'JARADA'),
                              DropdownMenuItem(
                                  child: Text('가구'), value: 'FUNITURE'),
                              DropdownMenuItem(
                                  child: Text('건축물'), value: 'ARCHITECTURE'),
                              DropdownMenuItem(
                                  child: Text('기계'), value: 'MACHINE'),
                            ],
                            onChanged: (value) {
                              controller.subject.value = value!;
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      '연령 *',
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
                  child: Container(
                    width: double.infinity,
                    //height: 45.0,
                    child: InputDecorator(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(5.0),
                          ),
                        ),
                      ),
                      child: SizedBox(
                        height: 20.0,
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            isDense: true,
                            isExpanded: false,
                            elevation: 16,
                            value: controller.age.value,
                            itemHeight: null,
                            items: const [
                              DropdownMenuItem(
                                  child: Text('연령을 선택해 주세요'), value: ''),
                              DropdownMenuItem(child: Text('6세'), value: '16'),
                              DropdownMenuItem(child: Text('7세'), value: '7'),
                              DropdownMenuItem(child: Text('8세'), value: '8'),
                              DropdownMenuItem(child: Text('9세'), value: '9'),
                              DropdownMenuItem(child: Text('10세'), value: '10'),
                              DropdownMenuItem(child: Text('11세'), value: '11'),
                              DropdownMenuItem(child: Text('12세'), value: '12'),
                              DropdownMenuItem(child: Text('13세'), value: '13'),
                              DropdownMenuItem(child: Text('14세'), value: '14'),
                              DropdownMenuItem(child: Text('15세'), value: '15'),
                              DropdownMenuItem(child: Text('16세'), value: '16'),
                              DropdownMenuItem(child: Text('기타'), value: '99'),
                              DropdownMenuItem(child: Text('교사'), value: '00'),
                            ],
                            onChanged: (value) {
                              controller.age.value = value!;
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      '재료(다중선택 가능) *',
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
                  child: MultiSelectDialogField(
                    confirmText: const Text('확인'),
                    cancelText: const Text('닫기'),
                    buttonText: const Text('재료를 선택해 주세요'),
                    buttonIcon: const Icon(Icons.arrow_drop_down),
                    decoration: BoxDecoration(
                        border: Border.all(
                          width: 1.0,
                          color: Colors.grey,
                        ),
                        borderRadius: BorderRadius.circular(5.0)),
                    items: _animals
                        .map((e) => MultiSelectItem(e, e.name.toString()))
                        .toList(),
                    listType: MultiSelectListType.CHIP,
                    onConfirm: (List<dynamic> values) {
                      controller.materialList = values;
                    },
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
                  child: Text(
                    '*파일확장자가 png일 경우 배경색을 넣지 않으면 자동으로 검은색 배경이 설정됩니다.',
                    style: TextStyle(
                      color: Colors.blueAccent,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
                  child: GridView.count(
                    shrinkWrap: true,
                    padding: EdgeInsets.all(2),
                    crossAxisCount: 2,
                    mainAxisSpacing: 5,
                    crossAxisSpacing: 5,
                    children: List.generate(
                      4,
                      (index) => DottedBorder(
                        child: GestureDetector(
                          onTap: () {
                            print("num : $index");
                          },
                          child: Container(
                            child: Center(child: _boxContents[index]),
                            decoration: index <=
                                    controller.pickedImgs.length - 1
                                ? BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: FileImage(
                                        File(controller.pickedImgs[index].path),
                                      ),
                                    ),
                                  )
                                : null,
                          ),
                        ),
                        color: Colors.grey,
                        dashPattern: [5, 3],
                        borderType: BorderType.RRect,
                        radius: Radius.circular(10),
                      ),
                    ).toList(),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      '해시태그 *',
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
                  child: Container(
                    child: TextFieldTags(
                      initialTags: [],
                      textSeparators: const [' ', ','],
                      letterCase: LetterCase.normal,
                      textfieldTagsController: controller.tags,
                      inputfieldBuilder:
                          (context, tec, fn, error, onChanged, onSubmitted) {
                        return ((context, sc, tags, onTagDelete) {
                          return Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: TextField(
                              controller: tec,
                              focusNode: fn,
                              decoration: InputDecoration(
                                isDense: true,
                                border: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color.fromARGB(255, 74, 137, 92),
                                    width: 3.0,
                                  ),
                                ),
                                focusedBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color.fromARGB(255, 74, 137, 92),
                                    width: 3.0,
                                  ),
                                ),
                                helperStyle: const TextStyle(
                                  color: Color.fromARGB(255, 74, 137, 92),
                                ),
                                hintText: "태그를 입력해 주세요.",
                                errorText: error,
                                // prefixIconConstraints: BoxConstraints(
                                //     maxWidth: _distanceToField * 0.74),
                                prefixIcon: tags.isNotEmpty
                                    ? SingleChildScrollView(
                                        controller: sc,
                                        scrollDirection: Axis.horizontal,
                                        child: Row(
                                            children: tags.map((String tag) {
                                          return Container(
                                            decoration: const BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(20.0),
                                              ),
                                              color: Color.fromARGB(
                                                  255, 74, 137, 92),
                                            ),
                                            margin: const EdgeInsets.symmetric(
                                                horizontal: 5.0),
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 10.0,
                                                vertical: 5.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                InkWell(
                                                  child: Text(
                                                    '#$tag',
                                                    style: const TextStyle(
                                                        color: Colors.white),
                                                  ),
                                                  onTap: () {
                                                    print("$tag selected");
                                                  },
                                                ),
                                                const SizedBox(width: 4.0),
                                                InkWell(
                                                  child: const Icon(
                                                    Icons.cancel,
                                                    size: 14.0,
                                                    color: Color.fromARGB(
                                                        255, 233, 233, 233),
                                                  ),
                                                  onTap: () {
                                                    onTagDelete(tag);
                                                  },
                                                )
                                              ],
                                            ),
                                          );
                                        }).toList()),
                                      )
                                    : null,
                              ),
                              onChanged: onChanged,
                              onSubmitted: onSubmitted,
                            ),
                          );
                        });
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
                  child: GestureDetector(
                    onTap: controller.showWidget,
                    child: Container(
                      height: 40.0,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text('제작과정 입력하기'),
                          Icon(Icons.arrow_drop_down_rounded)
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Visibility(
                  visible: controller.isVisible.value,
                  maintainState: true,
                  maintainAnimation: true,
                  child: Column(
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: const Text(
                            '제작 과정1 설명',
                            style: TextStyle(
                              fontSize: 14.0,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
                        child: Container(
                          width: double.infinity,
                          height: 40.0,
                          child: TextField(
                            controller: controller.explain1,
                            decoration: const InputDecoration(
                              fillColor: Colors.grey,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10.0),
                                ),
                                borderSide: BorderSide(
                                    color: Colors.yellow, width: 1.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10.0),
                                ),
                                borderSide: BorderSide(
                                  color: Colors.grey,
                                  width: 2.0,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.blueAccent,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10.0),
                                ),
                              ),
                              hintText: '제작과정 1에 대한 설명을 간단하게 입력해 주세요.',
                              hintStyle: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: const Text(
                            '제작 과정2 설명',
                            style: TextStyle(
                              fontSize: 14.0,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
                        child: Container(
                          width: double.infinity,
                          height: 40.0,
                          child: TextField(
                            controller: controller.explain2,
                            decoration: const InputDecoration(
                              fillColor: Colors.grey,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10.0),
                                ),
                                borderSide: BorderSide(
                                    color: Colors.yellow, width: 1.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10.0),
                                ),
                                borderSide: BorderSide(
                                  color: Colors.grey,
                                  width: 2.0,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.blueAccent,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10.0),
                                ),
                              ),
                              hintText: '제작과정 2에 대한 설명을 간단하게 입력해 주세요.',
                              hintStyle: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: const Text(
                            '제작 과정3 설명',
                            style: TextStyle(
                              fontSize: 14.0,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
                        child: Container(
                          width: double.infinity,
                          height: 40.0,
                          child: TextField(
                            controller: controller.explain3,
                            decoration: const InputDecoration(
                              fillColor: Colors.grey,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10.0),
                                ),
                                borderSide: BorderSide(
                                    color: Colors.yellow, width: 1.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10.0),
                                ),
                                borderSide: BorderSide(
                                  color: Colors.grey,
                                  width: 2.0,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.blueAccent,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10.0),
                                ),
                              ),
                              hintText: '제작과정 3에 대한 설명을 간단하게 입력해 주세요.',
                              hintStyle: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: const Text(
                            '제작 과정4 설명',
                            style: TextStyle(
                              fontSize: 14.0,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
                        child: Container(
                          width: double.infinity,
                          height: 40.0,
                          child: TextField(
                            controller: controller.explain4,
                            decoration: const InputDecoration(
                              fillColor: Colors.grey,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10.0),
                                ),
                                borderSide: BorderSide(
                                    color: Colors.yellow, width: 1.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10.0),
                                ),
                                borderSide: BorderSide(
                                  color: Colors.grey,
                                  width: 2.0,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.blueAccent,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10.0),
                                ),
                              ),
                              hintText: '제작과정 4에 대한 설명을 간단하게 입력해 주세요.',
                              hintStyle: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
                  child: GestureDetector(
                    onTap: () => controller.goActBoardWrite(context),
                    child: Container(
                      width: double.infinity,
                      height: 50.0,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          border: Border.all(
                            width: 1.0,
                            color: Colors.grey.shade400,
                          ),
                          borderRadius: BorderRadius.circular(5.0),
                          color: Colors.grey.shade400),
                      child: const Text(
                        '교안 업로드',
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
