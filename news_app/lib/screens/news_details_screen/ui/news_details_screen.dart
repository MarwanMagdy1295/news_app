import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:news_app/core/color.dart';
import 'package:news_app/core/constant.dart';
import 'package:news_app/core/custom_button.dart';
import 'package:news_app/core/toast.dart';
import 'package:news_app/screens/main_screen/data/models/news_model.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsDetailsScreen extends StatelessWidget {
  final Article? artical;
  const NewsDetailsScreen({Key? key, this.artical}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kSpecialTextFieldHintColor,
          automaticallyImplyLeading: true,
          title: Text(
            artical!.title!,
            style: const TextStyle(
              color: kBlackColor,
              fontSize: 26.0,
            ),
          ),
        ),
        floatingActionButton: customButton(
          onTap: artical?.url == null
              ? null
              : () async {
                  if (kDebugMode) {
                    print('websiteUrl: ${artical!.url}');
                  }
                  try {
                    await launchUrl(Uri.parse(artical!.url!));
                  } catch (e) {
                    if (kDebugMode) {
                      print(e);
                    }
                    customToast(e.toString());
                  }
                },
          title: 'Article\u0027s website',
          // TextColor: kWhiteColor,
          // bottomColor: kDeepBlueColor,
          TextColor: kWhiteColor,
          bottomColor: kDeepBlueColor,
          height: MediaQuery.sizeOf(context).height * .08,
          width: MediaQuery.sizeOf(context).width * .9,
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: MediaQuery.sizeOf(context).height * .3,
                  width: MediaQuery.sizeOf(context).width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    image: DecorationImage(
                        image: NetworkImage(artical?.urlToImage ??
                            'https://media.istockphoto.com/id/1409329028/vector/no-picture-available-placeholder-thumbnail-icon-illustration-design.jpg?s=612x612&w=0&k=20&c=_zOuJu755g2eEUioiOUdz_mHKJQJn-tDgIAhQzyeKUQ='),
                        fit: BoxFit.fill),
                  ),
                ),
                heght20,
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Title: ',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 16.0,
                        color: kBlackColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width * .75,
                      child: Text(
                        artical?.title ?? 'NA',
                        style: const TextStyle(
                          fontSize: 16.0,
                          color: lightGreyColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
                heght10,
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Author: ',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 16.0,
                        color: kBlackColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width * .75,
                      child: Text(
                        artical?.author ?? 'NA',
                        style: const TextStyle(
                          fontSize: 16.0,
                          color: lightGreyColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
                heght10,
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Source: ',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 16.0,
                        color: kBlackColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width * .75,
                      child: Text(
                        artical?.source?.name ?? 'NA',
                        style: const TextStyle(
                          fontSize: 16.0,
                          color: lightGreyColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
                heght10,
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Published At: ',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 16.0,
                        color: kBlackColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width * .6,
                      child: Text(
                        artical?.publishedAt != null
                            ? DateFormat('d/M/y').format(artical!.publishedAt!)
                            : 'NA',
                        style: const TextStyle(
                          fontSize: 16.0,
                          color: lightGreyColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
                heght10,
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Discription: ',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 16.0,
                        color: kBlackColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width * .6,
                      child: Text(
                        artical?.description ?? 'NA',
                        style: const TextStyle(
                          fontSize: 16.0,
                          color: lightGreyColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
                heght10,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
