import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'controllers/loanController.dart';

class Loan extends StatelessWidget {
  final LoanController _loanController = Get.put(LoanController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF7F7F7),
      appBar: AppBar(
        title: Text('Loan Application'),
        centerTitle: true,
        backgroundColor: const Color(0xFFC0028B),
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(15),
              child: Text(
                'Terms and Conditions',
                textAlign: TextAlign.start,
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.w500),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(15, 0, 15, 15),
              child: Text(
                'At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus.',
                textAlign: TextAlign.justify,
              ),
            ),
            Container(
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Accept Terms & Conditions',
                      style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                    ),
                    Obx(() {
                      return Switch(
                        activeColor: Colors.green,
                        activeTrackColor: Colors.grey[300],
                        inactiveThumbColor: Colors.white,
                        inactiveTrackColor: Colors.grey[300],
                        value: _loanController.acceptedTerms.value,
                        onChanged: (value) {
                          _loanController.acceptedTerms.value = value;
                        },
                      );
                    }),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(15, 15, 15, 0),
              child: Text(
                'ABOUT YOU',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
              ),
            ),
            Container(
              color: Colors.white,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 5, 15, 0),
                    child: Text(
                      'Monthly Salary',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w300,
                          color: Colors.grey[500]),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.white,
              child: Row(
                children: [
                  Padding(
                      padding: EdgeInsets.fromLTRB(15, 0, 0, 0), child: Text('\$')),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 0),
                      child: TextField(
                        keyboardType: TextInputType.number,
                        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                        style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Colors.black),
                        onChanged: (value) {
                          _loanController.monthlySalary.value = int.tryParse(value) ?? 0;
                        },
                        decoration: const InputDecoration(
                          isDense: true,
                          contentPadding:
                              EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.white,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 5, 15, 0),
                    child: Text(
                      'Monthly Expenses',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w300,
                          color: Colors.grey[500]),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.white,
              child: Row(
                children: [
                  Padding(
                      padding: EdgeInsets.fromLTRB(15, 0, 0, 0), child: Text('\$')),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 0),
                      child: TextField(
                        keyboardType: TextInputType.number,
                        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                        style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Colors.black),
                        onChanged: (value) {
                          
                        },
                        decoration: const InputDecoration(
                          isDense: true,
                          contentPadding:
                              EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(15, 15, 15, 0),
              child: Text(
                'LOAN',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
              ),
            ),
            Container(
              color: Colors.white,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 5, 15, 0),
                    child: Text(
                      'Amount',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w300,
                          color: Colors.grey[500]),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.white,
              child: Row(
                children: [
                  Padding(
                      padding: EdgeInsets.fromLTRB(15, 0, 0, 0), child: Text('\$')),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 0),
                      child: TextField(
                        keyboardType: TextInputType.number,
                        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                        style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Colors.black),
                        onChanged: (value) {
                          _loanController.loanAmount.value = int.tryParse(value) ?? 0;
                        },
                        decoration: const InputDecoration(
                          isDense: true,
                          contentPadding:
                              EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.white,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 5, 15, 0),
                    child: Text(
                      'Term',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w300,
                          color: Colors.grey[500]),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.white,
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                      child: TextField(
                        keyboardType: TextInputType.number,
                        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                        style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Colors.black),
                        onChanged: (value) {
                          _loanController.loanTerm.value = int.tryParse(value) ?? 0;
                        },
                        decoration: const InputDecoration(
                          isDense: true,
                          contentPadding:
                              EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(40.0),
              child: Center(
                child: Container(
                  height: 70,
                  width: 200,
                  margin: EdgeInsets.all(20),
                  child: ElevatedButton(
                    onPressed: _loanController.applyForLoan,
                    child: Text('Apply for loan',style: TextStyle(fontSize: 20),),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFC0028B),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
