import 'package:blog_app/core/utils/calcualte_reading_time.dart';
import 'package:blog_app/features/blog/domain/entities/blog.dart';
import 'package:blog_app/features/blog/presentation/pages/blog_viewer_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class BlogCard extends StatelessWidget {
  final Blog blog;
  final Color color;
  const BlogCard({
    super.key,
    required this.blog,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, BlogViewerPage.route(blog)); 
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 16,vertical: 4),
        padding: EdgeInsets.all(16),
        decoration:
            BoxDecoration(borderRadius: BorderRadius.circular(10), color: color),
        height: 200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
               crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                
                SingleChildScrollView(
                
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: blog.topics
                        .map(
                          (e) => Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Chip(
                              label: Text(e),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
                Text(blog.title,style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
              ],
            ),
            
            Text(' ${ CalculateReadingTime(blog.content)} min'),
          ],
        ),
      ),
    );
  }
}
