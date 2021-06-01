import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../home_page/home_page_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PollsWidget extends StatefulWidget {
  PollsWidget({Key key}) : super(key: key);

  @override
  _PollsWidgetState createState() => _PollsWidgetState();
}

class _PollsWidgetState extends State<PollsWidget> {
  TextEditingController textController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color(0xFF64B5F6),
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () async {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.navigate_before,
            color: Colors.black,
            size: 30,
          ),
          iconSize: 30,
        ),
        title: Text(
          'Find a Poll',
          style: FlutterFlowTheme.title1.override(
            fontFamily: 'Poppins',
          ),
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
              child: TextFormField(
                controller: textController,
                obscureText: false,
                decoration: InputDecoration(
                  hintText: '[Search function is not yet ready!]',
                  hintStyle: FlutterFlowTheme.bodyText1.override(
                    fontFamily: 'Poppins',
                    color: Color(0x6E313131),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0x46313131),
                      width: 2,
                    ),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0x46313131),
                      width: 2,
                    ),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                  ),
                ),
                style: FlutterFlowTheme.bodyText1.override(
                  fontFamily: 'Poppins',
                  color: Color(0x6E313131),
                ),
              ),
            ),
            Expanded(
              child: StreamBuilder<List<PollsRecord>>(
                stream: queryPollsRecord(
                  limit: 50,
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
                    listViewPollsRecordList = createDummyPollsRecord(count: 50);
                  }
                  return Padding(
                    padding: EdgeInsets.fromLTRB(10, 5, 10, 0),
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                      scrollDirection: Axis.vertical,
                      itemCount: listViewPollsRecordList.length,
                      itemBuilder: (context, listViewIndex) {
                        final listViewPollsRecord =
                        listViewPollsRecordList[listViewIndex];

                        // START - DONE OUTSIDE FLUTTERFLOW
                        final pollEntryName = listViewPollsRecord.choiceA+" ("+
                            listViewPollsRecord.choiceAPerc.toString()+"%) vs. "+
                            listViewPollsRecord.choiceB+" ("+
                            listViewPollsRecord.choiceBPerc.toString()+"%)";
                        // END - DONE OUTSIDE FLUTTERFLOW

                        return Padding(
                          padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HomePageWidget(
                                    pollname: listViewPollsRecord.pollname,
                                  ),
                                ),
                              );
                            },
                            // START - DONE OUTSIDE FLUTTERFLOW
                            text: pollEntryName,
                            // END - DONE OUTSIDE FLUTTERFLOW
                            options: FFButtonOptions(
                              width: 130,
                              height: 40,
                              color: Color(0x00FFFFFF),
                              textStyle: FlutterFlowTheme.subtitle2.override(
                                fontFamily: 'Poppins',
                                color: Color(0xFF020202),
                              ),
                              elevation: 0,
                              borderSide: BorderSide(
                                color: Color(0x779E9E9E),
                                width: 1,
                              ),
                              borderRadius: 0,
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
  }
}
