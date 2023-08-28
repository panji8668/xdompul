library sidompul;

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sidompul/src/bloc/sidompul_bloc.dart';
import 'package:sidompul/src/models/api_response.dart';
import 'package:sidompul/src/models/productist_response.dart';
import 'package:sidompul/src/widget/errorpanel.dart';
import 'package:sidompul/src/widget/loadinglayout.dart';

import 'src/helper/utils.dart';
import 'src/widget/product_item.dart';

class CodeTujuan {
  CodeTujuan({required this.tujuan, required this.code, required this.price});
  String tujuan;
  String code;
  int price;
}

class SidomPulPage extends StatefulWidget {
  final String baseurl;
  final String authtoken;
  final int userid;
  final String title;
  final Function(CodeTujuan) onSelect;
  const SidomPulPage(
      {super.key,
      required this.baseurl,
      required this.userid,
      required this.title,
      required this.onSelect, required this.authtoken});

  @override
  State<SidomPulPage> createState() => _SidomPulPageState();
}

class _SidomPulPageState extends State<SidomPulPage> {
  final SidompulBloc bloc = SidompulBloc(burl: "",xauthtoken: "");
  final TextEditingController _txtnomor = TextEditingController(text: "");
  String typeproduk = "data";

  @override
  void initState() {
    super.initState();
    bloc.baseurl = widget.baseurl;
    bloc.service.authtoken = widget.authtoken;
    onWidgetDidBuild(() {
      bloc.getProduct(paket: typeproduk);
    });
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
                elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.blue.shade900,
        titleSpacing: 0,
        actions: [
          IconButton(
              onPressed: () {
                bloc.getProduct(paket: typeproduk);
              },
              icon: const Icon(Icons.refresh))
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
           margin:
                const EdgeInsets.only(top: 16, right: 8, left: 8, bottom: 8),
            child: TextField(
              style: const TextStyle(fontSize: 20),
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                                border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red.shade800)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red.shade800)),
                  filled: true,
                  label: const Text("Masukkan Nomor")),
              controller: _txtnomor,
            ),
          ),
          Container(
              width: MediaQuery.of(context).size.width,
              color: Colors.grey[300],
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
              child: Text(
                "Pilih Produk",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: ScreenUtil().setSp(16)),
              )),
          Expanded(
              child: StreamBuilder<ApiResponse<ProductListResponse>>(
                  stream: bloc.productStream,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      if (snapshot.data!.status == Status.LOADING) {
                        return const LoadingLayout();
                      }
                      if (snapshot.data!.status == Status.ERROR) {
                        return ErrorPanel(
                            title: "Ops:Terjadi kesalahan",
                            onclick: () => bloc.getProduct(paket: typeproduk));
                      }
                      if (snapshot.data!.status == Status.COMPLETED) {
                        return ListView.separated(
                            separatorBuilder: (context, index) =>
                                const Divider(height: 1),
                            primary: false,
                            shrinkWrap: true,
                            itemCount: snapshot.data!.data.data.data.length,
                            itemBuilder: ((context, index) {
                              return PrductItem(
                                selisih:  snapshot.data!.data.data.fee,
                                  product: snapshot.data!.data.data.data[index],
                                  ontap: (p0) => widget.onSelect(CodeTujuan(
                                      tujuan: _txtnomor.text,
                                      code: snapshot
                                          .data!.data.data.data[index].productCode,
                                      price: snapshot
                                          .data!.data.data.data[index].price)));
                            }));
                      }
                    }
                    return Container();
                  }))
        ],
      ),
    );
  }
}
