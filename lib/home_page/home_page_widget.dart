//import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../polls/polls_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePageWidget extends StatefulWidget {
  HomePageWidget({
    Key key,
    this.pollname,
  }) : super(key: key);

  final String pollname;

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<PollsRecord>>(
      stream: queryPollsRecord(
        queryBuilder: (pollsRecord) =>
            pollsRecord.where('pollname', isEqualTo: widget.pollname),
        singleRecord: true,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        }
        List<PollsRecord> homePagePollsRecordList = snapshot.data;
        // Customize what your widget looks like with no query results.
        if (snapshot.data.isEmpty) {
          // return Container();
          // For now, we'll just include some dummy data.
          homePagePollsRecordList = createDummyPollsRecord(count: 1);
        }
        final homePagePollsRecord = homePagePollsRecordList.first;
        return Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
            backgroundColor: FlutterFlowTheme.primaryColor,
            automaticallyImplyLeading: false,
            title: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  'Pollster:',
                  style: FlutterFlowTheme.title1.override(
                    fontFamily: 'Poppins',
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(5, 3, 0, 0),
                  child: Text(
                    'The Pulse of the People',
                    style: FlutterFlowTheme.subtitle2.override(
                      fontFamily: 'Poppins',
                      color: Color(0xFF020202),
                    ),
                  ),
                )
              ],
            ),
            actions: [],
            centerTitle: true,
            elevation: 4,
          ),
          body: SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                          child: Text(
                            homePagePollsRecord.pollname,
                            textAlign: TextAlign.start,
                            style: FlutterFlowTheme.subtitle2.override(
                              fontFamily: 'Poppins',
                              fontSize: 20,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(0, 0, 5, 0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Stack(
                                children: [
                                  Align(
                                    alignment: Alignment(0, 0),
                                    child: InkWell(
                                      onTap: () async {

                                        // START - DONE OUTSIDE FLUTTERFLOW
                                        final choiceAVotes = homePagePollsRecord.choiceAVotes+1;
                                        final totalVotes = homePagePollsRecord.totalvotes+1;
                                        final choiceAPercDouble = (choiceAVotes/totalVotes)*100;
                                        final choiceBPercDouble = (homePagePollsRecord.choiceBVotes/totalVotes)*100;
                                        // END - DONE OUTSIDE FLUTTERFLOW

                                        final pollsRecordData = {
                                          ...createPollsRecordData(
                                            // START - DONE OUTSIDE FLUTTERFLOW
                                            choiceAPerc: choiceAPercDouble.toInt(),
                                            choiceBPerc: choiceBPercDouble.toInt(),
                                            // END - DONE OUTSIDE FLUTTERFLOW
                                          ),
                                          'choice_a_votes':
                                          FieldValue.increment(1),
                                          'totalvotes': FieldValue.increment(1),
                                        };

                                        await homePagePollsRecord.reference
                                            .update(pollsRecordData);
                                      },
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.network(
                                          homePagePollsRecord.choiceAImg,
                                          width:
                                          MediaQuery.of(context).size.width,
                                          height: 200,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment(0, 0),
                                    child: Padding(
                                      padding:
                                      EdgeInsets.fromLTRB(0, 150, 0, 0),
                                      child: FFButtonWidget(
                                        onPressed: () async {

                                          // START - DONE OUTSIDE FLUTTERFLOW
                                          final choiceAVotes = homePagePollsRecord.choiceAVotes+1;
                                          final totalVotes = homePagePollsRecord.totalvotes+1;
                                          final choiceAPercDouble = (choiceAVotes/totalVotes)*100;
                                          final choiceBPercDouble = (homePagePollsRecord.choiceBVotes/totalVotes)*100;
                                          // END - DONE OUTSIDE FLUTTERFLOW

                                          final pollsRecordData = {
                                            ...createPollsRecordData(
                                              // START - DONE OUTSIDE FLUTTERFLOW
                                              choiceAPerc: choiceAPercDouble.toInt(),
                                              choiceBPerc: choiceBPercDouble.toInt(),
                                              // END - DONE OUTSIDE FLUTTERFLOW
                                            ),
                                            'choice_a_votes':
                                            FieldValue.increment(1),
                                            'totalvotes':
                                            FieldValue.increment(1),
                                          };

                                          await homePagePollsRecord.reference
                                              .update(pollsRecordData);
                                        },
                                        text: homePagePollsRecord.choiceA,
                                        options: FFButtonOptions(
                                          width: 130,
                                          height: 40,
                                          color: Color(0xAB313131),
                                          textStyle: FlutterFlowTheme.subtitle2
                                              .override(
                                            fontFamily: 'Poppins',
                                            color: Colors.white,
                                            fontSize: 12,
                                          ),
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 0,
                                          ),
                                          borderRadius: 12,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Stack(
                                children: [
                                  Align(
                                    alignment: Alignment(0, 0),
                                    child: InkWell(
                                      onTap: () async {

                                        // START - DONE OUTSIDE FLUTTERFLOW
                                        final choiceBVotes = homePagePollsRecord.choiceBVotes+1;
                                        final totalVotes = homePagePollsRecord.totalvotes+1;
                                        final choiceBPercDouble = (choiceBVotes/totalVotes)*100;
                                        final choiceAPercDouble = (homePagePollsRecord.choiceAVotes/totalVotes)*100;
                                        // END - DONE OUTSIDE FLUTTERFLOW

                                        final pollsRecordData = {
                                          ...createPollsRecordData(
                                            // START - DONE OUTSIDE FLUTTERFLOW
                                            choiceBPerc: choiceBPercDouble.toInt(),
                                            choiceAPerc: choiceAPercDouble.toInt(),
                                            // START - DONE OUTSIDE FLUTTERFLOW
                                          ),
                                          'choice_b_votes':
                                          FieldValue.increment(1),
                                          'totalvotes': FieldValue.increment(1),
                                        };

                                        await homePagePollsRecord.reference
                                            .update(pollsRecordData);
                                      },
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.network(
                                          homePagePollsRecord.choiceBImg,
                                          width:
                                          MediaQuery.of(context).size.width,
                                          height: 200,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment(0, 0),
                                    child: Padding(
                                      padding:
                                      EdgeInsets.fromLTRB(0, 150, 0, 0),
                                      child: FFButtonWidget(
                                        onPressed: () async {

                                          // START - DONE OUTSIDE FLUTTERFLOW
                                          final choiceBVotes = homePagePollsRecord.choiceBVotes+1;
                                          final totalVotes = homePagePollsRecord.totalvotes+1;
                                          final choiceBPercDouble = (choiceBVotes/totalVotes)*100;
                                          final choiceAPercDouble = (homePagePollsRecord.choiceAVotes/totalVotes)*100;
                                          // END - DONE OUTSIDE FLUTTERFLOW

                                          final pollsRecordData = {
                                            ...createPollsRecordData(
                                              // START - DONE OUTSIDE FLUTTERFLOW
                                              choiceBPerc: choiceBPercDouble.toInt(),
                                              choiceAPerc: choiceAPercDouble.toInt(),
                                              // START - DONE OUTSIDE FLUTTERFLOW
                                            ),
                                            'choice_b_votes':
                                            FieldValue.increment(1),
                                            'totalvotes':
                                            FieldValue.increment(1),
                                          };

                                          await homePagePollsRecord.reference
                                              .update(pollsRecordData);
                                        },
                                        text: homePagePollsRecord.choiceB,
                                        options: FFButtonOptions(
                                          width: 130,
                                          height: 40,
                                          color: Color(0xAB313131),
                                          textStyle: FlutterFlowTheme.subtitle2
                                              .override(
                                            fontFamily: 'Poppins',
                                            color: Colors.white,
                                            fontSize: 12,
                                          ),
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 0,
                                          ),
                                          borderRadius: 12,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                          child: Text(
                            // START - DONE OUTSIDE FLUTTERFLOW
                            homePagePollsRecord.choiceAPerc.toString()+"% ("+homePagePollsRecord.choiceAVotes.toString()+" votes)",
                            // END - DONE OUTSIDE FLUTTERFLOW
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.subtitle2.override(
                              fontFamily: 'Poppins',
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                          child: Text(
                            // START - DONE OUTSIDE FLUTTERFLOW
                            homePagePollsRecord.choiceBPerc.toString()+"% ("+homePagePollsRecord.choiceBVotes.toString()+" votes)",
                            // END - DONE OUTSIDE FLUTTERFLOW
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.subtitle2.override(
                              fontFamily: 'Poppins',
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [

                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PollsWidget(),
                                ),
                              );
                            },
                            text: 'Find More Polls',
                            options: FFButtonOptions(
                              width: 160,
                              height: 40,
                              color: Color(0x00FFFFFF),
                              textStyle: FlutterFlowTheme.subtitle2.override(
                                fontFamily: 'Poppins',
                                color: Color(0xFF020202),
                                fontSize: 14,
                              ),
                              elevation: 0,
                              borderSide: BorderSide(
                                color: Color(0xAB313131),
                                width: 1,
                              ),
                              borderRadius: 12,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                          child: Text(
                            'Popular Polls',
                            textAlign: TextAlign.start,
                            style: FlutterFlowTheme.title3.override(
                              fontFamily: 'Poppins',
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: StreamBuilder<List<PollsRecord>>(
                    stream: queryPollsRecord(
                      queryBuilder: (pollsRecord) =>
                          pollsRecord.orderBy('totalvotes', descending: true),
                      limit: 10,
                    ),
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return Center(child: CircularProgressIndicator());
                      }
                      List<PollsRecord> listViewPollsRecordList = snapshot.data;
                      // Customize what your widget looks like with no query results.
                      if (snapshot.data.isEmpty) {
                        // return Container();
                        // For now, we'll just include some dummy data.
                        listViewPollsRecordList =
                            createDummyPollsRecord(count: 10);
                      }
                      return Padding(
                        padding: EdgeInsets.fromLTRB(15, 0, 10, 0),
                        child: ListView.builder(
                          padding: EdgeInsets.zero,
                          scrollDirection: Axis.vertical,
                          itemCount: listViewPollsRecordList.length,
                          itemBuilder: (context, listViewIndex) {
                            final listViewPollsRecord =
                            listViewPollsRecordList[listViewIndex];

                            // START - DONE OUTSIDE FLUTTERFLOW
                            final pollEntryName = listViewPollsRecord.choiceA+" ("+
                                                  listViewPollsRecord.choiceAPerc.toString()+"%) v. "+
                                                  listViewPollsRecord.choiceB+" ("+
                                                  listViewPollsRecord.choiceBPerc.toString()+"%)";
                            // END - DONE OUTSIDE FLUTTERFLOW

                            return Container(
                              width: 100,
                              height: 50,
                              decoration: BoxDecoration(
                                color: Color(0xFFEEEEEE),
                              ),
                              child: InkWell(
                                onTap: () async {
                                  await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => HomePageWidget(
                                        pollname: listViewPollsRecord.pollname,
                                      ),
                                    ),
                                  );
                                },
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        // START - DONE OUTSIDE FLUTTERFLOW
                                        pollEntryName,
                                        // END - DONE OUTSIDE FLUTTERFLOW
                                        textAlign: TextAlign.start,
                                        style:
                                        FlutterFlowTheme.bodyText1.override(
                                          fontFamily: 'Poppins',
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        // START - DONE OUTSIDE FLUTTERFLOW
                                        listViewPollsRecord.totalvotes
                                            .toString()+" entries",
                                        // START - DONE OUTSIDE FLUTTERFLOW
                                        textAlign: TextAlign.end,
                                        style:
                                        FlutterFlowTheme.bodyText1.override(
                                          fontFamily: 'Poppins',
                                          fontSize: 14,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
